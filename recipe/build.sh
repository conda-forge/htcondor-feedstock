#!/bin/bash

set -ex

_builddir="_build"
rm -rf ${_builddir}
mkdir -pv ${_builddir}
pushd ${_builddir}

# if cross compiling, unset the _CONDA_PYTHON_SYSCONFIGDATA_NAME variable
# so that sphinx can use the build-platform's python
if [[ "${build_platform}" != "${target_platform}" ]]; then
	unset _CONDA_PYTHON_SYSCONFIGDATA_NAME
fi

# platform-specific options
if [ "$(uname)" == "Linux" ]; then
	export LDFLAGS="-ldl -lrt ${LDFLAGS}"
	WITH_MUNGE="TRUE"
	WITH_VOMS="TRUE"
else
	WITH_MUNGE="FALSE"
	WITH_VOMS="FALSE"
fi

# configure
cmake \
	$SRC_DIR \
	${CMAKE_ARGS} \
	-D_VERBOSE:BOOL=TRUE \
	-DBUILD_SHARED_LIBS:BOOL=TRUE \
	-DBUILD_TESTING:BOOL=FALSE \
	-DCMAKE_CROSSCOMPILING_EMULATOR:STRING="${CMAKE_CROSSCOMPILING_EMULATOR}" \
	-DDLOPEN_GSI_LIBS:BOOL=FALSE \
	-DDLOPEN_SECURITY_LIBS:BOOL=FALSE \
	-DDLOPEN_VOMS_LIBS:BOOL=FALSE \
	-DENABLE_JAVA_TESTS:BOOL=FALSE \
	-DHAVE_BOINC:BOOL=FALSE \
	-DPROPER:BOOL=TRUE \
	-DPYTHON_EXECUTABLE:FILEPATH=FALSE \
	-DPYTHON3_EXECUTABLE:FILEPATH=FALSE \
	-DUW_BUILD:BOOL=FALSE \
	-DWANT_CONTRIB:BOOL=FALSE \
	-DWANT_FULL_DEPLOYMENT:BOOL=FALSE \
	-DWANT_MAN_PAGES:BOOL=TRUE \
	-DWITH_BLAHP:BOOL=FALSE \
	-DWITH_BOINC:BOOL=FALSE \
	-DWITH_BOSCO:BOOL=FALSE \
	-DWITH_CAMPUSFACTORY:BOOL=FALSE \
	-DWITH_CREAM:BOOL=FALSE \
	-DWITH_GANGLIA:BOOL=TRUE \
	-DWITH_GLOBUS:BOOL=FALSE \
	-DWITH_KRB5:BOOL=TRUE \
	-DWITH_MUNGE:BOOL=${WITH_MUNGE} \
	-DWITH_PYTHON_BINDINGS:BOOL=FALSE \
	-DWITH_SCITOKENS:BOOL=TRUE \
	-DWITH_VOMS:BOOL=${WITH_VOMS} \
;

# build
cmake --build . --parallel ${CPU_COUNT} --verbose

# install
cmake --build . --parallel ${CPU_COUNT} --verbose --target install

# -- POST

# move the man page for classads into the right directory
mkdir -p ${PREFIX}/share/man/man7/
mv ${PREFIX}/share/man/man1/classads.7 ${PREFIX}/share/man/man7/

# -- create the condor_config file

CONDOR_CONFIG_LOCATION="etc/condor/condor_config"
install -m 0644 ${RECIPE_DIR}/condor_config ${PREFIX}/${CONDOR_CONFIG_LOCATION}

# -- create activate/deactivate scripts

# activate.sh
ACTIVATE_SH="${PREFIX}/etc/conda/activate.d/activate_condor.sh"
mkdir -p $(dirname ${ACTIVATE_SH})
cat > ${ACTIVATE_SH} << EOF
#!/bin/bash
export CONDA_BACKUP_CONDOR_CONFIG="\${CONDOR_CONFIG:-empty}"
export CONDOR_CONFIG="/opt/anaconda1anaconda2anaconda3/${CONDOR_CONFIG_LOCATION}"
EOF

# deactivate.sh
DEACTIVATE_SH="${PREFIX}/etc/conda/deactivate.d/deactivate_condor.sh"
mkdir -p $(dirname ${DEACTIVATE_SH})
cat > ${DEACTIVATE_SH} << EOF
#!/bin/bash
if [ "\${CONDA_BACKUP_CONDOR_CONFIG}" = "empty" ]; then
	unset CONDOR_CONFIG
else
	export CONDOR_CONFIG="\${CONDA_BACKUP_CONDOR_CONFIG}"
fi
unset CONDA_BACKUP_CONDOR_CONFIG
EOF

if [[ "$target_platform" == linux-* ]]; then
  $READELF -d $PREFIX/bin/classad_version
fi

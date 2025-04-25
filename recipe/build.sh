#!/bin/bash

set -ex

# get common configuration
. "${RECIPE_DIR}/common.sh"

# create build directory
_builddir="_build"
rm -rf ${_builddir}
mkdir -pv ${_builddir}
pushd ${_builddir}

# configure
cmake \
  ${SRC_DIR} \
  ${HTCONDOR_CMAKE_ARGS} \
  -DCMAKE_CROSSCOMPILING_EMULATOR:STRING=${CMAKE_CROSSCOMPILING_EMULATOR} \
  -DPython_EXECUTABLE:FILEPATH=FALSE \
  -DPython3_EXECUTABLE:FILEPATH=FALSE \
  -DWITH_PYTHON_BINDINGS:BOOL=FALSE \
  -DWITH_PYTHON_BINDINGS_V2:BOOL=FALSE \
  -DWITH_PYTHON_BINDINGS_V3:BOOL=FALSE \
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

CONDOR_CONFIG_DIR="etc/condor"
CONDOR_CONFIG_LOCATION="${CONDOR_CONFIG_DIR}/condor_config"
mkdir -p ${PREFIX}/${CONDOR_CONFIG_DIR}
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

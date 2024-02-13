#!/bin/bash
set -eux

# get common configuration
. "${RECIPE_DIR}/common.sh"

# create build directory
_builddir="_build${PY_VER}"
rm -rf ${_builddir}
mkdir -pv ${_builddir}
pushd ${_builddir}

# configure
cmake $SRC_DIR \
	-D_VERBOSE:BOOL=TRUE \
	-DBUILD_DAEMONS:BOOL=FALSE \
	-DBUILD_SHARED_LIBS:BOOL=TRUE \
	-DBUILD_TESTING:BOOL=FALSE \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_DISABLE_FIND_PACKAGE_Python2:BOOL=true \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
	-DCMAKE_INSTALL_LIBDIR:PATH="lib" \
	-DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
	-DENABLE_JAVA_TESTS:BOOL=FALSE \
	-DHAVE_BOINC:BOOL=FALSE \
	-DHAVE_EXT_GLOBUS:BOOL=FALSE \
	-DPROPER:BOOL=TRUE \
	-DPython3_EXECUTABLE:FILE=${PYTHON} \
	-DPYTHON3_BOOST_LIB:STRING=boost_python${PY_VER/./} \
	-DUW_BUILD:BOOL=FALSE \
	-DWANT_CONTRIB:BOOL=FALSE \
	-DWANT_FULL_DEPLOYMENT:BOOL=FALSE \
	-DWANT_MAN_PAGES:BOOL=FALSE \
	-DWANT_PYTHON2_BINDINGS:BOOL=FALSE \
	-DWANT_PYTHON3_BINDINGS:BOOL=TRUE \
	-DWITH_BLAHP:BOOL=FALSE \
	-DWITH_BOINC:BOOL=FALSE \
	-DWITH_BOSCO:BOOL=FALSE \
	-DWITH_CAMPUSFACTORY:BOOL=FALSE \
	-DWITH_CREAM:BOOL=FALSE \
	-DWITH_GANGLIA:BOOL=FALSE \
	-DWITH_GLOBUS:BOOL=FALSE \
	-DWITH_KRB5:BOOL=FALSE \
	-DWITH_MUNGE:BOOL=FALSE \
	-DWITH_SCITOKENS:BOOL=FALSE \
	-DWITH_VOMS:BOOL=FALSE

# build
cmake --build src/python-bindings --parallel ${CPU_COUNT} --verbose
cmake --build bindings/python --parallel ${CPU_COUNT} --verbose

# install
cmake --build src/python-bindings --parallel ${CPU_COUNT} --verbose --target install
cmake --build bindings/python --parallel ${CPU_COUNT} --verbose --target install

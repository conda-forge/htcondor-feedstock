#!/bin/bash
set -eux

# get common configuration
. "${RECIPE_DIR}/common.sh"

# create build directory
_builddir="_build${PY_VER}"
rm -rf ${_builddir}
mkdir -pv ${_builddir}
pushd ${_builddir}

# if cross-compiling, hardcode the SOABI to help CMake
if [ "${build_platform}" != "${target_platform}" ]; then
  PYTHON_EXTENSION_SUFFIX=$(${PYTHON}${PY_VER}-config --extension-suffix | cut -d. -f2)
  HTCONDOR_CMAKE_ARGS="${HTCONDOR_CMAKE_ARGS} -DPython3_SOABI:STRING=${PYTHON_EXTENSION_SUFFIX}"
fi

# configure
cmake \
  ${SRC_DIR} \
  ${HTCONDOR_CMAKE_ARGS} \
  -DPython3_EXECUTABLE:FILE=${PYTHON} \
  -DPYTHON3_BOOST_LIB:STRING=boost_python${PY_VER/./} \
  -DWANT_PYTHON3_BINDINGS:BOOL=TRUE \
  -DWITH_PYTHON_BINDINGS:BOOL=TRUE \
;

# build
cmake --build src/python-bindings --parallel ${CPU_COUNT} --verbose
cmake --build bindings/python --parallel ${CPU_COUNT} --verbose

# install
cmake --build src/python-bindings --parallel ${CPU_COUNT} --verbose --target install
cmake --build bindings/python --parallel ${CPU_COUNT} --verbose --target install

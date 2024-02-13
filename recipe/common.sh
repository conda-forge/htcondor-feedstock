#!/bin/bash
#
# Common build configuration for all HTCondor
# components
#

# if cross compiling, unset the _CONDA_PYTHON_SYSCONFIGDATA_NAME variable
# so that sphinx can use the build-platform's python
if [[ "${build_platform}" != "${target_platform}" ]]; then
  unset _CONDA_PYTHON_SYSCONFIGDATA_NAME
fi

# platform-specific options
if [[ "${target_platform}" == linux* ]]; then
  export LDFLAGS="-ldl -lrt ${LDFLAGS}"
  export CXXFLAGS="${CXXFLAGS} -D_GNU_SOURCE"
elif [[ "${target_ploatfmr}" == osx* ]]; then
  # ignore libc++ availability checks
  # see https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
	CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

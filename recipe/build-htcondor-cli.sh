#!/bin/bash
set -eux

HTCONDOR_CLI_SRC_DIR="${SRC_DIR}/src/condor_tools"

# install the htcondor_cli Python library
mkdir -pv "${SP_DIR}/"
cp -rv "${HTCONDOR_CLI_SRC_DIR}/htcondor_cli" "${SP_DIR}/"

# install the console script
mkdir -pv "${PREFIX}/bin/"
install -m 0755 -v "${HTCONDOR_CLI_SRC_DIR}/htcondor" "${PREFIX}/bin/"

# create some ad-hoc metadata
DIST_INFO_DIR="${SP_DIR}/${PKG_NAME/-/_}-${PKG_VERSION/-/_}.dist-info"
mkdir -pv ${DIST_INFO_DIR}/
cat <<EOF >${DIST_INFO_DIR}/METADATA
Metadata-Version: 2.3
Name: ${PKG_NAME}
Version: ${PKG_VERSION}
Summary: HTCondor CLI tool
Home-page: https://htcondor.org
License: Apache-2.0
Provides: ${PKG_NAME}
EOF
cat <<EOF >${DIST_INFO_DIR}/INSTALLER
HTCondor on conda-forge
EOF
cat <<EOF >${DIST_INFO_DIR}/entry_points.txt
[console_scripts]
htcondor = htcondor_cli.cli:main
EOF

#!/bin/bash
export DISABLE_AUTOBREW=1

# workarond conda-forge/r-base-feedstock#163
export PKG_CPPFLAGS="-DHAVE_WORKING_LOG1P"

sed -i.bak 's/${PROJ_LIBS}/${PROJ_LIBS} ${LDFLAGS}/g' configure
sed -i.bak 's/${LIBS}/${LIBS} ${LDFLAGS}/g' configure

# shellcheck disable=SC2086
${R} CMD INSTALL --build . ${R_ARGS}

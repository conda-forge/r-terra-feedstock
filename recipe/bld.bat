sed -i -e "s/static constexpr T value/static const T value/" src/NA.h
sed -i -e "s/void R_init_terra/__declspec(dllexport) void R_init_terra/" src/RcppExports.cpp
set PKG_CXXFLAGS=-Wno-static-float-init

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

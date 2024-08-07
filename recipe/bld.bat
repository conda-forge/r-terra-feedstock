set "PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig"

REM begin debug (why pkg-config fails)
@echo on
echo %PKG_CONFIG_PATH%
dir /a /b "%PKG_CONFIG_PATH%"
type "%PKG_CONFIG_PATH%\gdal.pc"
type "%PKG_CONFIG_PATH%\geos.pc"
type "%PKG_CONFIG_PATH%\proj.pc"
pkg-config --version
pkg-config --libs gdal geos proj
REM end debug

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

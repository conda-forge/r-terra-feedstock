set "PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig"

REM begin debug (why pkg-config fails)
echo %PKG_CONFIG_PATH%
dir /a /b "%PKG_CONFIG_PATH%"
pkg-config --version
pkg-config --libs gdal geos proj
REM end debug

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

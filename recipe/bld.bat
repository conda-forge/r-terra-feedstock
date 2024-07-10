set "PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig"
"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

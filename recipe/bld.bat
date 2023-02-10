set "LIBRARY_PREFIX_CYG=%LIBRARY_PREFIX:\=/%"
set "LIBRARY_PREFIX_CYG=/%LIBRARY_PREFIX_CYG::=%"

:: rebuild Makevars.win from scratch
bash ./configure
bash -c "mv src/Makevars src/Makevars.win"

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

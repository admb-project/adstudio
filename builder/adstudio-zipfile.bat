@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   adstudio-zipfile                                                 #
REM                                                                            #
REM Purpose:  Build AD Studio as a zip file                                    #
REM                                                                            #
REM Requires: Directory 'distribution' created by adstudio-distribution        #
REM                                                                            #
REM Returns:  Creates adstudio.zip in the current directory                    #
REM                                                                            #
REM ############################################################################

set CON=https://github.com/admb-project/adstudio/releases/download/construction

echo on
@echo.

@pushd distribution

@echo *** Zipping adstudio.zip ...
@powershell Invoke-WebRequest -OutFile zip.exe %CON%/zip.exe
zip -rS ..\adstudio.zip ~ admb gnu Rtools
@del zip.exe
@popd
@echo.
@echo Done

@goto EOF

:HELP
echo Usage: adstudio-zipfile
echo.

:EOF

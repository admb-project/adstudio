@echo off
setlocal
if [%1]==[--help] goto HELP
REM ############################################################################
REM                                                                            #
REM Script:   adstudio-components                                              #
REM                                                                            #
REM Purpose:  Download AD Studio components                                    #
REM                                                                            #
REM Returns:  Creates a directory called 'components'                          #
REM                                                                            #
REM ############################################################################

set ADMB=admb120-gcc493-win64.zip
set AUCTEX=auctex121-built.zip
set EMACS=emacs-25.3_1-x86_64.zip
set ESS=ess-17.11.zip
set INNO=innoextract-1.6-windows.zip
set RTOOLS=Rtools34.exe
set VERSION=12.0

set CONS=https://github.com/admb-project/adstudio/releases/download/construction
set DOCS=https://github.com/admb-project/admb/releases/download/admb-12.0
set GITHUB=https://raw.githubusercontent.com
set MANUAL=https://github.com/admb-project/adstudio/releases/download/manual

set PSDOWNLOAD=(New-Object System.Net.WebClient).DownloadFile

echo on
@echo.

@rd /q /s components 2>NUL
@md components
@pushd components

@echo *** Copying components ...
@set CP=robocopy
%CP% ..\..\icons icons /e > NUL
%CP% ..\..\dot . .emacs > NUL
%CP% ..\.. . NEWS > NUL
@echo.

@echo *** Downloading components ...
@powershell "%PSDOWNLOAD%('%CONS%/wget.exe', 'wget.exe')"
@set WGET=wget -q --no-check-certificate
%WGET% -P admb %GITHUB%/admb-project/admb/master/contrib/emacs/admb.el
%WGET% -P admb %GITHUB%/admb-project/admb/master/contrib/emacs/LICENSE
%WGET% -P admb %GITHUB%/admb-project/admb/master/contrib/emacs/NEWS
%WGET% -P tmb %GITHUB%/kaskr/adcomp/master/emacs/tmb.el
%WGET% -P tmb %GITHUB%/kaskr/adcomp/master/emacs/LICENSE
%WGET% -P tmb %GITHUB%/kaskr/adcomp/master/emacs/NEWS
%WGET% %DOCS%/admb-%VERSION%.pdf
%WGET% %CONS%/%ADMB%
%WGET% %DOCS%/admbre-%VERSION%.pdf
%WGET% %MANUAL%/adstudio.pdf
%WGET% %CONS%/%AUCTEX%
%WGET% %DOCS%/autodif-%VERSION%.pdf
%WGET% http://ftp.gnu.org/gnu/emacs/windows/%EMACS%
%WGET% http://ess.r-project.org/downloads/ess/%ESS%
%WGET% http://constexpr.org/innoextract/files/%INNO%
%WGET% https://jblevins.org/projects/markdown-mode/markdown-mode.el
%WGET% https://cran.r-project.org/bin/windows/Rtools/%RTOOLS%
@del wget.exe
@echo.

@echo *** Unpacking components ...
@powershell "%PSDOWNLOAD%('%CONS%/unzip.exe', 'unzip.exe')"
unzip -q -d %ADMB:.zip=% %ADMB%
unzip -q -d auctex %AUCTEX%
unzip -q -d emacs %EMACS%
unzip -q %ESS%
@rename %ESS:.zip=% ess
unzip -q -d inno %INNO%
@move inno\innoextract.exe . >NUL
@rd /q /s inno
innoextract -s -d temp %RTOOLS%
@move temp\app Rtools >NUL
@rd /q /s temp
@del innoextract.exe
@del unzip.exe
@echo.

@echo *** Renaming manuals ...
rename admb-%VERSION%.pdf admb.pdf
rename admbre-%VERSION%.pdf admbre.pdf
rename autodif-%VERSION% autodif.pdf
@popd
echo.
@echo Done

@goto EOF

:HELP
echo Usage: adstudio-components
echo.

:EOF

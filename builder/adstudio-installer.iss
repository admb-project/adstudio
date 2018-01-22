[Setup]
OutputBaseFilename=adstudio
AppName=AD Studio
AppVerName=AD Studio 1.0
ChangesAssociations=yes
ChangesEnvironment=yes
DefaultDirName=c:\admb
DefaultGroupName=AD Studio
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputDir=..
SourceDir=distribution
UninstallDisplayIcon=~\icons\ad.ico

[Types]
Name: full;      Description: "Full installation"
Name: havetools; Description: "I already have Rtools"
Name: custom;    Description: "Custom installation"; Flags: iscustom

[Components]
Name: admb;           Description: "AD Model Builder [c:/admb]";       Types: full havetools
Name: emacs;          Description: "Emacs editor [c:/gnu/emacs]";      Types: full havetools
Name: emacs/packages; Description: "Emacs packages [c:/~/emacs/lisp]"; Types: full havetools
Name: emacs/settings; Description: "Emacs settings [c:/~/.emacs]";     Types: full havetools
Name: rtools;         Description: "Rtools GCC and GDB [c:/Rtools]";   Types: full

[Tasks]
Name: desktop;   Description: "Create Desktop shortcut to AD Studio";                                              GroupDescription: "Shortcuts:"
Name: startmenu; Description: "Create Start Menu shortcut to AD Studio";                                           GroupDescription: "Shortcuts:"
Name: assoc1;    Description: "Associate ADMB files (cor, ctl, dat, par, pin, psv, rep, std, tpl) with AD Studio"; GroupDescription: "Registry:"
Name: assoc2;    Description: "Associate Emacs files (el, emacs) with AD Studio";                                  GroupDescription: "Registry:"
Name: assoc3;    Description: "Associate other files (cpp, md, r, tex) with AD Studio";                            GroupDescription: "Registry:"
Name: path;      Description: "Add ADMB, Emacs, GCC, and GDB to PATH, so they can find each other";                GroupDescription: "Registry:"
Name: admbhome;  Description: "Define ADMB_HOME as c:/admb/admb120-gcc493-win64, so ADMB works";                   GroupDescription: "Registry:"
Name: home;      Description: "Define HOME directory as c:/~, to store configuration files";                       GroupDescription: "Registry:"

[Files]
Source: "admb\*";         DestDir: "c:\admb";         Components: admb;           Flags: recursesubdirs
Source: "~/icons\*";      DestDir: "c:\~\icons";      Components: emacs
Source: "gnu\emacs\*";    DestDir: "c:\gnu\emacs";    Components: emacs;          Flags: recursesubdirs
Source: "~/emacs\lisp\*"; DestDir: "c:\~\emacs\lisp"; Components: emacs/packages; Flags: recursesubdirs
Source: "~/.emacs";       DestDir: "c:\~";            Components: emacs/settings; Flags: confirmoverwrite
Source: "Rtools\*";       DestDir: "c:\Rtools";       Components: rtools;         Flags: onlyifdoesntexist recursesubdirs

[Icons]
Name: "{userdesktop}\AD Studio";     Filename: "c:\gnu\emacs\bin\runemacs.exe"; IconFilename: "c:\~\icons\ad.ico"; Tasks: desktop
Name: "{group}\AD Studio";           Filename: "c:\gnu\emacs\bin\runemacs.exe"; IconFilename: "c:\~\icons\ad.ico"; Tasks: startmenu
Name: "{group}\Manual (ADMB)";       Filename: "c:\admb\admb.pdf";                                                 Tasks: startmenu
Name: "{group}\Manual (AD Studio)";  Filename: "c:\admb\adstudio.pdf";                                             Tasks: startmenu
Name: "{group}\Manual (ADMB-RE)";    Filename: "c:\admb\admbre.pdf";                                               Tasks: startmenu
Name: "{group}\Manual (AUTODIF)";    Filename: "c:\admb\autodif.pdf";                                              Tasks: startmenu
Name: "{group}\Uninstall AD Studio"; Filename: "{uninstallexe}";                                                   Tasks: startmenu

[Registry]
; Environment variables
Root: HKCU; Subkey: "Environment"; ValueType: string; ValueName: "PATH";      ValueData: "c:/ADMB/admb120-gcc493-win64/bin;c:/rtools/MINGW_64/bin;c:/gnu/EMACS/bin"; Tasks: path;     Flags: uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType: string; ValueName: "HOME";      ValueData: "c:/~";                                                                     Tasks: home;     Flags: uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType: string; ValueName: "ADMB_HOME"; ValueData: "c:/ADMB/admb120-gcc493-win64";                                             Tasks: admbhome; Flags: uninsdeletevalue
; File associations
Root: HKCR; Subkey: ".cor";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Correlation";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Correlation";                               ValueType: string; ValueName: ""; ValueData: "ADMB Correlation";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Correlation\DefaultIcon";                   ValueType: string; ValueName: ""; ValueData: "shell32.dll,105";                     Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Correlation\Shell\Open\command";            ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".cpp";                                           ValueType: string; ValueName: ""; ValueData: "C++ Source Code";                     Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "C++ Source Code";                                ValueType: string; ValueName: ""; ValueData: "C++ Source Code";                     Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "C++ Source Code\DefaultIcon";                    ValueType: string; ValueName: ""; ValueData: "c:\~\icons\cpp.ico";                  Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: "C++ Source Code\Shell\Open\command";             ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".ctl";                                           ValueType: string; ValueName: ""; ValueData: "Control File";                        Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Control File";                                   ValueType: string; ValueName: ""; ValueData: "Control File";                        Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Control File\DefaultIcon";                       ValueType: string; ValueName: ""; ValueData: "shell32.dll,211";                     Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Control File\Shell\Open\command";                ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".dat";                                           ValueType: string; ValueName: ""; ValueData: "Data File";                           Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Data File";                                      ValueType: string; ValueName: ""; ValueData: "Data File";                           Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Data File\DefaultIcon";                          ValueType: string; ValueName: ""; ValueData: "shell32.dll,217";                     Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Data File\Shell\Open\command";                   ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".el";                                            ValueType: string; ValueName: ""; ValueData: "Emacs Lisp Code";                     Tasks: assoc2; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Emacs Lisp Code";                                ValueType: string; ValueName: ""; ValueData: "Emacs Lisp Code";                     Tasks: assoc2; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Emacs Lisp Code\DefaultIcon";                    ValueType: string; ValueName: ""; ValueData: "shell32.dll,69";                      Tasks: assoc2; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Emacs Lisp Code\Shell\Open\command";             ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc2; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".emacs";                                         ValueType: string; ValueName: ""; ValueData: "Emacs Lisp Code";                     Tasks: assoc2; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: ".md";                                            ValueType: string; ValueName: ""; ValueData: "Markdown Document";                   Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Markdown Document";                              ValueType: string; ValueName: ""; ValueData: "Markdown Document";                   Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "Markdown Document\DefaultIcon";                  ValueType: string; ValueName: ""; ValueData: "c:\~\icons\md.ico";                   Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Markdown Document\Shell\Open\command";           ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".par";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Point Estimates";                Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Point Estimates";                           ValueType: string; ValueName: ""; ValueData: "ADMB Point Estimates";                Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Point Estimates\DefaultIcon";               ValueType: string; ValueName: ""; ValueData: "shell32.dll,99";                      Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Point Estimates\Report\Shell\Open\command"; ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".pin";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Initial Values";                 Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Initial Values";                            ValueType: string; ValueName: ""; ValueData: "ADMB Initial Values";                 Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Initial Values\DefaultIcon";                ValueType: string; ValueName: ""; ValueData: "shell32.dll,211";                     Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Initial Values\Shell\Open\command";         ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".psv";                                           ValueType: string; ValueName: ""; ValueData: "ADMB MCMC Binary";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB MCMC Binary";                               ValueType: string; ValueName: ""; ValueData: "ADMB MCMC Binary";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB MCMC Binary\DefaultIcon";                   ValueType: string; ValueName: ""; ValueData: "shell32.dll,165";                     Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".R";                                             ValueType: string; ValueName: ""; ValueData: "R Source Code";                       Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "R Source Code";                                  ValueType: string; ValueName: ""; ValueData: "R Source Code";                       Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "R Source Code\DefaultIcon";                      ValueType: string; ValueName: ""; ValueData: "c:\~\icons\gnu_gray.ico";             Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: "R Source Code\Shell\Open\command";               ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".rep";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Report";                         Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Report";                                    ValueType: string; ValueName: ""; ValueData: "ADMB Report";                         Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Report\DefaultIcon";                        ValueType: string; ValueName: ""; ValueData: "shell32.dll,21";                      Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Report\Shell\Open\command";                 ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".std";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Standard Error";                 Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Standard Error";                            ValueType: string; ValueName: ""; ValueData: "ADMB Standard Error";                 Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Standard Error\DefaultIcon";                ValueType: string; ValueName: ""; ValueData: "shell32.dll,99";                      Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Standard Error\Report\Shell\Open\command";  ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".tex";                                           ValueType: string; ValueName: ""; ValueData: "LaTeX Document";                      Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "LaTeX Document";                                 ValueType: string; ValueName: ""; ValueData: "LaTeX Document";                      Tasks: assoc3; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "LaTeX Document\DefaultIcon";                     ValueType: string; ValueName: ""; ValueData: "c:\~\icons\tex.ico";                  Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: "LaTeX Document\Shell\Open\command";              ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc3; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".tpl";                                           ValueType: string; ValueName: ""; ValueData: "ADMB Source Code";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Source Code";                               ValueType: string; ValueName: ""; ValueData: "ADMB Source Code";                    Tasks: assoc1; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "ADMB Source Code\DefaultIcon";                   ValueType: string; ValueName: ""; ValueData: "shell32.dll,84";                      Tasks: assoc1; Flags: uninsdeletevalue
Root: HKCR; Subkey: "ADMB Source Code\Shell\Open\command";            ValueType: string; ValueName: ""; ValueData: "c:\gnu\emacs\bin\runemacs ""%1""";    Tasks: assoc1; Flags: uninsdeletevalue

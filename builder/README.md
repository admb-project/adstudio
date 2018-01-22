# AD Studio Builder

## Overview

This directory implements an automated build procedure for AD Studio. The
automation serves two purposes: (a) continuous integration, and (b) streamlining
the work required for an official AD Studio release. It consists of four
scripts:

```
            adstudio-components.bat       ->  [components]
                    |
            adstudio-distribution.bat     ->  [distribution]
                    |
        +-----------+-----------+
        |                       |
adstudio-installer.iss  adstudio-zip.bat  ->  adstudio.exe, adstudio.zip
```

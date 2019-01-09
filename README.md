# AD Studio

### Main features

- Dedicated environment for developing ADMB and TMB models
- Uses the C++ compiler from Rtools
- Based on the Emacs editor, but with simplified keybindings
- Especially good support for R, LaTeX, Markdown, GDB, and Git
- Flexible layout to arrange multiple files on screen
- Unification and successor of earlier ADMB-IDE and TMB-IDE

### Download version 1.0

*22 Jan 2018*

- [adstudio-10.exe](https://github.com/admb-project/adstudio/releases/download/1.0/adstudio-10.exe)
  (installer)
- [adstudio-10.zip](https://github.com/admb-project/adstudio/releases/download/1.0/adstudio-10.zip)
  (individual components)
- [adstudio-10.pdf](https://github.com/admb-project/adstudio/releases/download/1.0/adstudio-10.pdf)
  (manual)

### Latest edition of the manual

*9 Jan 2019*

- [manual.pdf](https://github.com/admb-project/adstudio/releases/download/manual/adstudio.pdf)
  (updated as needed)

### "Emacs `admb-mode` and `tmb-mode` without the Emacs"

One of the main goals of AD Studio is to make the convenient Emacs features of
`admb-mode` and `tmb-mode` available to non-Emacs users. In other words, to
disable the standard Emacs behavior.

Experienced Emacs users may prefer to ignore the AD Studio [.emacs](dot/.emacs)
file, and simply install and load ADMB Mode
([admb.el](https://github.com/admb-project/admb/blob/master/contrib/emacs/admb.el))
and TMB Mode
([tmb.el](https://github.com/kaskr/adcomp/blob/master/emacs/tmb.el)) like other
Emacs packages. They are written as standard "major modes" that follow all Emacs
mode conventions.

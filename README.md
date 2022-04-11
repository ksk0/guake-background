# What is guake-background?
**guake-background** is script used to set guake terminal background.
It's primarily used to set background to background color of current
vim/nvim colorscheme, but it cat also be used to set to any
other color.

While there are endless color schemes for vim, guake supports
only hard coded ones,  which does  not  necessarily  correspond to
scheme selected in vim. This script sets same background color
for guake terminal as for vim/neovim.

# Prerequisites
**guake-background** is `zsh` script, thus zsh shell must be installed
on system. If `zsh` shell is not present, installation script will
abort with error message.

# Installation
Clone repository to your system, cd to **guake-bacground** and run:
```
sudo make install
```

This will install **gauke-background** script. As part of
installation process, completion files for `bash` and `zsh` will also
be installed (if given shells are installed on system).  If given
shell is installed afterwards, repeat installation process to install
missing completion files.

You can remove **guake-background** from system by running:
```
sudo make uninstall
```

# Usage

```
usage: guake-background set [COLOR]

COLOR:
 vi     - use background color of current vi colorscheme
 vim    - use background color of current vim colorscheme
 nvim   - use background color of current nvim colorscheme
 COLOR  - use given hex num as background color
```

If no `COLOR` is given, script will find background color
of current colorscheme of first editor it encounters (with
given search order: nvim, vim and lastly vi).

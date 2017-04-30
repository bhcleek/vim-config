Installation
============

VIM directory
-------------
Checkout and create a link to the repository in your home directory. On \*nix: `ln -s $PWD ~/.vim`. On Windows `cmd /c mklink /J %USERPROFILE%\vimfiles $PWD`.

vimrc
-----
vimrc is your vimrc (e.g. .vimrc, \_vimrc, .vim/vimrc). You can rely on the behavior of Vim to pick it up for you if you've already linked the VIM directory in the previous step. Alternatively, you can create a link to it in your home directory. On \*nix `ln -s _vimrc ~/.vimrc`, on Windows `cmd /c mklink /h %USERPROFILE%\_vimrc _vimrc`.

The vimrc configures Vim to conform to the XDG Base Directory specification.  Although it's not necessary, the vimrc file can be placed in $XDG_CONFIG_HOME/vim, and  Vim can be configured to read the vimrc from $XDG_CONFIG_HOME/vim/vimrc by setting VIMINIT:
```bash
XDG_VIMRC="${HOME}/.config/vim/vimrc"
if  [ -f "$XDG_VIMRC" ]
then
	export XDG_VIMRC
	export VIMINIT='let $MYVIMRC="$XDG_VIMRC" | source $MYVIMRC'
fi
```

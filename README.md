Installation
============

VIM directory
-------------
Checkout and create a link to it the repository in your home directory. On *nix: `ln -s $PWD ~/.vim`. On Windows `cmd /c mklink /J %USERPROFILE%\vimfiles $PWD`.

vimrc
-----
vimrc is your vimrc (e.g. .vimrc, _vimrc, .vim/vimrc). You can rely on the behavior of Vim to pick it up for you if you've already linked the VIM directory in the previous step. Alternatively, you can create a link to it in your home directory. On *nix `ln -s _vimrc ~/.vimrc`, on Windows `cmd /c mklink /h %USERPROFILE%\_vimrc _vimrc`.


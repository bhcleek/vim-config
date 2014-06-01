Installation
============

vimrc
-----
_vimrc is your vimrc (e.g. .vimrc, _vimrc). Create a link to it in your home directory. On *nix `ln -s _vimrc ~/.vimrc`, on Windows `cmd /c mklink /h %USERPROFILE%\_vimrc _vimrc`.

VIM directory
-------------
vimfiles is *surprise!* your $VIM directory. Create a link to it in your home directory. On *nix `ln -s vimfiles ~/.vim`, on Windows `cmd /c mklink /J %USERPROFILE%\vimfiles vimfiles`

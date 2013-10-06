Installation
============

submodules
----------
* install the submodules
	git submodule update --init

vimrc
-----
_vimrc is your vimrc (e.g. .vimrc, _vimrc). Create a link to it in your home directory. On *nix `ln -s _vimrc ~/.vimrc`, on Windows `mklink ~\_vimrc _vimrc`.

VIM directory
-------------
vimfiles is *surprise!* your $VIM directory. Create a link to it in your home directory. On *nix `ln -s vimfiles ~/.vim`, on Windows `mklink /J ~\vimfiles`

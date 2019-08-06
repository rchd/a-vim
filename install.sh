#!/bin/bash

function install_vim()
{
	sudo apt-get update
	sudo apt install vim gvim
}

function install_vim_plug(){

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_neccessy_software() {
	sudo apt-get update
	sudo	apt install git python R gcc g++
}

function install_vim_plug() {
	vim -c 'PlugInstall' -c 'qall'
}

function copy_init_vim_to_vimrc(){
	mv ~/.vimrc
	cp init.vim ~/.vimrc
}

#!/bin/sh

function install_vim_plug(){ #{{{
    if [[ ! -f "~/.vim/autoload/plug.vim" ]]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/\
            junegunn/vim-plug/master/plug.vim
    fi

}#}}}

function compile_youcompleteme(){ #{{{
    if [[ -d "~/.vim/YouCompleteMe" ]]; then
        cd ~/.vim/YouCompleteMe
    else
        git clone https://github.com/ycm-core/YouCompleteMe.git
        compile_youcompleteme
        ./install.py --clang-completer
    fi
}#}}}


function install_neccessy_software() { #{{{
    sudo apt-get update
    sudo	apt install git python R gcc g++
    #install the compile about youcompleteme
    sudo apt install build-essential cmake python-dev
}#}}}

function install_vim_plugin() { #{{{
    if [[ ! -f "~/.vim/autoload/plug.vim" ]]; then
        install_vim_plug
    else
        vim -c 'PlugInstall' -c 'qall'
    fi
}#}}}

function copy_init_vim_to_vimrc(){ #{{{
    mv ~/.vimrc
    cp init.vim ~/.vimrc
}#}}}

function main() { #{{{
    install_neccessy_software
    install_vim
    install_vim_plug
    copy_init_vim_to_vimrc
    install_vim_plugin
    compile_youcompleteme
}#}}}


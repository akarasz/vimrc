#!/bin/bash

BASEDIR=$(dirname $(realpath $0))

yesno() {
    local message="$1"
    local answer

    read -p "$message? [y/N] " answer
    [[ $answer =~ [yY] ]] && return 0 || return 1
}

install_youcompleteme() {
    echo "compile YouCompleteMe"
    echo "(NEEDS CMAKE, G++ AND PYTHON-DEVEL PACKAGES)"

    local YCM_BUILD=$BASEDIR/build/ycm_build

    mkdir -p $YCM_BUILD
    cd $YCM_BUILD

    cmake -G "Unix Makefiles" . $BASEDIR/ide-tools/YouCompleteMe/third_party/ycmd/cpp
    cmake --build . --target ycm_core
}

install_eclim() {
    local ECLIM_VERSION="2.6.0"
    local ECLIM_JAR="eclim_$ECLIM_VERSION.jar"

    local ECLIM_URL="https://github.com/ervandew/eclim/releases/download/$ECLIM_VERSION/$ECLIM_JAR"
    local ECLIPSE_HOME=${ECLIPSE_HOME:-$HOME/eclipse}

    if [ ! -d $ECLIPSE_HOME ]; then
        echo "eclipse has to be installed (and set $ECLIPSE_HOME)"
        return 1
    fi

    curl -O $ECLIM_URL -L
    java -jar -Dvim.files=$BASEDIR -Declipse.home=$ECLIPSE_HOME -jar $ECLIM_JAR install
    rm $ECLIM_JAR
}

# change working directory to vim home
echo "initialize bundles..."

cd $BASEDIR
git submodule update --init --recursive

yesno "Do you want to install YouCompleteMe" && install_youcompleteme
#yesno "Do you want to install eclim" && install_eclim

echo "done."


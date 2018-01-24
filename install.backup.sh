#!/usr/bin/env bash
############################# PARAMETERS
app_name='oh_my_vim'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.vim_runenv"
[ -z "$REPO_URI" ] && REPO_URI="https://github.com/smartcub/oh_my_vim.git"
[ -z "$VIMPLUG_URI" ] && VIMPLUG_URI="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
############################# BASIC TOOLS
msg()
{
    printf '%b\n' "$1" >&2
}

success()
{
    if [ "$ret" -eq '0' ];then
        # Insert mode, <C-v>u2714
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error()
{
    # Insert mode, <C-v>u2718
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

program_exists()
{
    local ret='0'
    # Check if program is available or not
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # Not available return 1
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_should_exist()
{
    program_exists $1

    # Throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You should have '$1' installed to continue."
    fi
}

variable_set()
{
    if [ -z "$1" ]; then
        error "You must setup your \$HOME environmental variable first!"
    fi
}

lnif()
{
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
}
############################# FUNCTIONS
old_backup()
{
    if [ -e "$1" ] || [ -e "$2" ] || [ -e "$3" ]; then
        msg "Attempt to backup your original vim configuration."
        today=`date +%Y%m%d_%s`
        mkdir -p $HOME/.vim_backup
        for i in "$1" "$2" "$3"; do
            # File or directory exists and NOT a link, rename it
            [ -e "$i" ] && [ ! -L "$i" ] && mv -v "$i" "$HOME/.vim_backup/$i.$today";
        done
        ret="$?"
        success "Your original vim configuration has been backed up."
    fi
}
setup_vimplug()
{
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    # Install vim-plug
    curl -fLo ~/.vim_runenv/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Setup all plug-ins
    vim \
        "+PlugInstall!" \
        "+PlugClean" \
        "+qall"

    export SHELL="$system_shell"
    ret="$?"
    success "Oh_my_vim Done! Enjoy!"
}

setup_dirs()
{
    mkdir -p ~/.vim_runenv/{autoload,colors,plugged,vimrcs}
    cp {./basic_settings.vim,./vim_global_env.vim,./plugins.vim,./vimrc} \
        ~/.vim_runenv/vimrcs
    if [ -f "~/.vimrc" ]; then
        rm -rf ~/.vimrc
    fi
    ln -s ~/.vim_runenv/vimrcs/vimrc ~/.vimrc
}

install_fonts()
{
    # Set source and target directories
    powerline_fonts_dir="$( cd "$( dirname "$0" )" && pwd )/fonts"

    # if an argument is given it is used to select which fonts to install
    prefix="$1"

    if test "$(uname)" = "Darwin" ; then
      # MacOS
      font_dir="$HOME/Library/Fonts"
    else
      # Linux
      font_dir="$HOME/.fonts"
      mkdir -p $font_dir
    fi

    # Copy all fonts to user fonts directory
    echo "Copying fonts..."
    find "$powerline_fonts_dir" \( -name "$prefix*.[ot]tf" -or -name "$prefix*.pcf.gz" \) -type f -print0 | xargs -0 -n1 -I % cp "%" "$font_dir/"

    # Reset font cache on Linux
    if which fc-cache >/dev/null 2>&1 ; then
        echo "Resetting font cache, this may take a moment..."
        fc-cache -f "$font_dir"
    fi

    echo "Powerline fonts installed to $font_dir"
}
setup_fonts()
{
    local curr_path=$(cd `dirname $0`; pwd)
    # Clone fonts
    git clone https://github.com/powerline/fonts.git
    curl -fLo ./fonts/FiraCode-Light.ttf --create-dirs https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Light.ttf
    # Install fonts
    install_fonts
    # Clean-up a bit
    cd $curr_path
    rm -rf fonts
    ret="$?"
    success "Fonts have been installed!"
}
setup_conf()
{
    # Record current time for modification time(sec based)
    local modtime=`date +%s`

    # Replace mtime in %gconf.xml
    # Use " instead of ' in sed because " is weak transfer, otherwise
    # variable modtime will not available!
    sed -i -e "s/mtime=\"[0-9]*\"/mtime=\"$modtime\"/g" %gconf.xml

    # Replace gnome scheme

    mkdir -p $HOME/.gconf/apps/gnome-terminal/profiles/Default/
    cp -f %gconf.xml $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml

    ret="$?"
    success "Terminal Scheme OK!"
}
############################# MAIN()
variable_set "$HOME"
program_should_exist "vim"
program_should_exist "git"

old_backup "$HOME/.vim" \
           "$HOME/.vimrc" \
           "$HOME/.gvimrc"

setup_fonts
setup_dirs
setup_conf
setup_vimplug

msg        "\nThanks for installing $app_name."
msg        "© `date +%Y` https://github.com/smartcub/"

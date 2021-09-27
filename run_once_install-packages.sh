#!/bin/sh

sudo pacman -S --needed --noconfirm \
    base-devel \
    openssh \
    netctl \
    bluez \
    bluez-utils \
    blueman \
    x11-ssh-askpass \
    git \
    subversion \
    gparted \
    dpkg

sudo pacman -S --needed --noconfirm \
    ispell \
    lxappearance \
    picom \
    nitrogen \
    rofi \
    xmobar \
    trayer \
    volumeicon \
    cabal-install \
    spotifyd \
    trash-cli \
    pwgen \
    stack \
    libqalculate \
    pamixer \
    ttf-font-awesome \
    otf-font-awesome \
    adapta-gtk-theme \
    papirus-icon-theme

sudo pacman -S --needed --noconfirm \
    feh \
    zathura \
    sxiv \
    renameutils \
    zathura-pdf-mupdf \
    featherpad \
    fontconfig \
    tmux \
    python \
    pyenv \
    python-virtualenvwrapper \
    python-pipenv \
    python-poetry \
    go \
    julia \
    r \
    nodejs \
    npm \
    yarn \
    rust \
    copyq \
    xsel \
    ncdu \
    tldr \
    syncthing \
    barrier \
    aria2 \
    inkscape \
    libreoffice-fresh

if [ ! -d $HOME/Downloads/paru ]; then
    MAINDIR=$PWD
    cd ~/Downloads
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $MAINDIR
fi

sudo pacman -S --needed --noconfirm \
    neofetch \
    ripgrep \
    neovim \
    python-pynvim \
    python-ueberzug \
    isync

if [ ! -d $HOME/npm-global/lib/node_modules/neovim ]; then
    mkdir ~/npm-global
    npm install -g neovim
fi
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if [ ! -d $HOME/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

if [ ! -d $HOME/.config/nnn/plugins ]; then
    curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
fi

paru -S --useask --batchinstall --cleanafter --removemake \
    emacs-git \
    mu \
    betterlockscreen \
    nnn-nerd \
    brave \
    spotify \
    devour \
    nerd-fonts-complete \
    layan-cursor-theme-git \
    alacritty-ligatures-git \
    kitty \
    noto-fonts-emoji \
    otf-alegreya \
    ttf-alegreya \
    otf-yanone-kaffeesatz \
    ttf-yanone-kaffeesatz \
    activitywatch-bin \
    zoom


paru -S --useask --batchinstall --cleanafter --removemake \
    bash-language-server \
    neovim-coc-git \
    dockerfile-language-server-bin \
    texlab \
    rust-analyzer \
    haskell-language-server-bin
# Install julia and R language servers manually

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install doom emacs
if [ ! -f ~/.emacs.d/bin/doom ]; then
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
fi

# install texlive stuff
sudo pacman -S --needed --noconfirm \
    texlive-bin \
    texlive-core \
    texlive-bibtexextra \
    texlive-fontsextra \
    texlive-formatsextra \
    texlive-latexextra \
    texlive-pictures \
    texlive-publishers \
    texlive-science

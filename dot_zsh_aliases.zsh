# Zsh aliases
# To be sourced in .zshrc

# Use bat with gruvbox theme
alias bat="bat --theme gruvbox"

# super user alias
alias _="sudo "

# clear aliases
alias clear="clear -x"
alias cls="clear"

# tmux aliases
alias tnew="tmux new -s"
alias tattach="tmux attach"
alias tdetach="tmux detach"
alias tkill="tmux kill-session -t"
alias tlist="tmux ls"

# Launch ipython with vim keybindings
alias vimipython="ipython --TerminalInteractiveShell.editing_mode=vi"


# Git aliases
alias gitplog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph --date=short"

# lsd aliases
alias l="lsd -lt --color always --icon always"
alias ll="lsd -lhAt --color always --icon always"
alias lg="exa -lag -s modified --git --color-scale"
alias ls="lsd --color always --icon always"
alias lt="lsd --tree --color always --icon always"
alias la="lsd -la --color always --icon always"
alias lsa="lsd -lah --color always --icon always"

# List only folders
alias folders="find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn"

# disk aliases
alias df="df -ahiT --total"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# mkdir alias
alias mkdir="mkdir -pv"

# users
alias userlist="cut -d: -f1 /etc/passwd"

# memory and process aliases
alias free="free -mt"
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# wget and curl aliases
alias wget="wget -c"
alias myip="curl http://ipecho.net/plain; echo"

# grep alias
alias grep="grep --color=auto"

# devour aliases
alias vlc="devour vlc"
alias mpv="devour mpv"
alias zathura="devour zathura"

# Gives version of programs installed
alias has="curl -sL https://git.io/_has | bash -s"

# Anaconda path export alias
alias exportconda="export PATH=$HOME/anaconda3/bin:$PATH"

# Chezmoi aliases
alias cz="chezmoi"
alias cza="chezmoi add"
alias cze="chezmoi edit"
alias czy="chezmoi apply"
alias czd="chezmoi diff"

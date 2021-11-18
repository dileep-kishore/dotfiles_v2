# Zsh functions
# To be sourced in .zshrc

# Display CSV file in a table in the terminal
showcsv() { column -s, -t < "$1" | less -#2 -N -S; }

# Convert softlink to hardlink
tohardlink() { ln -f "$(readlink -m "$1")" "$1"; }

# Recursively add files to git
gitrecadd() { git ls-files "$1" | grep "$2" | xargs git add }

# Shuffle order of input files and copy to destination
shufflecopy() { shuf -zn10 -e "$1" | xargs -0 cp -vt "$2" }

# Colored man pages
man() {
    env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;36m") \
      man "$@"
}
export MANPAGER="sh -c 'col -bx | bat --theme Dracula -l man -p'"

# Custom launch function
launch() {
    case $(file --mime-type "$@" -bL) in
       # Check for the mimetype of your file (This is POSIX regex)
       video/* | audio/* | image/gif)
          # Launch using your favorite application
          devour mpv "$@"
          ;;
       # So on and so forth...
       application/pdf | application/postscript)
          devour zathura "$@"
          ;;
       *) exit 1 ;;
    esac
}

# Get current host related info.
function sysinfo()
{
    echo -e "\n${BRed}System Informations:$NC " ; uname -a
    echo -e "\n${BRed}Online User:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Date :$NC " ; date
    echo -e "\n${BRed}Server stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Public IP Address :$NC " ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo -e "\n${BRed}CPU info :$NC "; cat /proc/cpuinfo ;
    echo -e "\n"
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Print current user's process list
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

# Scrot image to clipboard
function scrot_clip() { scrot -e "xclip -selection clipboard -t image/png -i $1" }

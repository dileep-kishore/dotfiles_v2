# This tmux statusbar config was created by tmuxline.vim
# on Tue, 06 Apr 2021

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#bfc7d5,bg=#474b59"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#939ede"
set -g status-style "none,bg=#333747"
set -g message-style "fg=#bfc7d5,bg=#474b59"
set -g pane-border-style "fg=#474b59"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none,fg=#939ede,bg=#333747"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#bfc7d5,bg=#333747"
set -g status-left "\
#[fg=#282828,bg=#939ede,italics,BOLD]  #S #[fg=#939ede,bg=#333747,BOLD,nounderscore,italics]\
"
set -g status-right "\
#[fg=#333747,bg=#333747,nobold,nounderscore,italics]\
#[fg=#bfc7d5,bg=#333747]  %a #[fg=#474b59,bg=#333747,nobold,nounderscore,noitalics]\
#[fg=#bfc7d5,bg=#474b59] #(uptime -p | cut -f 1-2 -d',' | cut -c 3-) #[fg=#939ede,bg=#474b59,BOLD,nounderscore,italics]\
#[fg=#282828,bg=#939ede]  #H \
"
setw -g window-status-format "\
#[fg=#333747,bg=#333747,nobold,nounderscore,noitalics]#[bg=#333747,fg=#bfc7d5] #I #W#[fg=#333747,bg=#333747,nobold,nounderscore,noitalics]\
"
setw -g window-status-current-format "\
#[fg=#333747,bg=#c792ea,BOLD,nounderscore,noitalics]#[fg=#292d3e,bg=#c792ea,BOLD] #I #W \
#F #[fg=#c792ea,bg=#333747,BOLD,nounderscore,noitalics]\
"

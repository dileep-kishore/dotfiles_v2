# This tmux statusbar config was created by tmuxline.vim
# on Sat, 12 Dec 2020

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#fbf1c7,bg=#504945"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#d79921"
set -g status-style "none,bg=#32302f"
set -g message-style "fg=#fbf1c7,bg=#504945"
set -g pane-border-style "fg=#504945"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none,fg=#d79921,bg=#32302f"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#fbf1c7,bg=#32302f"
set -g status-left "\
#[fg=#282828,bg=#d79921,italics,BOLD]  #S #[fg=#d79921,bg=#32302f,BOLD,nounderscore,italics]\
"
set -g status-right "\
#[fg=#32302f,bg=#32302f,nobold,nounderscore,italics]\
#[fg=#fbf1c7,bg=#32302f]  %a #[fg=#504945,bg=#32302f,nobold,nounderscore,noitalics]\
#[fg=#fbf1c7,bg=#504945] #(uptime -p | cut -f 1-2 -d',' | cut -c 3-) #[fg=#d79921,bg=#504945,BOLD,nounderscore,italics]\
#[fg=#282828,bg=#d79921]  #H \
"
setw -g window-status-format "\
#[fg=#32302f,bg=#32302f,nobold,nounderscore,noitalics]#[default] #I #W#[fg=#32302f,bg=#32302f,nobold,nounderscore,noitalics]\
"
setw -g window-status-current-format "\
#[fg=#32302f,bg=#cc241d,BOLD,nounderscore,noitalics]#[fg=#fbf1c7,bg=#cc241d,BOLD] #I #W \
#F #[fg=#cc241d,bg=#32302f,BOLD,nounderscore,noitalics]\
"

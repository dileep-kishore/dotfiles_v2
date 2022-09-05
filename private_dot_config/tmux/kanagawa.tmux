#!/usr/bin/env bash

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Kanagawa                                                 +
# version    1.0.0                                                    +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set-option -g status-justify centre
set-option -g status-keys vi
set-option -g status-position bottom
set -g status-left-length 150
set-option -g status-style fg=white,bg=#1F1F28

# Replace the location of the script.
git_status="#(~/.dotfiles/private_dot_config/tmux/git-status.sh #{pane_current_path})"

#+--- Bars LEFT ---+
# Session name
set -g status-left "#[fg=#1F1F28,bg=#7E9CD8,bold,italics]  #H #[bg=#1F1F28,fg=#7E9CD8,italics] #[bg=#1F1F28,fg=white,italics,nobold]#(uptime -p | cut -f 1-2 -d',' | cut -c 3-)"

#+--- Windows ---+
# Focus
set -g window-status-current-format "#[bg=#1F1F28,fg=#957FB8,bold,italics] #[fg=#1F1F28,bg=#957FB8]  #I•#W #F #[bg=#1F1F28,fg=#957FB8,bold,italics] "
# Unfocused
set -g window-status-format "#[fg=brightwhite,bg=#1F1F28,nobold,noitalics,nounderscore]   #I•#W #F  "

#+--- Bars RIGHT ---+
set -g status-right "#[fg=white,bg=#1F1F28,italics] %a #[bg=#1F1F28,fg=#7E9CD8] $git_status#[fg=#1F1F28,bg=#7E9CD8,bold,noitalics]#S"
set -g window-status-separator ""

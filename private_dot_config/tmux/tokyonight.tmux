#!/usr/bin/env bash

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Tokyo Night                                              +
# version    1.0.0                                                    +
# repository https://github.com/logico-dev/tokyo-night-tmux           +
# author     Lógico                                                   +
# email      hi@logico.com.ar                                         +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set-option -g status-justify centre
set-option -g status-keys vi
set-option -g status-position bottom
set -g status-left-length 150
set-option -g status-style fg=white,bg=#1a1b26

# Replace the location of the script.
git_status="#(~/.dotfiles/private_dot_config/tmux/git-status.sh #{pane_current_path})"

#+--- Bars LEFT ---+
# Session name
set -g status-left "#[fg=#1a1b26,bg=#7aa2f7,bold,italics]  #H #[bg=#1a1b26,fg=#7aa2f7,italics] #[bg=#1a1b26,fg=white,italics,nobold]#(uptime -p | cut -f 1-2 -d',' | cut -c 3-)"

#+--- Windows ---+
# Focus
set -g window-status-current-format "#[bg=#1a1b26,fg=#bb9af7,bold,italics] #[fg=#1a1b26,bg=#bb9af7]  #I•#W #F #[bg=#1a1b26,fg=#bb9af7,bold,italics] "
# Unfocused
set -g window-status-format "#[fg=brightwhite,bg=#1a1b26,nobold,noitalics,nounderscore]   #I•#W #F  "

#+--- Bars RIGHT ---+
set -g status-right "#[fg=white,bg=#1a1b26,italics] %a #[bg=#1a1b26,fg=#7aa2f7] $git_status#[fg=#1a1b26,bg=#7aa2f7,bold,noitalics]#S"
set -g window-status-separator ""

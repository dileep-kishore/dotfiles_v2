#!/usr/bin/env bash

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Catppuccin                                               +
# version    1.0.0                                                    +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# --> Catppuccin (Mocha)
thm_bg="#11111b"
thm_fg="#cdd6f4"
thm_cyan="#89dceb"
thm_black="#181825"
thm_gray="#45475a"
thm_magenta="#cba6f7"
thm_pink="#f5c2e7"
thm_red="#f38ba8"
thm_green="#a6e3a1"
thm_yellow="#f9e2af"
thm_blue="#89b4fa"
thm_orange="#fab387"
thm_black4="#585b70"
thm_base="#1e1e2e"

set-option -g status-justify centre
set-option -g status-keys vi
set-option -g status-position bottom
set -g status-left-length 150
set-option -g status-style fg=white,bg=#1e1e2e

# Replace the location of the script.
git_status="#(~/.dotfiles/private_dot_config/tmux/git-status.sh #{pane_current_path})"

#+--- Bars LEFT ---+
# Session name
set -g status-left "#[fg=#1e1e2e,bg=#89b4fa,bold,italics]  #H #[bg=#1e1e2e,fg=#89b4fa,italics] #[bg=#1e1e2e,fg=white,italics,nobold]#(uptime -p | cut -f 1-2 -d',' | cut -c 3-)"

#+--- Windows ---+
# Focus
set -g window-status-current-format "#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_bg,bg=$thm_magenta,bold,italics] #W #F "
# Unfocused
set -g window-status-format "#[fg=$thm_fg,bg=$thm_gray] #I #[fg=$thm_fg,bg=$thm_black4] #W #F "

#+--- Bars RIGHT ---+
set -g status-right "#[fg=white,bg=#1e1e2e,italics] %a #[bg=#1e1e2e,fg=#89b4fa] $git_status#[fg=#1e1e2e,bg=#89b4fa,bold,noitalics]#S "
set -g window-status-separator ""

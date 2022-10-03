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
# set -g status-left-length 150
# set -g status-left-length 150
# set-option -g status-style fg=white,bg=$thm_base

# Replace the location of the script.
# git_status="#(~/.dotfiles/private_dot_config/tmux/git-status.sh #{pane_current_path})"

#+--- Bars LEFT ---+
# Session name
# set -g status-left "#[fg=$thm_base,bg=$thm_blue,bold,italics]  #H #[bg=$thm_base,fg=$thm_blue,italics] #[bg=$thm_base,fg=white,italics,nobold]#(uptime -p | cut -f 1-2 -d',' | cut -c 3-)"

#+--- Windows ---+
# Focus
# set -g window-status-current-format "#[bg=$thm_base,fg=#bb9af7,bold,italics] #[fg=$thm_base,bg=#bb9af7]  #I•#W #F #[bg=$thm_base,fg=#bb9af7,bold,italics] "
# Unfocused
# set -g window-status-format "#[fg=brightwhite,bg=$thm_base,nobold,noitalics,nounderscore]   #I•#W #F  "

#+--- Bars RIGHT ---+
# set -g status-right "#[fg=white,bg=$thm_base,italics] %a #[bg=$thm_base,fg=$thm_blue] $git_status#[fg=$thm_base,bg=$thm_blue,bold,noitalics]#S"
# set -g window-status-separator ""

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
# set-option -g status-style fg=white,bg=${thm_bg}

# ----------------------------=== Theme ===--------------------------

# status
set status "on"
set status-bg "${thm_base}"
set status-justify "centre"
set status-left-length "100"
set status-right-length "100"

# messages
set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

# panes
set pane-border-style "fg=${thm_gray}"
set pane-active-border-style "fg=${thm_blue}"

# windows
setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
setw window-status-separator ""
setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

# --------=== Statusline

set status-left "#[bg=$thm_base,fg=$thm_blue,italics]#[fg=$thm_base,bg=$thm_blue,bold,italics]  #H #[bg=$thm_base,fg=$thm_blue,italics] #[bg=$thm_base,fg=white,italics,nobold]#(uptime -p | cut -f 1-2 -d',' | cut -c 3-)"
set status-right "#[fg=white,bg=$thm_base,italics] %a   #[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics] #W #{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #S #[fg=$thm_green,bg=$thm_base]"

# current_dir
setw window-status-format "#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
setw window-status-current-format "#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "

# parent_dir/current_dir
# setw window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
# setw window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

# --------=== Modes
setw clock-mode-colour "${thm_blue}"
setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

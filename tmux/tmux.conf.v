# 0 is too far from ` ;)
set -g base-index 1

#using C-a as prefix
unbind C-b
set-option -g prefix C-t
bind C-t send-prefix

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

#set -g default-terminal screen-256color
set -g status-keys vi
set -g history-limit 50000

setw -g mode-keys vi
set -g mouse on

setw -g monitor-activity on

bind c new-window -c "~"
bind-key | split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D 
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# No delay for escape key press
set -sg escape-time 0

# Reload tmux config
bind r source-file ~/.tmux.conf

# THEME
set -g status-bg black
set -g status-fg white
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami)'
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'

# Copy mouse selection to clipboard
# $ brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
bind-key -T copy-mode MouseDragEnd1Pane send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'


# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'


set -g @continuum-boot 'on'
set -g @continuum-boot-options 'iterm'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

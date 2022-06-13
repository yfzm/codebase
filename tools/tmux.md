# Tmux

1. Kill a pane: `<c-b> x`

2. Kill a window: `<c-b> &`

```sh
# VERSION 2.6

# Bind `
unbind C-b
set -g prefix `
bind ` send-prefix

# Color settings
set -g default-terminal "screen-256color"

# Use | and _ to split panes
unbind %
unbind '"'
bind | split-window -h -c "#{pane_current_path}"
bind _ split-window -v -c "#{pane_current_path}"

# Enable mouse
set -g mouse on

# Reload tmux config
bind r source-file ~/.tmux.conf

# Theme
set -g status-bg black
set -g status-fg white
set -g window-status-current-bg white
set -g window-status-current-fg black
set -g window-status-current-attr bold
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami) '
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1
```

```sh
# VERSION >2.6

# Bind `
unbind C-b
set -g prefix `
bind ` send-prefix

# Color settings
set -g default-terminal "screen-256color"

# Use | and _ to split panes
unbind %
unbind '"'
bind | split-window -h -c "#{pane_current_path}"
bind _ split-window -v -c "#{pane_current_path}"

# Enable mouse
set -g mouse on

# Reload tmux config
bind r source-file ~/.tmux.conf

# Theme
set -g status-bg black
set -g status-fg white
set -g window-status-current-style bg=white,fg=black,bold
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami) '
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1
```

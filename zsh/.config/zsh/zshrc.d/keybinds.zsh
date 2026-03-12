# Keybindings for command line editing.

# Search backward and forward through history for commands that match
# what has already been typed on the command line.
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Use vi-style keybindings in the shell.
bindkey -v

# Open the current command line in the default editor with Ctrl-x Ctrl-e.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

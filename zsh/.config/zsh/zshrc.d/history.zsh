# History file location and size.
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.zsh_history"

# Append to history instead of overwriting it.
setopt appendhistory

# Share history across multiple running shell sessions.
setopt sharehistory

# Ignore commands that start with a space.
setopt hist_ignore_space

# Reduce duplicates in saved history.
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

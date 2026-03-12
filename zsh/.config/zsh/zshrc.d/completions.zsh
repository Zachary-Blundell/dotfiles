# Make completion matching case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Disable the default completion menu so fzf-tab can provide the interface.
zstyle ':completion:*' menu no

# Add previews for directory-related fzf-tab completions.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'command ls -la $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'command ls -la $realpath'

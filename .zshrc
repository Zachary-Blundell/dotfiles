# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/zaiquiri/.zsh/completions:"* ]]; then export FPATH="/home/zaiquiri/.zsh/completions:$FPATH"; fi
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------
# zshrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/zshrc
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do
    if [ ! -d $f ]; then
     source $f
    fi
done

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# bun completions
[ -s "/home/zaiquiri/.bun/_bun" ] && source "/home/zaiquiri/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/zaiquiri/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit


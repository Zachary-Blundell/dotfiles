#!/usr/bin/env zsh

####################
## Bun
####################
# bun completions
[ -s "/home/zaiquiri/.bun/_bun" ] && source "/home/zaiquiri/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


####################
## Node Version Manager
####################
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

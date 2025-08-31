# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

if [ -d $ZDOTDIR/zshrc ]; then
  for f in $ZDOTDIR/zshrc/*; do
    if [ -f $f ]; then
      source $f
    fi
  done
  else
    echo "Error: Could not find $ZDOTDIR/zshrc directory"
fi

## Exports might get added here it is best to move them to ~/.config/zsh/.zshenv

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/zaiquiri/.bun/_bun" ] && source "/home/zaiquiri/.bun/_bun"

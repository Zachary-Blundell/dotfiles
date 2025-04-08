# SSH
source ~/.ssh-find-agent/ssh-find-agent.sh
emulate ksh -c "source ~/.ssh-find-agent/ssh-find-agent.sh"
ssh-add -l >&/dev/null || ssh-find-agent -a || eval $(ssh-agent) > /dev/null
ssh-find-agent -a || eval $(ssh-agent) > /dev/null

export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=nvim
export VISUAL=nvim

export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

# flutter 
export PATH=/usr/bin/flutter/bin:$PATH
# Android Studio
export PATH=/usr/bin/android-studio/bin:$PATH
export PATH=/snap/bin:$PATH

if [ -d "$HOME/.bin" ] ; then 
  export PATH=$HOME/.bin:$PATH
fi

if [ -d "$HOME/.local/bin" ] ; then 
  export PATH=$HOME/.local/bin:$PATH
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export XAUTHORITY=/home/zaiquiri/.Xauthority

# For flutter 
export CHROME_EXECUTABLE=/usr/bin/chromium

# export DISPLAY=:1
# For Dotfiles Manager
export DOTFILES_DIR=/home/zaiquiri/dotfiles
. "$HOME/.cargo/env"


export EDITOR=lvim
export VISUAL=lvim

export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  # ssh-add ~/.ssh/github_ed25519
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

export PATH=/usr/bin/flutter/bin:$PATH
export PATH=/usr/bin/android-studio/bin:$PATH


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export XAUTHORITY=/home/zaiquiri/.Xauthority

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

## Shortcuts
alias dvc='cd ~/Code/Defiez-votre-cerveau/dvc/; nvim'
alias cdl='zellij --layout=cdl'
alias work='zellij --layout=work_layout'
alias zn='zellij --layout=note_layout'
alias coding='zellij --layout=coding_layout'
alias zellij='zellij -l welcome'
alias updown='yes | update && shutdown'
alias startsshd='sudo systemctl start sshd.service'
alias send='rsync -av'
alias :q='exit'

alias goto='nordvpn c'

## Shortcuts

## Edit Configs
# Edit this .zshrc file
alias ezsh='goedit $ZDOTDIR'
alias rzsh='source $ZDOTDIR/.zshrc'
## ssh
alias essh='goedit $HOME/.ssh/config'
alias esshconf='sudoedit /etc/ssh/sshd_config && sudo systemctl restart sshd'
# Edit hyprland config
alias ehypr='goedit ~/.config/hypr/' 
# Edit zellij
alias econfigs='goedit ~/.config/' 
alias ezellij='goedit ~/.config/zellij/' 
# Edit kitty
alias ekitty='goedit ~/.config/kitty/' 
# Edit waybar config
alias ewaybar='goedit ~/.config/hypr/waybar/config.ini'
# 'cd ~/.config/hypr/waybar/config.ini; nvim .; cd "$OLDPWD"' 

## Other edits
# Edit scripts in local bin
alias escripts='goedit ~/.local/bin/' 

# -----------------------------------------------------
# General
# -----------------------------------------------------
alias ff='fastfetch'
alias wifi='nmtui'
alias please='sudo'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# -----------------------------------------------------
# Chmod alias commands
# -----------------------------------------------------
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# -----------------------------------------------------
# Editor stuff
# -----------------------------------------------------
alias v='$EDITOR .'
alias sv='sudoedit'
alias vi='$EDITOR'
alias vim='$EDITOR'
alias n='$EDITOR .'
alias sn='sudoedit'

# -----------------------------------------------------
# Git replaced by git zinit plugin
# -----------------------------------------------------
# alias gk='git clone'
# alias gs='git status'
# alias gd='git diff | less'
# alias ga='git add'
# alias gaa='git add .'
# alias gc="git commit -m "
# alias gp='git pull'
# alias gP='git push'
# alias gnb='git checkout -b' #new branch
# alias gcb="git checkout"    #change branch
# alias grh="git reset --hard"

# -------------------------------------------------------
# BETTER COMMANDS / SHORTCUTS
# -------------------------------------------------------

# Change directory aliases
# Replace cd with zoxide
# alias cd='z'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Better versions
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias ip='ip -color'
alias wget='wget -c '
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'

# Shortcuts
alias hw='hwinfo --short'                     # Hardware Info
alias c='clear'
alias bd='cd "$OLDPWD"'                       # cd into the old directory

# Replace ls with exa 
# Replace with the zinit exa plugin
# alias ls='exa --color=always --group-directories-first --icons' # preferred listing
# alias la='exa -la --color=always --group-directories-first --icons'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first --icons'  # long format
# alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
# alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
# alias listdir="ls -d */ > list"

# Pacman
# Replaced with zinit archlinux plugin
# alias pacman="sudo pacman --color auto"
# alias update="yes | sudo pacman -Syyu"
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # Cleanup orphaned packages
# alias upd="sudo pacman -Syyu"
# alias sps='sudo pacman -S'
# alias spf='pacman -Ss'
# alias spr='sudo pacman -R'
# alias spra='sudo pacman -Rns'
# alias sprs='sudo pacman -Rs'
# alias sprdd='sudo pacman -Rdd'
# alias spqo='sudo pacman -Qo'
# alias spsii='sudo pacman -Sii'
# alias pacmanunlock="sudo rm /var/lib/pacman/db.lck"
# alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# Aur
# replaced with zinit archlinux plugin
# alias yay='yay --answerclean n --answerdiff n'
# alias sas='yay -S'
# alias parus='sudo pacman -S'
# alias paruf='pacman -Ss'
# alias parur='sudo pacman -R'
# alias parura='sudo pacman -Rns'
# alias saf='yay -Ss'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '
# Search command line history
alias h="history | grep "
# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
# Search files in the current folder
alias f="find . | grep "
# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"
# Show open ports
alias openports='netstat -nape --inet'
# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# -----------------------------------------------------
# System
# -----------------------------------------------------

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

## Flutter
# Replaced with zinit flutter plugin
# alias frun='flutter run'
# alias fget='flutter pub get'
# alias fadd='flutter pub add'
# alias fbuild='flutter build'
# alias fup='flutter pub upgrade'
# alias fdoc='flutter doctor'
# alias fclean='flutter clean'
# alias fgen='flutter gen-l10n'
# alias fcreate='flutter create .'
# alias fweb='flutter run -d chrome'
# alias freset='rm build && fcreate && fclean && fgen && frun'
#
# ###-begin-flutter-completion-###
# if type complete &>/dev/null; then
#   __flutter_completion() {
#     local si="$IFS"
#     IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
#                            COMP_LINE="$COMP_LINE" \
#                            COMP_POINT="$COMP_POINT" \
#                            flutter completion -- "${COMP_WORDS[@]}" \
#                            2>/dev/null)) || return $?
#     IFS="$si"
#   }
#   complete -F __flutter_completion flutter
# elif type compdef &>/dev/null; then
#   __flutter_completion() {
#     si=$IFS
#     compadd -- $(COMP_CWORD=$((CURRENT-1)) \
#                  COMP_LINE=$BUFFER \
#                  COMP_POINT=0 \
#                  flutter completion -- "${words[@]}" \
#                  2>/dev/null)
#     IFS=$si
#   }
#   compdef __flutter_completion flutter
# elif type compctl &>/dev/null; then
#   __flutter_completion() {
#     local cword line point words si
#     read -Ac words
#     read -cn cword
#     let cword-=1
#     read -l line
#     read -ln point
#     si="$IFS"
#     IFS=$'\n' reply=($(COMP_CWORD="$cword" \
#                        COMP_LINE="$line" \
#                        COMP_POINT="$point" \
#                        flutter completion -- "${words[@]}" \
#                        2>/dev/null)) || return $?
#     IFS="$si"
#   }
#   compctl -K __flutter_completion flutter
# fi
# ###-end-flutter-completion-###

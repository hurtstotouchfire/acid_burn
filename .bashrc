###
#     File:                  x
#     Author:                Austin Soplata, of austin.soplata@gmail.com 
#     Last Modified:         Wed Jul 04 12:14 AM 2012 EDT
#     Project:               x 
#     Known Dependencies:    x 
#     Inputs:                x 
#     Outputs:               x 
#     Description:           x 
#     Todo:                  x 
###

# ssh-keygen -l -f /etc/ssh/ssh_host_key.pub, lists public key thing, e.g.
# '99:99:99...'

# VIMRUNTIME="/usr/share/vim/vim"

alias tmux="TERM=screen-256color-bce tmux"
TERM="xterm-256color"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"

alias "ls"="ls -G"
alias ll="ls -lG"
alias la="ls -aG"
alias lal="ls -laG"

function prompt
{
    local WHITE="\[\033[1;37m\]"
    local GREEN="\[\033[01;32m\]"
    local CYAN="\[\033[01;36m\]"
    local GRAY="\[\033[0;37m\]"
    local BLUE="\[\033[01;34m\]"
    local RED="\[\033[01;31m\]"
    #export PS1="$GRAY[$GREEN\u$CYAN@$BLUE\h $CYAN\W$GRAY]$ "
#export PS1="[\T lulz@\u:\w] $ "
export PS1="$GRAY[$CYAN\T $WHITE lulz$BLUE@$WHITE\u:$GREEN\W$GRAY] $RED$ $WHITE"
                        }
prompt

alias pgrep="ps aux | grep grep -v | grep "

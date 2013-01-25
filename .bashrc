###
#     File:                  x
#     Author:                Austin Soplata, of austin.soplata@gmail.com
#     Last Modified:         Sun Jan 20 03:57 PM 2013 EST
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
# 'printenv' prints all environmental varbls
# 'set | less' will throw all SHELL varbls into less

# alias tmux="TERM=screen-256color-bce tmux"
# TERM="xterm-256color"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias matlab="/Applications/MATLAB_R2011b.app/bin/matlab"
alias sudo="sudo "
alias ctags="/usr/local/bin/ctags"
alias port="/opt/local/bin/port"
alias c="clang++ "
alias tmuxre="tmux new-session -t Spcejt9k || tmux new-session -s Spcejt9k"
alias p3="python3"

alias "ls"="ls -G"
alias ll="ls -lG"
alias la="ls -aG"
alias lal="ls -laG"

alias grep="grep --color=auto"
alias pgrep="ps aux | grep grep -v | grep "

# so it spits out checksums in an identical format to linux' md5sum
alias md5="md5 -r"

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/clang_compiler_stuff/build/Debug+Asserts/bin

# needed for Timing app to track stuff?
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

###
#     File:                  x
#     Author:                Austin Soplata, of austin.soplata@gmail.com
#     Last Modified:         Thu Jan 31 01:56 AM 2013 EST
#     Project:               x
#     Known Dependencies:    x
#     Inputs:                x
#     Outputs:               x
#     Description:           x
#     Todo:                  x
###

# iTerm2 tricks
# cmd-shift-h brings up paste history
# can right-click paste or just middle button paste!
# cmd-; brings up its autocomplete
# ctrl-f does regex ready search func
# can use mouse wherever, even in vim to move
# cmd+` displays/hides iterm2
#
# ssh-keygen -l -f /etc/ssh/ssh_host_key.pub, lists public key thing, e.g.
# '99:99:99...'

# VIMRUNTIME="/usr/share/vim/vim"
# 'printenv' prints all environmental varbls
# 'set | less' will throw all SHELL varbls into less

# alias tmux="TERM=screen-256color-bce tmux"
# TERM="xterm-256color"

# Program aliases/shortcuts
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias matlab="/Applications/MATLAB_R2011b.app/bin/matlab"
alias sudo="sudo "
alias ctags="/usr/local/bin/ctags"
alias port="/opt/local/bin/port"
alias c="clang++ "
alias tmuxre="tmux new-session -t Spcejt9k || tmux new-session -s Spcejt9k"
alias p3="python3"
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# Bash aliases/shortcuts
alias "ls"="ls -G"
alias ll="ls -laG"
alias la="ls -aG"

alias grep="grep --color=auto"
alias pgrep="ps aux | grep grep -v | grep "

# so it spits out checksums in an identical format to linux' md5sum
alias md5="md5 -r"

alias whatisip="curl -s http://ifconfig.me"
alias wip="curl -s http://ifconfig.me"

# Pretty stuff
function prompt
{
    local WHITE="\[\033[1;37m\]"
    local GREEN="\[\033[01;32m\]"
    local CYAN="\[\033[01;36m\]"
    local GRAY="\[\033[0;37m\]"
    local BLUE="\[\033[01;34m\]"
    local DARKBLUE="\[\033[00;34m\]"
    local RED="\[\033[01;31m\]"
    local YELLOW="\[\033[01;33m\]"
    local ORANGE="\[\033[00;33m\]"
    local PURPLE="\[\033[00;35m\]"

    # export PS1="$GRAY[$CYAN\T$BLUE|$CYAN\d$BLUE|$YELLOW\u$BLUE@$PURPLE\h$BLUE|$GREEN\W$GRAY] $RED$ $WHITE"
    export PS1="\n$RED[$CYAN\T$BLUE | $CYAN\d$BLUE | $ORANGE\u$BLUE@$DARKBLUE\h$RED] $BLUE: \n    $RED[$PURPLE\w$RED]\n\n$RED\! | --\ $WHITE"
}
prompt

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/clang_compiler_stuff/build/Debug+Asserts/bin

export TERM="screen-256color"

# needed for Timing app to track stuff?
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

# vim: set textwidth=0 :

export alpha=~/Dropbox/rsh/kopell/project_alpha
export progz=~/Dropbox/progz/acid_burn
export cpp=~/Dropbox/progz/src/cpp/cpp_primer
alias ..="cd .."
alias sb="source ~/.bashrc"
alias svim="sudo vim "
export b=~/.bashrc
alias gcam="git commit -am "
alias gca="git commit -a "

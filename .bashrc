###
#     File:                  x
#     Author:                Austin Soplata, of austin.soplata@gmail.com
#     Last Modified:         Fri Feb 15 11:05 AM 2013 EST
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
#
# VIMRUNTIME="/usr/share/vim/vim"
# 'printenv' prints all environmental varbls
# 'set | less' will throw all SHELL varbls into less
#
# alias tmux="TERM=screen-256color-bce tmux"
# TERM="xterm-256color"

### Bash tricks #############################################################
# '$ blah <<str' allows a 'here document', where it takes into the std input
# '$ blah '         until the next 'str' at the beginning of a line
# '$ str '

## bash for loop control flow/scripting:
# 'for ii in <bash words, like *.html>'
# 'do'
# '    <body of loop, like echo $ii, which will echo the filename in this case>'
# 'done'
# For this, the loop variable's value '$ii' seems to iterate through the actual
# values, rather than, say a numerical index.

## '$ (sleep 5; echo Tea is ready) &'



### Prettification ###########################################################
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
PATH=/usr/local/bin:/usr/local/sbin:$PATH

export TERM="screen-256color"

# needed for Timing app to track stuff?
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

# vim: set textwidth=0 :


### Program aliases/shortcuts/variables ######################################
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias matlab="/Applications/MATLAB_R2011b.app/bin/matlab"
alias sudo="sudo "
alias ctags="/usr/local/bin/ctags"
alias port="/opt/local/bin/port"
alias c="clang++ -stdlib=libc++ -std=c++11"
alias tmuxre="tmux attach -t Spcejt9k || tmux new -s Spcejt9k"
alias p3="python3"
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# Bash aliases/shortcuts
alias "ls"="ls -G"
alias ll="ls -laG"
alias la="ls -aG"
alias rm="rm -i "

alias grep="grep --color=auto"
alias pgrep="ps aux | grep grep -v | grep -i"

alias killm="source ~/.bashrc; kill $(ps aux | grep grep -v | grep -i MATLAB_maci64 | tr ' ' '\n' | grep [0-9] -m 1)"



alias ..="cd .."
alias sb="source ~/.bashrc"
alias sv="sudo vim "
alias vs="vim -S ~/Dropbox/Session.vim"
alias svs="sudo vim -S ~/Dropbox/Session.vim"

# so it spits out checksums in an identical format to linux' md5sum
alias md5="md5 -r"

alias whatisip="curl -s http://ifconfig.me"
alias wip="curl -s http://ifconfig.me"

# git
alias gcam="git commit -am "
alias gca="git commit -a "
alias gpo="git push origin "

# Variables, including location ones
export alpha=~/Dropbox/rsh/kopell/project_alpha/code
export progz=~/Dropbox/progz/acid_burn
export cpp=~/Dropbox/progz/src/cpp
export b=~/.bashrc

### Nginx config notes
# nginx.conf's location is in this variable
export nc=/usr/local/etc/nginx/nginx.conf
# the html directory here has the actual files for the webserver
export nh='/usr/local/Cellar/nginx/1.2.6/html'
# actually used
export www='/Users/wintermute/www'

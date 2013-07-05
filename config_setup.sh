#!/bin/bash
# run this in bash
# This is for setting up config files on local machines

echo "Hello, $USER! My name is Tachikoma, and I'm here to bring your new shiny computer up to speed!"
echo "
　      　　　 rｫ  Y ､ヽ＼
　　　　　　　 | } 〈 ﾍ_ﾉﾘ　　　　　　　 　　 　 　 /´ 7
　　　　　　　 t'＾ｰﾍ_∨　　　　　　　　　　　　　　/_ /
　　　 　 　 　 ｀￣rﾍ_〉｀ヽ　　　　　　　　_ ,. -―' ､.}- ､
　　　　　　　　　　l ー '　ﾉヽ , '⌒＞ﾆ､７  〈　　∴　 ヽ..__｀ヽ、
　　　　 　 　 　 　 lー‐ '　　 ヽ_´_　｀ﾞ´ ヽ.｀ー-..__ﾉ}ヽ､｀ヽヽ
　　　　　　　　　　 〉､_＿,.､　 ﾊ_―--　.._＿\` ー‐ '' ´ (.ヽ＼亠､
　　 　 　 　 　 　 ｆ､_　　/　V　 ｌ､￣｀〃´￣ヽ_‐　._　　｀　　ヽ、ヽ
　　　　　　　　　　!　￣ !　　ﾞ､　}､ヽ  ｛{｀丶 ﾉ}__｀ ‐｀.丶 (ヽ、i l　}
　　　　　　　＿ 　 ヽ　　 !　/´_ﾉ　  ! l.{{ヽニ ´イ辷}_＿｀ヽ＼' | lｲ　　　　＿
　　　　　／　　 ｀丶冫T_７＜-'_,ノノ   ヽ､_＿,.ノﾉ ,r', -―-ヽ ヽ Y´ ,. ‐''´　　 ｀ヽ
　　　 ／　　　　　　　 _ノ､￣　　｀i'￣ ―＝._'´  　{ {　＿  }___ﾉﾉ｀}　　　　 　 　 ヽ
　　 / !　　　　　　　l'´　　}ニニ＝!　　　　　 ｀ヽ〉'´_＿_ ヾ. /_／ ｀l　　　　 　 ｒl
.　 / ,'　　　　　 　 r|　　 /ヽ.__,. -ﾍ¨ 二_‐ ._　 {/´　　　｀Y l 　 　 ﾄ.　　　　　|｜
 　/ /　　　　　　　ﾊ|-‐i'　　 ノ　　　｀!ｰ-ｰ_' ｀ヽｲ ,r￢ｫ､ },ゝ､_＿l}j　 　 　     |. |"


# change directory to home
cd

# Could use this to differentiate by machine name
LEHOST=$(hostname -s)
echo "You are currently on host '$LEHOST'."

# First, check if git is installed in order to clone
# http://stackoverflow.com/questions/7292584/how-to-check-if-git-is-installed-from-bashrc
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; 
then
    echo "You have git! Excellent. Reticulating splines..."
    git clone git@github.com:asoplata/acid_burn.git
else
    echo "Please install git before running this script!"; exit
fi

DATE=`date +%Y_%m_%d`

if [ -f .vimrc ]; 
then
    $(mv .vimrc .vimrc_old_$DATE)
fi
$(ln -s acid_burn/.vimrc .vimrc)

if [ -d .vim ]; 
then
    $(mv .vim .vim_old_$DATE)
fi
$(ln -s acid_burn/.vim .vim)

if [ -f .bashrc ]; 
then
    $(mv .bashrc .bashrc_old_$DATE)
fi
$(ln -s acid_burn/.bashrc .bashrc)

if [ -f .tmux.conf ]; 
then
    $(mv .tmux.conf .tmux.conf_old_$DATE)
fi
$(ln -s acid_burn/.tmux.conf .tmux.conf)

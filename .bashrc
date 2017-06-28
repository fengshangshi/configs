#if [ -x /usr/bin/dircolors ]; then
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'
#fi

#修改终端颜色
#if [ $TERM == xterm ]; then
export TERM='xterm-256color'
#fi

function parse_git_dirty {
	git symbolic-ref HEAD 2>/dev/null | cut -d "/" -f 3
}
function parse_git_branch {
	local branch=$(parse_git_dirty)
	if [ $branch ]; then printf "**%s**" $branch; fi
}
PS1='\u@\h:\w\[\e[1;36m\]$(parse_git_branch)\[\e[0m\]$ '


#####################################
alias ll='ls -alh'

#export PS1='[\[\033[01;32m\]\h:\[\033[01;34m\] \W\[\033[00m\]] \$ '
#export PS1='🍺  '
#export PS1='🍺  oh! cheers:'
#export PS1=`if [ \$? = 0]; then echo '🍺 '; else echo 'Oh, shit '; fi`
#PS1="\[\033[40;33;1m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]";\
#else echo "\\[\\033[31m\\]"; fi\`[\u \`if [[ `pwd|wc -c|tr -d "   "` >\
#18 ]]; then echo "\\W"; else echo "\\W"; fi\`] 🍺 \[\033[0m\] ";\
#echo -ne "\033]0;`hostname -s`:`pwd`\007"
PS1="\[\033[40;33;1m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]";\
else echo "\\[\\033[31m\\]"; fi\`[\u \W] \[\033[0m\]🍺  ";\
echo -ne "\033]0;`hostname -s`:`pwd`\007"

# 遍历目录
alias tree="find . -print | grep -v '\/node_modules' | grep -v '\/\.[^/]' | sed -e 's;[^/]*/;|___;g;s;___|;  |;g'"

# 配置环境变量
JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin
PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$JAVA_HOME:$PATH
export PATH

# Man路径
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

# 快速进入目录
DOC="$HOME/Documents"
LEARN="$DOC/learn"
alias doc="cd $DOC"
alias work="cd $DOC/git/work"
alias learn="cd $LEARN"
alias ss="cd $LEARN/node/sugar"

NVM_PATH="$DOC/git/nvm/nvm.sh"
if [ -s $NVM_PATH ]; then
	source $NVM_PATH
fi

# Bash Completion
BC_PATH="/usr/local/etc/bash_completion"
if [ -s $BC_PATH ]; then
	source $BC_PATH
fi

eval $(thefuck --alias)

#
# ~/.bashrc
#
# Customized shell configuration
# based on default Linux Mint .bashrc
# by Norrius, 2014-2017
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize	# check the window size after each command

# History settings

shopt -s histappend	# append to .bash_history instead of overwriting it
HISTSIZE=1000000	# history size, commands
HISTFILESIZE=1000000	# history size, lines
HISTTIMEFORMAT='%F %T '	# timestamp format
HISTIGNORE='history'	# ignored patterns
HISTCONTROL=ignoreboth	# ignore lines matching previous entry, ignore lines beginning with space
PROMPT_COMMAND='history -a' # store history immediately

# Color fix for GNU Screen
export TERM=xterm-256color

# Shell prompt

# PS1='[\u@\h \W]\$ ' # default Arch prompt

if [ $(id -u) -eq 0 ];	# if (user=="root") ...
then
  PS1='\[\033[1;31m\]\h\[\033[00m\] \[\033[1;34m\]\W\[\033[00m\] \[\033[1;31m\] \$\[\033[00m\] '
else
  PS1='\[\033[1;32m\]\u@\h\[\033[00m\] \[\033[1;34m\]\W\[\033[00m\]\[\033[1;31m\]$(__git_ps1) \[\033[1;34m\]\$\[\033[00m\] '
fi

# Alias definitions

alias .git='/usr/bin/git --git-dir=$HOME/.dot.git --work-tree=$HOME'

alias o='xdg-open'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -al --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias f='ps -aef | grep -v $$ | grep'

# virtualenv and virtualenvwrapper
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

function catls {
    [[ -f "$1" ]] && cat $@ || ls --color=auto $@
}

alias ls='catls'
alias cat='catls'

function g+++ {
    if g++ -std=c++11 -O2 -Wall -Wextra -pedantic -Wshadow -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -lmcheck -D_FORTIFY_SOURCE=2 -fsanitize=address  -fstack-protector -DFTEST -o `echo $1 | sed s/.cpp//` "$@"
    then echo "ok"
    fi
}
alias g++11='g++ -std=c++11'
#alias idea='JAVA_HOME=/usr/lib/jvm/jdk1.8.0_45/  /home/norrius/Programs/idea-IU-143.1821.5/bin/idea.sh'
alias mashinka='cd /home/norrius/Apps/Cloud/Uni/ML/2; PATH=/home/norrius/Programs/anaconda3/bin:$PATH jupyter notebook'

alias lastmod='find $1 -type f -exec stat --format "%Y :%y %n" {} \; | sort -nr | cut -d: -f2-'
alias fucking='sudo '

function swapsuckers {
    for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | less
}
#alias vpn='sshuttle -r parallel4_04@mipt60.dc.phystech.edu:222 0.0.0.0/0 -vv'

# Programmable completion

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Template for incliduing additional config files

if [ -f ~/.bash_extra ]; then
    . ~/.bash_extra
fi



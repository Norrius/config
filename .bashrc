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

# locale settings

export LC_TIME=en_GB.utf8

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

alias ssh-add='ssh-add -t 15h'

alias o='xdg-open'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -alh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


function g+++ {
    if g++ -std=c++11 -O2 -Wall -Wextra -pedantic -Wshadow -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -lmcheck -D_FORTIFY_SOURCE=2 -fsanitize=address  -fstack-protector -DFTEST -o `echo $1 | sed s/.cpp//` "$@"
    then echo "ok"
    fi
}
alias g++11='g++ -std=c++11'

alias fucking='sudo'
alias up='docker-compose pull && docker-compose up --build'
alias act='source venv/bin/activate'

# Git aliases
alias go='git checkout'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'

# Monitoring tools
alias f='ps -aef | grep -v $$ | grep'
alias lastmod='find $1 -type f -exec stat --format "%Y :%y %n" {} \; | sort -nr | cut -d: -f2-'
function swapsuckers {
    for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | less
}

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


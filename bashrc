

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias vi=vim
alias grep="grep --color -r -n -H --exclude='tags'"

## Force to use g++-12 clang++-15
alias gcc=/usr/bin/gcc-12
alias g++=/usr/bin/g++-12
alias clang=/usr/bin/clang-15
alias clang++=/usr/bin/clang++-15

## terminal color
export TERM=xterm-256color
export grey='\[\033[1;30m\]'
export red='\[\033[0;31m\]'
export RED='\[\033[1;31m\]'
export green='\[\033[0;32m\]'
export GREEN='\[\033[1;32m\]'
export yellow='\[\033[0;33m\]'
export YELLOW='\[\033[1;33m\]'
export blue='\[\033[0;34m\]'
export BLUE='\[\033[1;34m\]'
export purple='\[\033[0;35m\]'
export PURPLE='\[\033[1;35m\]'
export cyan='\[\033[0;36m\]'
export CYAN='\[\033[1;36m\]'
export white='\[\033[0;37m\]'
export WHITE='\[\033[1;37m\]'
export NC='\[\033[0m\]'


PS1="[${green}\u${blue}@\h ${white}\w]${end} "

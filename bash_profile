PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\e[34m\] >\[\e[m\] '

export PATH=$PATH:/bin:/usr/bin

source ~/.bash_aliases

source ~/.bash_aliases
source ~/.profile

export EDITOR=vim
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\e[34m\] >\[\e[m\] '

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

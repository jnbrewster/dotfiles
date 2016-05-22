source ~/.bash_aliases
source ~/.profile

export EDITOR=vim
export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]>\[\e[m\] """

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

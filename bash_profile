source ~/.bash_aliases
source ~/.profile

export EDITOR=vim
export PS1="\[\e[34m\]\W\[\e[m\] \[\e[32m\]>\[\e[m\] """

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/Users/joel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

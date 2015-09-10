#echo /usr/local/bin/fish >>/etc/shells
#chsh -s /usr/local/bin/fish
#set -gx RBENV_ROOT /usr/local/var/rbenv
#. (rbenv init -|psub)

#Set path for ruby on rails with rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

set fish_greeting ""

alias bu="rsync -rtv ~/Dropbox/dotfiles ~/"
alias eh="open vnc://192.168.0.12"
alias vb="ssh joel@192.168.56.102"
alias ip="curl icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias mute="osascript -e 'set volume output muted true'"
alias update="sudo softwareupdate -i -a"
alias reload="exec $SHELL -l"

alias n="nvim"
alias v="vim"
alias vi="vim"
alias t="tmux"
alias tm="tmux"
alias ta="tmux attach"
alias q="qutebrowser & exit"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias yt="youtube-dl"
alias mp3='youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k'

alias @h="ls -c ~/Dropbox | grep @home"
alias @m="ls -c ~/Dropbox | grep @mac"
alias @e="ls -c ~/Dropbox | grep @errands"
alias @d="ls -c ~/Dropbox | grep @due"
alias @t="ls -c ~/Dropbox | grep '@home\|@mac\|@errands\|@due'"

alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool
false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool
true && killall Finder"

alias ls="ls -G"
alias ll="ls -otW"
alias h="cd ~"
alias c="clear"
alias d="cd ~/Dropbox"

alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias about="archey -c"
alias info="sh ~/Dropbox/dotfiles/Scripts/info.sh"

alias m="/Applications/MacVim.app/Contents/MacOS/Vim"
alias dc="open -a Dictionary"
alias pv="open -a Preview"
alias sf="open -a Safari"
alias fd="open -a Finder"
alias gc="open -a Google\ Chrome"

alias gd="open -a Github\ Desktop"
alias nv="open -a nvALT"
alias qp="open -a Quicktime\ Player"
alias kt="open -a KakaoTalk"

alias alpha="sh ~/Dropbox/dotfiles/Scripts/alpha"
alias blocks="sh ~/Dropbox/dotfiles/Scripts/blocks"
alias pipes="sh ~/Dropbox/dotfiles/Scripts/pipes"
alias invaders="sh ~/Dropbox/dotfiles/Scripts/invaders"
alias hidden="sh ~/Dropbox/dotfiles/Scripts/togglehidden"
alias restart="sudo shutdown -r now"
alias mc="sh ~/Dropbox/dotfiles/Scripts/mc.sh"
alias jeju="sh ~/Dropbox/dotfiles/Scripts/weather.sh "jeju""
alias kingscliff="sh ~/Dropbox/dotfiles/Scripts/weather.sh "kingscliff""
alias melbourne="sh ~/Dropbox/dotfiles/Scripts/weather.sh "melbourne""

export EDITOR=/usr/bin/vim

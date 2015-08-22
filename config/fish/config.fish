#echo /usr/local/bin/fish >>/etc/shells
#chsh -s /usr/local/bin/fish

set fish_greeting ""

alias bu="rsync -rtv ~/Dropbox/dotfiles ~/"
alias eh="open vnc://192.168.0.12"
alias ip="curl icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias mute="osascript -e 'set volume output muted true'"
alias vim="nvim"

alias t="tmux"
alias ta="tmux attach"

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

alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias alpha="sh ~/Dropbox/dotfiles/Scripts/alpha"
alias blocks="sh ~/Dropbox/dotfiles/Scripts/blocks"
alias pipes="sh ~/Dropbox/dotfiles/Scripts/pipes"
alias invaders="sh ~/Dropbox/dotfiles/Scripts/invaders"
alias hidden="sh ~/Dropbox/dotfiles/Scripts/togglehidden"
alias restart="sudo shutdown -r now"
alias mc="sh ~/Dropbox/dotfiles/Scripts/mc.sh"

export EDITOR=/usr/bin/nvim

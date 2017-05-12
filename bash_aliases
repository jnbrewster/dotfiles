alias reload="exec $SHELL -l"

alias reboot="sudo reboot"
alias shutdown="sudo poweroff"
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed"

alias cal='cal | head -n 1; cal | tail -n +2 | grep --before-context 6 --after-context 6 --color -e " $(date +%e)" -e "^$(date +%e)"'
alias ip="curl http://ipecho.net/plain; echo"
alias ips="ifconfig | grep inet"

alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias empty="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias hidden="sh ~/dotfiles/Scripts/togglehidden"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false ; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true ; killall Finder"

alias pg="postgres -D /usr/local/var/postgres"
server(){
  python -m SimpleHTTPServer ${1:-1337}
}
alias pserver=server
alias server="php -S localhost:9000 -t ."
alias server2="php -S localhost:9001 -t ."

alias wget="wget -c"

alias ls="ls -G"
alias ll="ls -otW"
alias asl="ls -aslFh"
alias la="ls -a"
alias lh="ls -lh"
alias cl="clear"
alias ..='cd .. && ls'
alias ...='cd ../.. && ls'

alias gg="cd ~"
alias gh="cd ~"
alias gdt="cd ~/Developer/dotfiles"
alias gap="cd ~/Applications/"
alias gdw="cd ~/Downloads/"
alias gds="cd ~/Desktop/"
alias gpc="cd ~/Pictures/"
alias gms="cd ~/Music/"
alias gmv="cd ~/Movies/"
alias gdv="cd ~/Developer/ && ls"

alias vim='mvim -v'
alias v='mvim -v'
alias r="ranger"
alias yt="youtube-dl"
alias mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"
alias pv="open -a Preview"
alias ql="qlmanage -p 2>/dev/null"

alias info="sh ~/Developer/dotfiles/Scripts/info.sh"
alias blocks="sh ~/Developer/dotfiles/Scripts/blocks"
alias pipes="sh ~/Developer/dotfiles/Scripts/pipes"
alias invaders="sh ~/Developer/dotfiles/Scripts/invaders"
alias poke="sh ~/Developer/dotfiles/Scripts/poke"

alias commit='git commit -am '
alias push='git push'
alias status='git status'
alias add='git add'
alias clone="git clone"
alias js="/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc"
alias tm="tmux"
alias ta="tmux attach"

alias ss='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

alias weather="curl http://wttr.in/Melbourne"
# Ambient sleeping pill
alias a="mpv http://198.50.158.92:8447/h"


#
# HELPERS
#

# Make a directory and change to it.
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# Requres youtube-dl and mpv

function play {
  youtube-dl --default-search=ytsearch: \
    --youtube-skip-dash-manifest \
    --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
    --restrict-filenames \
    --format="bestaudio[ext!=webm]" \
    --exec=mpv -vvv "$*"
}

# What is love?
alias whatislove?="play haddaway what is love"


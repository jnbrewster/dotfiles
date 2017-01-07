alias reload="exec $SHELL -l"

alias reboot="sudo reboot"
alias shutdown="sudo poweroff"
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed"

alias cal='cal | head -n 1; cal | tail -n +2 | grep --before-context 6 --after-context 6 --color -e " $(date +%e)" -e "^$(date +%e)"'
alias ip="curl http://ipecho.net/plain; echo"
alias ips="ifconfig | grep inet"

alias clean="find . -name '*.DS_Store' -type f -ls -delete"
alias empty="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias hidden="sh ~/dotfiles/Scripts/togglehidden"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false ; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true ; killall Finder"
alias tk="trans :ko "
alias te="trans :en "

alias fondle="echo 'Mmmmmm oooh yeah....'; touch"

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
alias gdt="cd ~/dotfiles"
alias gap="cd ~/Applications/"
alias gex="cd /Volumes/External/"
alias gdc="cd ~/Dropbox/Documents/"
alias gdw="cd ~/Downloads/"
alias gds="cd ~/Desktop/"
alias gpc="cd ~/Pictures/"
alias gms="cd ~/Music/"
alias gmv="cd ~/Movies/"
alias gcu="cd ~/Dropbox/Camera\ Uploads/"
alias gdv="cd ~/Developer/ && ls"

alias vim="nvim"
alias v="nvim"
alias rn="ranger"
alias yt="youtube-dl"
alias mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"
alias gifpng="convert -delay 35 -loop 0 source*.png animated.gif"
alias gifjpg="convert -delay 35 -loop 0 source*.jpg animated.gif"
alias html="pandoc input.md -o output.html"
alias pdf="pdftotext"
alias pv="open -a Preview"
alias ql="qlmanage -p 2>/dev/null"
alias theme="osascript ~/Dropbox/dotfiles/Scripts/themechanger.scpt"

alias commit='git commit -am '
alias push='git push'
alias status='git status'
alias add='git add'
alias clone="git clone"
alias js="/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc"
alias tm="tmux"
alias ta="tmux attach"
alias pm="pymux"
eval $(thefuck --alias)

alias info="sh ~/dotfiles/Scripts/info.sh"
alias blocks="sh ~/dotfiles/Scripts/blocks"
alias pipes="sh ~/dotfiles/Scripts/pipes"
alias invaders="sh ~/dotfiles/Scripts/invaders"
alias poke="sh ~/dotfiles/Scripts/poke"
alias about="neofetch --image ~/Pictures/about.png"

alias weather="curl http://wttr.in/Melbourne"
alias dcss="/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl"
alias crawl="ssh joshua@crawl.akrasiac.org"
alias cdda="export PATH=/usr/bin:/bin:/usr/sbin:/sbin DYLD_LIBRARY_PATH=. DYLD_FRAMEWORK_PATH=.; cd '/Applications/Cataclysm.app/Contents/Resources' && ./cataclysm"


#
# HELPERS
#

# Notational velocity style create and search
n() {
  $EDITOR ~/Notes/"$*".md
}

nl() {
  ls -c ~/Notes/ | grep "$*"
}

# Make a directory and change to it.
function mkcd {
  mkdir -p "$1" && cd "$1"
}

# Requres youtube-dl and mplayer
function play {
  youtube-dl --default-search=ytsearch: \
    --youtube-skip-dash-manifest \
    --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
    --restrict-filenames \
    --format="bestaudio[ext!=webm]" \
    --exec=mplayer -vvv "$*"
}

# What is love?
alias whatislove?="play haddaway what is love"


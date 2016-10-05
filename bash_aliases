alias reload="exec $SHELL -l"
alias tomorrow="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Tomorrow.scpt"
alias solarized="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Solarized.scpt"
alias gruvbox="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Gruvbox.scpt"
alias hemisu="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Hemisu.scpt"
alias seoul="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Seoul256.scpt"
alias ocean="osascript /Volumes/External/Dropbox/Developer/HelperApplications/Ocean.scpt"
alias one="osascript /Volumes/External/Dropbox/Developer/HelperApplications/One.scpt"

alias reboot="sudo reboot"
alias shutdown="sudo poweroff"
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed"

alias cal='cal | head -n 1; cal | tail -n +2 | grep --before-context 6 --after-context 6 --color -e " $(date +%e)" -e "^$(date +%e)"'
alias eh="open vnc://192.168.0.12"
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

server(){
  python -m SimpleHTTPServer ${1:-1337}
}
alias pserver=server
alias wserver="php -S localhost:3000 -t ."
alias phpserver="php -S localhost:8000"

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
alias gdc="cd ~/Documents/"
alias gdw="cd ~/Downloads/"
alias gds="cd ~/Desktop/"
alias gpc="cd ~/Pictures/"
alias gms="cd ~/Music/"
alias gmv="cd ~/Movies/"
alias gph="cd /Volumes/External/Dropbox/Photos/"
alias gcu="cd /Volumes/External/Dropbox/Camera\ Uploads/"
alias gdv="cd ~/Developer/ && ls"
alias gbf="cd ~/Developer/bingefest/wp-content/themes/bingefest && ls"

alias v='vim'
alias rn="ranger"
alias yt="youtube-dl"
alias mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"
alias gifpng="convert -delay 35 -loop 0 source*.png animated.gif"
alias gifjpg="convert -delay 35 -loop 0 source*.jpg animated.gif"
alias html="pandoc input.md -o output.html"
alias pdf="pdftotext"
alias pv="open -a Preview"
alias ql="qlmanage -p 2>/dev/null"
alias notes="vim /Volumes/External/Dropbox/Documents/notes.md"
alias cod="mplayer /Volumes/External/Dropbox/Public/WheelOfFortune.mp3"
alias df="sh /Applications/df_osx/df"
alias life="vim /Volumes/External/Dropbox/life.org"

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

alias weather="curl http://wttr.in/Melbourne"
alias dcss="ssh joshua@crawl.akrasiac.org"

alias leon="v ~/Documents/Leon/LettersToLeon.md"



#
# HELPERS
#

# Notational velocity style create and search
n() {
  $EDITOR /Volumes/External/Dropbox/Documents/"$*".md
}

nl() {
  ls -c /Volumes/External/Dropbox/Documents/ | grep "$*"
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


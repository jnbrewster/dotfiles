alias reload="exec $SHELL -l"
alias tomorrow="osascript ~/.vim/plugged/Tomorrow/ThemeChanger.scpt"
alias solarized="osascript ~/Developer/HelperApplications/Solarized.scpt"
alias gruvbox="osascript ~/Developer/HelperApplications/Gruvbox.scpt"

alias reboot="sudo reboot"
alias shutdown="sudo poweroff"

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

alias update="sudo softwareupdate -i -a ; brew update ; brew upgrade ; brew upgrade brew-cask ; brew cleanup ; brew cask cleanup"

alias ls="ls -G"
alias ll="ls -otW"
alias asl="ls -aslFh"
alias la="ls -a"
alias lh="ls -lh"
alias cl="clear"
alias ..='cd ..'
alias ...='cd ../..'

alias gg="cd ~"
alias gh="cd ~"
alias gdt="cd ~/dotfiles"
alias gap="cd ~/Applications/"
alias gex="cd /Volumes/External/"
alias gdr="cd /Volumes/External/Dropbox/"
alias gdc="cd ~/Documents/"
alias gdw="cd ~/Downloads/"
alias gds="cd ~/Desktop/"
alias gpc="cd ~/Pictures/"
alias gdv="cd ~/Developer/"
alias gms="cd ~/Music/"
alias gmv="cd ~/Movies/"
alias gph="cd ~/Photos/"
alias gcu="cd /Volumes/External/Dropbox/Camera\ Uploads/"
alias gga="cd ~/Developer/GeneralAssembly/"
alias wdi="cd ~/WDI-7 && ls"
alias br0="cd ~/WDI-7/br0c0d3/ && ls"
alias warmups="cd ~/WDI-7/WDI7-Warmups && ls"
alias hw="cd ~/WDI-7/wdi7-homework && ls"

alias v='vim'
alias mt="mutt"
alias nw="newsbeuter"
alias rn="ranger"
alias ir="irssi"
alias cm="cmus"
alias hn="hangups"
alias mp="mplayer"
alias rt="rtorrent"
alias lv="livestreamer"
alias el="elinks"
alias ddg="elinks www.duckduckgo.com"
alias yt="youtube-dl"
alias mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"
alias gifpng="convert -delay 35 -loop 0 source*.png animated.gif"
alias gifjpg="convert -delay 35 -loop 0 source*.jpg animated.gif"
alias html="pandoc input.md -o output.html"
alias pdf="pdftotext"
alias pv="open -a Preview"
alias ql="qlmanage -p 2>/dev/null"
alias notes="vim ~/Documents/notes.md"

alias commit='git commit -am '
alias push='git push origin master'
alias status='git status'
alias add='git add'
alias clone="git clone"
alias js="/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc"
alias tm="tmux"
alias ta="tmux attach"
alias pm="pymux"
alias pa="pymux attach"
alias ts="sh ~/dotfiles/Scripts/tmux.sh"

alias info="sh ~/dotfiles/Scripts/info.sh"
alias blocks="sh ~/dotfiles/Scripts/blocks"
alias pipes="sh ~/dotfiles/Scripts/pipes"
alias invaders="sh ~/dotfiles/Scripts/invaders"
alias poke="sh ~/dotfiles/Scripts/poke"

alias weather="curl http://wttr.in/Melbourne"

alias leon="v ~/Documents/Leon/LettersToLeon.md"

alias a="mplayer http://50.7.96.138:8115/listen/pls"


#
# HELPERS
#

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


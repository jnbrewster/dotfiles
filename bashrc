export MUTT_EMAIL_ADDRESS="j.n.brewster@gmail.com"
export MUTT_REALNAME="Joel Brewster"
export MUTT_SMTP_URL="smtp://j.n.brewster@smtp.gmail.com:587/"

#
# ~/.bashrc
#

#
# LANGUAGE
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


#
# SHELL
#


# Append instead of overwrite history.
shopt -s histappend
# Properly save multi-line commands.
shopt -s cmdhist
# Don't replace newlines with semicolons in history.
shopt -s lithist
# Fix typos when changing directories.
shopt -s cdspell


#
# HISTORY
#

# Write more history.
export HISTFILESIZE=2000
# Remember more history.
export HISTSIZE=2000


#
# ALIASES
#

alias reload="exec $SHELL -l"
alias theme="osascript ~/dotfiles/Scripts/themechanger.scpt"
alias lock="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

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

alias update="sudo softwareupdate -i -a ; brew update ; brew upgrade ; brew upgrade brew-cask ; brew cleanup ; brew cask cleanup"
alias karabinerexport="sh ~/dotfiles/Scripts/karabinerexport.sh"

alias ls="ls -G"
alias ll="ls -otW"
alias la="ls -a"
alias l="clear"
alias d="cd ~/dotfiles"
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias gg="cd ~"
alias gdb="cd ~/dropbox/"
alias gdf="cd ~/dotfiles/"
alias gdl="cd ~/Downloads/"
alias gdt="cd ~/Desktop/"
alias gdv="cd ~/Development/"
alias glb="cd ~/Library/"
alias gms="cd ~/Music/"
alias gmv="cd ~/Movies"
alias gpt="cd ~/Pictures/"
alias gsc="cd ~/Sync/"
alias gbu="cd /Volumes/Backup/"


alias v="vim"
alias c="calcurse"
alias r="vim .reminders"
alias rc="rem -m -c"
alias rn="rem -n"
alias rw="rem -m -c+1"
alias rw2="rem -m -c+2"
alias m="mutt"
alias t="tmux"
alias ta="tmux attach"
alias q="qutebrowser"
alias yt="youtube-dl"
alias mp3="youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k"
alias gif="convert -delay 35 -loop 0 source*.png animated.gif"
alias html="pandoc input.md -o output.html"
alias strongbad_email.exe="mutt"

alias d="w3m www.duckduckgo.com"

alias commit='git commit -am '
alias push='git push origin master'
alias status='git status'

alias info="sh     ~/dotfiles/Scripts/info.sh"
alias blocks="sh   ~/dotfiles/Scripts/blocks"
alias pipes="sh    ~/dotfiles/Scripts/pipes"
alias invaders="sh ~/dotfiles/Scripts/invaders"

alias jeju="sh       ~/dotfiles/Scripts/weather.sh "jeju""
alias kingscliff="sh ~/dotfiles/Scripts/weather.sh "kingscliff""
alias melbourne="sh  ~/dotfiles/Scripts/weather.sh "melbourne""
alias leon="vim      ~/Dropbox/LettersToLeon.md"

alias @e="ls -c ~/Documents | grep @errands"
alias @h="ls -c ~/Documents | grep @home"
alias @m="ls -c ~/Documents | grep @mac"
alias @t="ls -c ~/Documents | grep '@home\|@mac\|@errands'"
alias todo="vim ~/Documents/todo.txt"

alias a="mplayer http://50.7.96.138:8115/listen/pls"
alias dcss="ssh joshua@crawl.akrasiac.org"



#
# HELPERS
#

# Nvalt style note creator and searcher.
function n {
  if [ -n "$1" ]; then
    vim ~/Documents/$1.md
  else
    echo "Usage: n <title>"
  fi
}

function ns {
	ls -c ~/Documents | grep -i $1
}

# Make a directory and change to it.
function mkcd {
  mkdir -p "$1" && cd "$1"
}

function play {
  youtube-dl --default-search=ytsearch: \
             --youtube-skip-dash-manifest \
             --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
             --restrict-filenames \
             --format="bestaudio[ext!=webm]" \
             --exec=mplayer -vvv "$*"
}

# What is love?
alias whatislove?="play what it love"


#
# PREFERENCES
#

export EDITOR=vim
export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]>\[\e[m\] """


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

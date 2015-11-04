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
alias lock="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"


alias eh="open vnc://192.168.0.12"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias clean="find . -name '*.DS_Store' -type f -ls -delete"
alias empty="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias hidden="sh ~/dotfiles/Scripts/togglehidden"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false ; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true ; killall Finder"

alias upgrade="sudo softwareupdate -i -a ; brew update ; brew upgrade brew-cask ; brew cleanup ; brew cask cleanup"
alias backup="rsync ~/Documents/* ~/Dropbox/"
alias karabinerexport="$ /Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/dotfiles/karabiner-import.sh"


alias ls="ls -G"
alias ll="ls -otW"
alias l="clear"
alias d="cd ~/dotfiles"
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ~="cd ~"
alias v="vim"
alias n="nvim"
alias t="tmux"
alias nb="newsbeuter"
alias ta="tmux attach"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias yt="youtube-dl"
alias mp3='youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k'
alias gif='convert -delay 35 -loop 0 source*.png animated.gif'

alias info="sh ~/dotfiles/Scripts/info.sh"
alias blocks="sh ~/dotfiles/Scripts/blocks"
alias pipes="sh ~/dotfiles/Scripts/pipes"
alias invaders="sh ~/dotfiles/Scripts/invaders"

alias jeju="sh ~/dotfiles/Scripts/weather.sh "jeju""
alias kingscliff="sh ~/dotfiles/Scripts/weather.sh "kingscliff""
alias melbourne="sh ~/dotfiles/Scripts/weather.sh "melbourne""
alias leon="vim ~/Documents/LettersToLeon.md"
alias todo="sh ~/dotfiles/Scripts/contexts.sh"
alias @h="ls -c ~/Documents | grep @home"
alias @m="ls -c ~/Documents | grep @mac"
alias @e="ls -c ~/Documents | grep @errands"
alias @t="ls -c ~/Documents | grep '@home\|@mac\|@errands'"

alias a="vlc -vvv http://50.7.96.138:8115/listen/pls"
alias k="vlc -vvv http://livesh.koffee.com.au:15004/listen.pls"

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
             --exec=vlc -vvv "$*"
}

# What is love?
alias whatislove?="play what it love"

#
# PREFERENCES
#

export EDITOR=nvim
export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]>\[\e[m\] """


# language

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# shell options

shopt -s histappend # append instead of overwrite history
shopt -s cmdhist    # properly save multi-line commands
shopt -s lithist    # don't replace newlines with semicolons in history
shopt -s cdspell    # fix typos when changing directories

# history

export HISTFILESIZE=2000 # write more history
export HISTSIZE=2000     # remember more history

# aliases

alias lock="open
/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
alias add="gcalcli quick --calendar Home"
alias a="vlc -vvv http://50.7.96.138:8115/listen/pls"
alias eh="open vnc://192.168.0.12"
alias ip="curl icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias clean="find . -name '*.DS_Store' -type f -ls -delete"
alias et="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias mute="osascript -e 'set volume output muted true'"
alias upgrade="sudo softwareupdate -i -a ; brew update ; brew upgrade brew-cask ; brew cleanup ; brew cask cleanup"
alias karabinerexport="$ /Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/dotfiles/karabiner-import.sh"
alias reload="exec $SHELL -l"
alias ta1="sh ~/dotfiles/Scripts/tmux.sh"
alias 1h="sleep 3600 ; sh ~/dotfiles/Scripts/timer &"
alias leon="vim ~/Documents/LettersToLeon.md"
alias todo="sh ~/dotfiles/Scripts/contexts.sh"
alias agenda="gcalcli agenda"
alias week="gcalcli calw"
alias month="gcalcli calm"
alias ~="cd ~"
alias r="ranger"
alias c="cmus"
alias v="vim"
alias t="tmux"
alias nb="newsbeuter"
alias q="qutebrowser &"
alias ta="tmux attach"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias yt="youtube-dl"
alias mp3='youtube-dl -t --extract-audio --audio-format mp3 --audio-quality 320k'
alias gif='convert -delay 35 -loop 0 source*.png animated.gif'
alias @h="ls -c ~/Documents | grep @home"
alias @m="ls -c ~/Documents | grep @mac"
alias @e="ls -c ~/Documents | grep @errands"
alias @t="ls -c ~/Documents | grep '@home\|@mac\|@errands'"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false ; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true ; killall Finder"
alias ls="ls -G"
alias ll="ls -otW"
alias h="cd ~"
alias l="clear"
alias d="cd ~/dotfiles"
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias info="sh ~/dotfiles/Scripts/info.sh"
alias blocks="sh ~/dotfiles/Scripts/blocks"
alias pipes="sh ~/dotfiles/Scripts/pipes"
alias invaders="sh ~/dotfiles/Scripts/invaders"
alias hidden="sh ~/dotfiles/Scripts/togglehidden"
alias restart="sudo shutdown -r now"
alias jeju="sh ~/dotfiles/Scripts/weather.sh "jeju""
alias kingscliff="sh ~/dotfiles/Scripts/weather.sh "kingscliff""
alias melbourne="sh ~/dotfiles/Scripts/weather.sh "melbourne""

# helpers

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

function mkcd {
    # Make a directory and change to it.
    mkdir -p "$1" && cd "$1"
}

function play {
    # Skip DASH manifest for speed purposes. This might actually disable
    # being able to specify things like 'bestaudio' as the requested format,
    # but try anyway.
    # Get the best audio that isn't WebM, because afplay doesn't support it.
    # Use "$*" so that quoting the requested song isn't necessary.
    youtube-dl --default-search=ytsearch: \
               --youtube-skip-dash-manifest \
               --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
               --restrict-filenames \
               --format="bestaudio[ext!=webm]" \
               --exec=afplay "$*"
}

alias whatislove?="play what it love"
# preferences

export EDITOR=vim

export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]>\[\e[m\] """

PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin


#!/bin/sh
tmux new-session -d 'mutt'
tmux split-window -h 'cmus'
tmux split-window -v 'hangups'
tmux -2 attach-session -d

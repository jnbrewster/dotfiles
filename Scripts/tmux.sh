#!/bin/sh
session="main"

# set up tmux
tmux start-server

# # create a new tmux session, select a new tab, rename it, split it, select 1st tab and start vim
tmux new-session -d -s $session -n work

# Split pane 1 horizontal by 65%
tmux send-keys "n" C-m
tmux send-keys " " C-m
tmux splitw -v -p 25
tmux selectp -t 0

tmux new-window -t $session:2 -n chat
tmux send-keys "hangups" C-m
#tmux send-keys "profanity" C-m
#tmux splitw -v -p 50
#tmux send-keys "weechat" C-m
#tmux selectp -t 0

tmux new-window -t $session:3 -n music
#tmux send-keys "cmus" C-m
tmux send-keys "cmus" C-m

tmux new-window -t $session:4 -n misc

# return to main vim window
tmux select-window -t $session:1

# Finished setup, attach to the tmux session!
tmux attach-session -t $session

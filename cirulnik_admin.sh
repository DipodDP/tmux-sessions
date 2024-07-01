#! /bin/bash

# creating tmux session with the same name as script filename
PROJECT_NAME=$(basename $0)
PROJECT_NAME=${PROJECT_NAME%.sh}

PATH_1=~/projects/python/cirulnik_admin_bot/
tmux new-session -s $PROJECT_NAME -c $PATH_1 -n 'cirulnik_admin_bot' -d
tmux split-window -v -t $PROJECT_NAME:1.1 -c $PATH_1
tmux send-keys -t $PROJECT_NAME:1.1 'poetry shell' Enter
# tmux send-keys -t $PROJECT_NAME:1.1 'nvim .' Enter
tmux send-keys -t $PROJECT_NAME:1.2 'poetry shell' Enter
tmux send-keys -t $PROJECT_NAME:1.2 'python bot.py' Enter

# selecting window or pane and attaching to session
tmux select-window -t $PROJECT_NAME:1
tmux select-pane -t 1
tmux attach -t $PROJECT_NAME

#! /bin/bash

# creating tmux session with the same name as script filename
PROJECT_NAME=$(basename $0)
PROJECT_NAME=${PROJECT_NAME%.sh}

PATH_1=~/projects/python/trackfolio/
PATH_2=~/projects/js/trackfolio-next/
tmux new-session -s $PROJECT_NAME -c $PATH_1 -n 'Backend' -d
tmux split-window -v -t $PROJECT_NAME:1.1 -c $PATH_1
tmux send-keys -t $PROJECT_NAME:1.1 'poetry shell' Enter
# tmux send-keys -t $PROJECT_NAME:1.1 'nvim .' Enter
tmux send-keys -t $PROJECT_NAME:1.2 'poetry run start' Enter
tmux new-window -t $PROJECT_NAME: -c $PATH_2 -n 'Frontend'
tmux send-keys -t $PROJECT_NAME:2.1 'lvim .' Enter
tmux new-window -t $PROJECT_NAME: -c $PATH_2 -n 'Node'
tmux send-keys -t $PROJECT_NAME:3.1 'pnpm dev' Enter

# selecting window or pane and attaching to session
tmux select-window -t $PROJECT_NAME:1
tmux select-pane -t 1
tmux attach -t $PROJECT_NAME

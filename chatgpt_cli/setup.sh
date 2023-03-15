#!/bin/bash

PATH=$(dirname $(realpath "$0"))

/bin/pip install -r $PATH/requirements.txt
echo "alias chatgptcli='python3 $PATH/chatgpt_cli/chatgpt_cli.py'" >> $HOME/.bashrc

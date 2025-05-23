# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias dev-workspace="distrobox enter dev_env -e tmux"

# Flutter
export PATH="/home/gab25/flutter/bin:/home/gab25/.pub-cache/bin:$PATH"

# Node
export PATH="/home/gab25/node/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gab25/google-cloud-sdk/path.bash.inc' ]; then . '/home/gab25/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gab25/google-cloud-sdk/completion.bash.inc' ]; then . '/home/gab25/google-cloud-sdk/completion.bash.inc'; fi

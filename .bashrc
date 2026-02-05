#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/gab25/.local/bin"
export PATH="$PATH:/home/gab25/flutter/bin"

eval "$(starship init bash)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/fzf/key-bindings.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gab25/google-cloud-sdk/path.bash.inc' ]; then . '/home/gab25/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gab25/google-cloud-sdk/completion.bash.inc' ]; then . '/home/gab25/google-cloud-sdk/completion.bash.inc'; fi

#!/usr/bin/env zsh

HISTFILE="$XDG_STATE_HOME/zsh/zhistory"
HISTSIZE=100000
SAVEHIST=100000

# Save command timestamp and duration to history
setopt EXTENDED_HISTORY
# Trim dups before losing unique commands
setopt HIST_EXPIRE_DUPS_FIRST
# Do not display dups in history
setopt HIST_FIND_NO_DUPS
# Prevent dups being saved to history
setopt HIST_IGNORE_DUPS
# Do not save commands with a leading space to history
setopt HIST_IGNORE_SPACE
# Remove superfluous blanks from commands saved to history
setopt HIST_REDUCE_BLANKS
# Do not save dups when writing history file
setopt HIST_SAVE_NO_DUPS

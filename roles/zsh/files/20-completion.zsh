#!/usr/bin/env zsh

# https://grml.org/zsh/zsh-lovers.html#_completion
# https://thevaluable.dev/zsh-completion-guide-examples

# Move to the end of the word, if a single match is inserted or menu completion is performed
setopt ALWAYS_TO_END
# Complete from both ends
setopt COMPLETE_IN_WORD
# Immediately insert the first match. This option overrides AUTO_MENU
setopt MENU_COMPLETE
# Do not require a leading `.' in a filename to be matched explicitly
setopt GLOB_DOTS

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

zstyle ':completion:*' complete-options true

# Completion menu format
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}-- %d (errors: %e) --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red} -- no matches found --%f'

# Group matches
zstyle ':completion:*' group-name ''

# List files and folders in long format
zstyle ':completion:*' file-list all

# Match lowercase case-insensitive and enable substring matching
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# Ignore completion functions for commands you don't have
zstyle ':completion:*:*:*:*:functions' ignored-patterns '_*'

# Complete process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always

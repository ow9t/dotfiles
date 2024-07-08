#!/usr/bin/env zsh

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew/Homebrew"
path=("/opt/homebrew/bin" "/opt/homebrew/sbin" $path)
fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
manpath=("/opt/homebrew/share/man" $manpath)
infopath=("/opt/homebrew/share/info" $infopath)

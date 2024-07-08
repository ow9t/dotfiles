#!/usr/bin/env zsh

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_CELLAR="/usr/local/Cellar"
export HOMEBREW_REPOSITORY="/usr/local/Homebrew"
path=("/usr/local/bin" "/usr/local/sbin" $path)
fpath=("/usr/local/share/zsh/site-functions" $fpath)
manpath=("/usr/local/share/man" $manpath)
infopath=("/usr/local/share/info" $infopath)

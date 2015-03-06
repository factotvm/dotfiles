# Set up zsh completion
autoload -Uz compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

alias ls='ls -l'
alias ot='popd'
alias to='pushd'

# Load prompt
autoload -U promptinit
promptinit

# Use Vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

# Set patform depending on OS
platform='unknown'
if [[ $OSTYPE =~ darwin* ]]; then
    platform='darwin'
elif [[ $OSTYPE =~ linux* ]]; then
   platform='linux'
fi

# Add the ~ bin
export PATH=$HOME/bin:$PATH

# Add Homebrew path
if [[ $platform == 'darwin' ]] && (( $+commands[brew] )) ; then
   export PATH=/usr/local/bin:$PATH
fi

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

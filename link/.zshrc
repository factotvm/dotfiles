# Set up zsh completion
autoload -U compini
compini

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

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

# Set patform depending on OS
platform='unknown'
if [[ $OSTYPE =~ darwin* ]]; then
    platform='darwin'
elif [[ $OSTYPE =~ linux* ]]; then
   platform='linux'
fi

# Add Homebrew path
if [[ $platform == 'darwin' ]] && (( $+commands[brew] )) ; then
   export PATH=/usr/local/bin:$PATH
fi

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

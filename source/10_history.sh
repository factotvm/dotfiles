# Append to history
shopt -s histappend

# Verify the history
shopt -s histverify

export HISTIGNORE="l:la:ls:pwd:[#*]"
export HISTFILESIZE=9999
export HISTSIZE=9999
export HISTTIMEFORMAT="[%F %T %z] $PWD "

autoload -U promptinit
promptinit

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn
precmd() {
    vcs_info
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr     '%B%F{green} ✚ %f%b'
zstyle ':vcs_info:*' unstagedstr   '%B%F{yellow} ✱ %f%b'
zstyle ':vcs_info:*' formats       '[%s:%b] %c %u '
zstyle ':vcs_info:*' actionformats '[%s:%b] %c %u %B%s-%a%%b '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind git-remotebranch

# zstyle ':vcs_info:*+*:*' debug true

setopt prompt_subst
PROMPT='%F{cyan}%~%f ${vcs_info_msg_0_// /} %F{cyan}%#%f '
#RPROMPT='%D{%b %d %H:%S}'

### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | fgrep '??' &> /dev/null ; then
        hook_com[unstaged]+='%B%F{red}?%f%b'
    fi
}

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-aheadbehind() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "%B%F{cyan}+${ahead}%f%b" )

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
    (( $behind )) && gitstatus+=( "%B%F{cyan}-${behind}%f%b" )

    hook_com[misc]+=${(j::)gitstatus}
}

### git: Show remote branch name for remote-tracking branches
# Make sure you have added staged to your 'formats':  %b
function +vi-git-remotebranch() {
    local remote

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    # The first test will show a tracking branch whenever there is one. The
    # second test, however, will only show the remote branch's name if it
    # differs from the local one.
    #if [[ -n ${remote} ]] ; then
    if [[ -n ${remote} && ${remote#*/} != ${hook_com[branch]} ]] ; then
        hook_com[branch]="${hook_com[branch]}(%F{cyan}${remote}%f)"
    fi
}

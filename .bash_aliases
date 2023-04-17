## Bash Aliases ##
# some ls aliases
alias ll='ls -lFh'
alias la='ls -AFh'
alias l='ls -CFh'


## Application Aliasies ##

# aliases for git
alias ga="git add"
alias gs="git status"
alias gb="git branch"
alias gc="git commit"
alias gp="git push"
alias gm="git merge"
alias gr="git rebase"

# aliases to create and activate a Python virtual environment
alias ve='python3 -m venv ./.venv'
alias va='source ./.venv/bin/activate'
alias vd='deactivate'
alias da='vd'


## Utilities ##
# shorten and unshorten terminal prompt
# function shorten_termprompt() {
#         PS1="${PS1//@\\h/}"     # Remove @host
#         PS1="${PS1//\\w/\\W}"   # Change from full directory to last name
# }
# function default_termprompt() {
#     PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# }
# alias shorten='shorten_termprompt'
# alias unshorten='default_termprompt'
# alias lengthen='default_termprompt'
# alias defaultprompt='default_termprompt'
# alias termprompt='default_termprompt'
# ^^^ Old functionality, now replaced with starship
alias prompt='echo $PS1'

# function to list all distinct file types in current directory (recursively)
function get_all_file_types() {
    find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u
}
alias listtypes='get_all_filetypes'
alias types='get_all_filetypes'

# aliases to clear terminal
alias c="clear"
alias cls="clear"
alias clr="clear"

# alias for a copy command w/ a progress bar
alias cpv='rsync -ah --info=progress2'

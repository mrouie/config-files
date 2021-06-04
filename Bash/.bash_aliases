## Application Aliases ##
# aliases for python
alias python="python3"
alias py="python3"
alias pip="python3 -m pip"

# aliases to create and activate a Python virtual environment
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# aliases for wsl, cmd, and powershell
alias wsl="wsl.exe"
alias cmd="cmd.exe"
alias powershell="powershell.exe"
alias pshell="powershell.exe"

# aliases for explorer.exe
alias explorer="cmd.exe /C start"
alias start="cmd.exe /C start"

# aliases for other applications
alias notepad="notepad.exe"
alias npp="/mnt/c/Program\ Files/Notepad++/notepad++.exe"

# aliases for MST SSH profiles
alias ssh0="ssh UM-AD\\\mrnbq@rc01xcs213.managed.mst.edu"
alias ssh1="ssh UM-AD\\\mrnbq@rc22xcs213.managed.mst.edu"

# alias for openvpn profiles
alias mstvpn="sudo openvpn ~/openvpn/openvpn-mst-edu/openvpn-mst-edu.ovpn"
alias freevpn0="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-TCP80.ovpn"
alias freevpn1="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-TCP443.ovpn"
alias freevpn2="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-UDP53.ovpn"
alias freevpn3="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-UDP40000.ovpn"



## Utilities ##
# alias to shorten and unshorten prompt
alias shorten='shorten_termprompt'
alias unshorten='default_termprompt'
alias lengthen='default_termprompt'
function shorten_termprompt() {
        PS1="${PS1//@\\h/}"     # Remove @host
        PS1="${PS1//\\w/\\W}"   # Change from full directory to last name
}
function default_termprompt() {
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
}

# alias for finding all distinct file types in current directory (recursively)
alias types='get_all_filetypes'
alias filetypes='get_all_filetypes'
alias alltypes='get_all_filetypes'
function get_all_filetypes() {
    find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u
}

# aliases to clear terminal
alias c="clear"
alias cls="clear"
alias cl="clear"

# alias for sending an item to the "trash" (instead of deleting)
# alias tcn='mv --force -t ~/.local/share/Trash '
# Alternatively use "trashy"
# https://gitlab.com/trashy/trashy.git
# If installed from git, uncomment alias below
alias trash="trashy"

# alias for a copy command w/ a progress bar
alias cpv='rsync -ah --info=progress2'



## Directories ##
# aliases for multirotor directories
alias mmr="cd /mnt/e/OneDrive/Programming/Multirotor\ Robot\ Design\ Team/"
alias iarc2020="cd /mnt/e/OneDrive/Programming/Multirotor\ Robot\ Design\ Team/IARC-2020/"
alias cloneiarc="git clone https://github.com/MissouriMRR/IARC-2020 && cd IARC-2020 && pip install pre-commit && pre-commit install --hook-type pre-push"
# environment variables for multirotor directories
mmr="/mnt/e/OneDrive/Programming/Multirotor\ Robot\ Design\ Team/"
iarc2020="/mnt/e/OneDrive/Programming/Multirotor\ Robot\ Design\ Team/IARC-2020/"

# aliases for personal directories
alias winhome="cd /mnt/c/users/mrouie"
alias desktop="cd /mnt/e/OneDrive/Desktop"
alias onedrive="cd /mnt/e/OneDrive"
alias classes="cd /mnt/e/OneDrive/Classes/"
alias sp2021="cd /mnt/e/OneDrive/Classes/2020-21/SP2021/"
alias SP2021="cd /mnt/e/OneDrive/Classes/2020-21/SP2020/"
alias sp21="cd /mnt/e/OneDrive/Classes/2020-21/SP2021/"
alias SP21="cd /mnt/e/OneDrive/Classes/2020-21/SP2021/"

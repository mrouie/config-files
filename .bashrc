# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# alias to show motd
alias motd="run-parts /etc/update-motd.d/"

#function  showMotd() {
#    for i in /etc/update-motd.d/*; do if [ "$i" != "/etc/update-motd.d/98-fsck-at-reboot" ]; then $i; fi; done
#}

# show motd
run-parts /etc/update-motd.d/

# Set XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR="/tmp/runtime-mrouie"
export RUNLEVEL=3

# aliases for python
alias python="python3"
alias py="python3"
alias pip="python3 -m pip"

# aliases for wsl, cmd, and powershell
alias wsl="wsl.exe"
alias cmd="cmd.exe"
alias powershell="powershell.exe"
alias pshell="powershell.exe"

# aliases for explorer.exe
alias explorer="explorer.exe"
alias start="explorer.exe"

# aliases for other applications
alias notepad="notepad.exe"
alias npp="/mnt/c/Program\ Files/Notepad++/notepad++.exe"


# set DISPLAY environment variable for XLaunch
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"

# aliases for SSH profiles
alias ssh0="ssh UM-AD\\\mrnbq@rc01xcs213.managed.mst.edu"
alias ssh1="ssh UM-AD\\\mrnbq@rc22xcs213.managed.mst.edu"

# alias to clear
alias c="clear"
alias cls="clear"
alias cl="clear"

# alias to shorten and unshorten prompt
alias shorten='shortened_termprompt'
alias unshorten='default_termprompt'
alias lengthen='default_termprompt'
#
function shortened_termprompt() {
        PS1="${PS1//@\\h/}"     # Remove @host
        PS1="${PS1//\\w/\\W}"   # Change from full directory to last name
}
#
function default_termprompt() {
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
}

# alias for vpn profiles
alias mstvpn="sudo openvpn ~/openvpn/openvpn-mst-edu/openvpn-mst-edu.ovpn"
alias freevpn0="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-TCP80.ovpn"
alias freevpn1="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-TCP443.ovpn"
alias freevpn2="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-UDP53.ovpn"
alias freevpn3="sudo openvpn ~/openvpn/FreeVPN.me-OpenVPN-Bundle-July-2020/FreeVPN.me\ -\ Server1-NL/Server1-UDP40000.ovpn"

# aliases for multirotor
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

# END BASHRC

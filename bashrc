export LANG=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NAME=en_US.UTF-8

export EDITOR=nvim
export TERMINAL=sakura
export BROWSER=firefox
export TERM="screen-256color"
export MANPAGER='nvim +Man!'

export GOPATH=~/.local/share/go
export PATH=~/.local/bin:$GOPATH/bin:$PATH
export GOROOT=/usr/lib/go

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -Al'
alias vim='nvim'
alias xi='xclip -i'
alias xo='xclip -o'
alias sl='show-lyrics'
alias pga='pgrep -a'
alias fd='fdfind'

alias ansible-activate='source ~/Work/ansible/venv/bin/activate && export ANSIBLE_CONFIG=~/Work/ansible/ansible.cfg'
alias vpn-up='wg-quick up ~/.local/share/vpn.conf'
alias vpn-down='wg-quick down ~/.local/share/vpn.conf'

set_ps1() {
    user="\[\033[$1m\]\u\[\033[m\]"
    host=$HOSTNAME
    cwd="\[\033[1;37m\]\w\[\033[m\]"
    export PS1="$user@$host $cwd \$ "
}

case $USER in
    ag) set_ps1 '1;36' ;;
    root) set_ps1 '1;31' ;;
    *)    set_ps1 '1;37' ;;
esac
unset -f set_ps1

# eval "$(fzf --bash)"
source /usr/share/doc/fzf/examples/key-bindings.bash


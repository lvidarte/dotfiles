# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PYTHONSTARTUP=$HOME/.pythonrc
export PATH=~/bin:~/go/bin:$PATH
export GOPATH=~/go
export SSH_USER=xleo
export EDITOR=/usr/bin/vim.nox
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opencv/2.4.11/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opencv/3.0.0/lib

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

function get_git_branch ()
{
    DIRTY=""
    CLEAN="nothing to commit, working directory clean"
    [ "`git status 2> /dev/null | tail -n1`" != "$CLEAN" ] && DIRTY='*'
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$DIRTY)/"
}

if [ "$color_prompt" = yes ]; then

    source ~/.colors

    PS1="\n${DARK_GRAY}\$?) ${LIGHT_GREEN}\h${COLOR_OFF}:${LIGHT_BLUE}\w${COLOR_OFF}${LIGHT_YELLOW}\$(get_git_branch)${COLOR_OFF}\n${DARK_GRAY}$> ${COLOR_OFF}"
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

# Functions
function mkcd () { mkdir -p $1 && cd $1; }

function ssh-aws ()
{
    ssh -i /home/xleo/.ssh/it-coquelux.pem ubuntu@$1 2>/dev/null
}
function ssh-ecs ()
{
    ssh -i /home/xleo/.ssh/it-coquelux.pem ec2-user@$1
}
function scp-from-aws ()
{
    scp -i /home/xleo/.ssh/it-coquelux.pem -r ubuntu@$@
}
function scp-to-aws ()
{
    scp -i /home/xleo/.ssh/it-coquelux.pem -r $1 ubuntu@$2
}
function xc()
{
    FILE=`mktemp`
    xclip -o > $FILE \
        && vim $FILE \
        && cat $FILE | xclip -selection clipboard \
        && rm -f $FILE
}
function cat-to-clipboard()
{
    cat $1 | xclip -selection clipboard
}
function ssh-remove-key()
{
    local LINE=$1
    sed -i ${LINE}d $HOME/.ssh/known_hosts
}
function r()
{
    local DIR=/tmp/ranger-last-dir
    ranger --choosedir=$DIR $@
    cd `cat $DIR`
}
function opencv2-compile()
{
    g++ -g -o ${1%.*} $1 \
        -I/opt/opencv/2.4.11/include \
        -L/opt/opencv/2.4.11/lib \
        -lopencv_calib3d \
        -lopencv_contrib \
        -lopencv_core \
        -lopencv_features2d \
        -lopencv_flann \
        -lopencv_gpu \
        -lopencv_highgui \
        -lopencv_imgproc \
        -lopencv_legacy \
        -lopencv_ml \
        -lopencv_nonfree \
        -lopencv_objdetect \
        -lopencv_ocl \
        -lopencv_photo \
        -lopencv_stitching \
        -lopencv_superres \
        -lopencv_ts \
        -lopencv_video \
        -lopencv_videostab
}
function opencv3-compile()
{
    g++ -g -o ${1%.*} $1 \
        -I/opt/opencv/3.0.0/include \
        -L/opt/opencv/3.0.0/lib/ \
        -lopencv_calib3d \
        -lopencv_core \
        -lopencv_features2d \
        -lopencv_flann \
        -lopencv_highgui \
        -lopencv_imgcodecs \
        -lopencv_imgproc \
        -lopencv_ml \
        -lopencv_objdetect \
        -lopencv_photo \
        -lopencv_shape \
        -lopencv_stitching \
        -lopencv_superres \
        -lopencv_videoio \
        -lopencv_video \
        -lopencv_videostab
}

PATH="/home/xleo/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/xleo/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/xleo/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/xleo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/xleo/perl5"; export PERL_MM_OPT;

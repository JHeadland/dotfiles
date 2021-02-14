#-----------#
# ~/.bashrc #
#-----------#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set Termite as default terminal emulator
export TERMINAL=/usr/bin/termite
# Set Vim as default editor
export EDITOR=/usr/bin/vim
# Set Chromium as default browser
export BROWSER='/usr/bin/chromium'
# Erase and ignore duplicate lines in history
export HISTCONTROL="erasedups:ignoreboth"
# Don't record some commands in history
export HISTIGNORE="&:[ ]*:exit:ls:ranger:history:clear:school*"
# History length
export HISTSIZE=1000000
# Record each command to history as it gets issued
export PROMPT_COMMAND='history -a'
# Set window title to working directory/file/command
export PROMPT_COMMAND="$PROMPT_COMMAND;echo -ne \"\033]0;\$(pwd) \007\""

# Checks window size after each command to adjust line wrap
shopt -s checkwinsize
# Corrects spelling errors in arguments for cd
shopt -s cdspell
# Correct spelling errors during tab-completion
shopt -s dirspell
# Auto cd by typing directory as command
shopt -s autocd
# History list is appended to file rather than overwriting
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Recursive globbing through directories with **
shopt -s globstar 2> /dev/null
# Case-insensitive globbing
shopt -s nocaseglob

# Prompt
#PS1='[\u@\h \W]\$ '
PS1='\[\e[31m\] \h\[\e[m\]  \[\e[38;5;048m\] \u\[\e[m\]  \[\e[38;5;051m\] \w\[\e[m\]\n \[\e[32m\]\$\[\e[m\] '

# Add ~/Scripts to PATH
export PATH="~/Scripts:$PATH"

export PATH_TO_FX_MODS=~/Downloads/javafx-sdk-15/lib
export PATH_TO_FX_MODS=~/Downloads/javafx-jmods-15

# Add bash aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

#-------------------
# Readline bindings
#-------------------

# Tab through arguments
bind "TAB:menu-complete"
# Shift+Tab to tab backwards
bind "\"\e[Z\": menu-complete-backward"
# Shows all possibilities at first tab press
bind "set show-all-if-ambiguous on"
# Tab complete doesn't show hidden files
bind "set match-hidden-files off"
# Case insensitive tab completion
bind "set completion-ignore-case on"
# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"
# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"
# Searches history for what's already typed
bind "\"\e[A\":history-search-backward"
bind "\"\e[B\":history-search-forward"
# Ctrl+Left to go back a word
bind "\"\eOd\": backward-word"
# Ctrl+Right to go forward a word
bind "\"\eOc\": forward-word"

#-----------------
# Shell Functions
#-----------------

# Auto ls after cd
cd() { builtin cd "$@" && ls; }

# Auto cd after mkdir
mkcd() { mkdir -p "$@" && cd "$@"; }

# cd directly to school course directory
school() {
    if [ -z "$1" ]; then
        cd ~/School/UH/SP21
    else
        cd ~/School/UH/SP21/*${1^^}*
    fi
}

# Colored man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1'cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# If you come from bash you might have to change your $PATH.
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="linuxenko"
#ZSH_THEME="avit"


zmodload zsh/terminfo

export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

export USER_INFO=`grep -e "^$(whoami)\:" /etc/passwd | cut -d":" -f5,5`

#export TERM=xterm-256color
export TERM=screen-256color-s

export EDITOR=vim
export BROWSER=lynx

# TERM=rxvt-unicode
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(motd git vi-mode fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

export KEYTIMEOUT=1

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history


setopt histignorealldups
setopt histignorespace
#setopt sharehistory

setopt COMPLETE_IN_WORD
setopt interactivecomments
setopt autocd


# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'# User configuration



#############################################################################
# Autoloads
#############################################################################
autoload -U colors
colors

autoload -U bashcompinit
bashcompinit



# Kyebindings {{{
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Keypad
# # 0 . Enter
#bindkey -s "^[Op" "0"  
#bindkey -s "^[Ol" "."  
#bindkey -s "^[OM" "^M"  
# # 1 2 3
#bindkey -s "^[Oq" "1"  
#bindkey -s "^[Or" "2"  
#bindkey -s "^[Os" "3"  
# # 4 5 6
#bindkey -s "^[Ot" "4"  
#bindkey -s "^[Ou" "5"  
#bindkey -s "^[Ov" "6"  
# # 7 8 9
#bindkey -s "^[Ow" "7"  
#bindkey -s "^[Ox" "8"  
#bindkey -s "^[Oy" "9"  
# # + -  * /
#bindkey -s "^[Ok" "+"  
#bindkey -s "^[Om" "-"  
#bindkey -s "^[Oj" "*"  
#bindkey -s "^[Oo" "/"  

# Home End
#bindkey  "^[Oq" $terminfo[kend]
#bindkey  "^[Ow" $terminfo[khome]
#bindkey  "^[Ow" vi-end-of-line #$terminfo[kend]
#bindkey  "^[Oq" vi-beginning-of-line #$terminfo[khome]

# pUp pDown
#bindkey -s "^[Oy" ${terminfo[kpp]}
#bindkey -s "^[Os" ${terminfo[knp]}

# insert
#bindkey -s "^[Op" ${terminfo[kich1]} 

#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

#autoload zkbd
#[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
#[[ ! -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
#source  ~/.zkbd/$TERM-$VENDOR-$OSTYPE
#setup key accordingly
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Key settings
#key[Home]=${terminfo[khome]}
#key[End]=${terminfo[kend]}
#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}
#
# Key bindings
#[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"         beginning-of-line
#[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"          end-of-line
#[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"       overwrite-mode
#[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"       delete-char
#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"           up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"         down-line-or-history
#[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"         backward-char
#[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"        forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"       beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"     end-of-buffer-or-history
#[[ -n ${key[Backspace]}  ]]  && bindkey  "${key[Backspace]}"    backward-delete-char
#[[ -n ${key[Insert]}     ]]  && bindkey  "${key[Insert]}"       overwrite-mode
#[[ -n ${key[Home]}       ]]  && bindkey  "${key[Home]}"         beginning-of-line
#[[ -n ${key[PageUp]}     ]]  && bindkey  "${key[PageUp]}"       up-line-or-history
#[[ -n ${key[Delete]}     ]]  && bindkey  "${key[Delete]}"       delete-char
#[[ -n ${key[End]}        ]]  && bindkey  "${key[End]}"          end-of-line
#[[ -n ${key[PageDown]}   ]]  && bindkey  "${key[PageDown]}"     down-line-or-history
#[[ -n ${key[Up]}         ]]  && bindkey  "${key[Up]}"           up-line-or-search
#[[ -n ${key[Left]}       ]]  && bindkey  "${key[Left]}"         backward-char
#[[ -n ${key[Down]}       ]]  && bindkey  "${key[Down]}"         down-line-or-search
#[[ -n ${key[Right]}      ]]  && bindkey  "${key[Right]}"        forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"       history-beginning-search-backward
#[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" history-beginning-search-forward
# }}}

# ~/.zshrc
# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
PATH="$HOME/bin:/bin:/sbin:/usr/bin:/usr/games/:/usr/sbin:/usr/local/bin:/usr/local/sbin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/Soft/bin"
PATH="$PATH:$HOME/Soft/node/bin"
PATH="$PATH:$HOME/Soft/cross-compiler-mips/bin"
#PATH="$PATH:$HOME/Soft/cross-compiler-mips32-musl/bin"
PATH="$PATH:$HOME/Soft/cross-compiler-armv5l/bin"
PATH="$PATH:$HOME/Soft/xtensa-lx106-elf/bin"
PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"
export JAVA_HOME="$HOME/Soft/java/"
export ANDROID_HOME="$HOME/Soft/Android/"
export ANDROID_NDK_HOME="$HOME/Soft/android-ndk"

export WINEARCH=win32
export WINEPREFIX="/home/$USER/.wine"
export XDG_RUNTIME_DIR="/run/user/$UID"

export NODE_PATH=$HOME/Soft/node/lib/node_modules
#
# ### Added by the Heroku Toolbelt
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

alias e='vim'

# git
alias cm='git commit -a'
alias push='git push origin'
alias pull='git pull origin'
#alias gls='git log --oneline --color --graph --decorate --all'
alias gls="git log --pretty=\"format:%h %G? %aN  %s\" --graph"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias gm="gvfs-mount"
alias rsync="rsync -ah --progress"
alias clear="clear && lolcat ~/.motd"

# IP addresses
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias yl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# Ctrl + e -> Open Vim at edit current line
bindkey '^e' edit-command-line
#
# If running in screen, set the window title to the command about to be executed
#preexec() {
#    [ -n "$WINDOW" ] && screen -X title "`print -n $1 | awk '{print $1}'`"
#}

# If in screen, blank the window title when displaying the prompt
#premd() {
#    [ -n "$WINDOW" ] && screen -X title '' 
#}
#

# added by travis gem
#[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

[ -f $HOME/.aliases.sh ] && source $HOME/.aliases.sh

UTDIR="/tmp/.utmp-$USER"

if [ ! -d $UTDIR ]; then
   mkdir -p $UTDIR/{0..9}
   chmod 700 -R $UTDIR
fi

# openssl genrsa -out ./config/sslcerts/key.pem 4096
# openssl req -new -key ./config/sslcerts/key.pem -out ./config/sslcerts/csr.pem
# openssl x509 -req -days 365 -in ./config/sslcerts/csr.pem -signkey ./config/sslcerts/key.pem -out ./config/sslcerts/cert.pem

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/sveta/Soft/google-cloud-sdk/path.zsh.inc' ]; then source '/home/sveta/Soft/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/home/sveta/Soft/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/sveta/Soft/google-cloud-sdk/completion.zsh.inc'; fi

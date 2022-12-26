# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    autoswitch_virtualenv
    autojump
    sudo
    command-not-found
)

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
source $ZSH/oh-my-zsh.sh


if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi


# bindkey
bindkey ',' autosuggest-accept

# Example aliases
alias ra='ranger'
alias c="clear"
alias s="neofetch"
alias pc="sudo pacman -S"
alias e="exit"
alias vim="nvim"
alias pac="sudo pacman"
alias sz="source ~/.zshrc"
alias lg="lazygit"
alias f="fanyi"
alias zshrc="nvim ~/.zshrc"
alias gitpush='gitpush(){ git add . ;git status; git commit -m "first"; git push;};gitpush'
alias server="python3 -m http.server -d /home/se7en"
alias "redis-server"='redis-server(){ cd ~/redis-6.0.8/src;./redis-server;};redis-server'
alias "redis-cli"='redis-cli(){ cd ~/redis-6.0.8/src;./redis-cli;};redis-cli'
alias m="neomutt"
alias "fd"='fd(){ cd $(find ~/ -type d | fzf);ra;};fd'
alias "fe"='fe(){ nvim $(find ~/ -type f | fzf);};fe'
alias "lf"='lfub'
alias "patch"="sudo patch -p1 <"
alias "clean"="sudo make clean install"
alias "gc"="git clone"
alias "name"="git config --global user.name"
alias "email"="git config --global user.email"
alias "origin"="git remote add origin"
alias "b"="bash ~/scripts/dwmblocks-start.sh"

# ------------ Tmux Start-------------------
alias "tmux"="tmux -u"
alias "tls"="tmux ls"        #  NOTE: 列出会话
alias "tcs"="tmux new -s"    #  NOTE: 新建会话
alias "td"="tmux detach"     #  NOTE: 分离会话
alias "tsc"="tmux switch -t" #  NOTE: 切换会话
alias "tka"="tmux ls | cut -d: -f 1 | xargs -n1 tmux kill-session -t" #  NOTE: 杀死全部会话
alias "ts"="tmux source ~/.tmux.conf"
alias "at"="tmux at"
# ------------ Tmux End--------------------

alias "ls"="logo-ls"
alias "la"="logo-ls -A"
alias "ll"="logo-ls -al"
alias "lsg"="logo-ls -D"
alias "lag"="logo-ls -AD"
alias "llg"="logo-ls -alD"
alias "rcf"="rsync -r -v -u"
alias "rcx"="rsync --bwlimit=30000 --progress --append-verify"
alias "rcb"="rsync -r -v --archive"
alias "texdata"="rcf ~/github_upload/texdata/* ."

funciton tmuxopen() {
    tmux attach -t $1
}

funciton tmuxkill() {
    tmux kill-session -t $1
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules" . /home /etc'
export FZF_COMPLETION_TRIGGER='\'

_fzf_compgen_path() {
    fd --hidden --follow -E ".git" -E "node_modules" . /home /etc
}

_fzf_compgen_dir() {
    fd --hidden --follow -E ".git" -E "node_modules" . /home /etc
}


export PATH=$PATH:/usr/bin/ueberzug
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/usr/local/share/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.local/share/applications/
export PATH=$PATH:~/.local/src/
export PATH=$PATH:~/.local/bin/statusbar/
export PATH=$PATH:~/.local/share/applications/


export DISABLE_AUTO_TITLE='true'

# export PATH=$PATH:~/scripts/
# -------------- nnn --------------
export NNN_PLUG="i:imgview;p:preview-tabbed;f:fzopen;"
export NNN_FIFO=/tmp/nnn.fifo

export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux
export MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

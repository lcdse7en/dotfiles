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
    #  NOTE: oh-my-zsh 自带的插件
    git
    sudo
    autojump
    vi-mode
    extract
    cp # cpv
    z
    command-not-found
    #  NOTE: 第三方的插件
    zsh-syntax-highlighting
    zsh-autosuggestions
    # zsh-completions
    # autoswitch_virtualenv
    # zsh-history-substring-search
    # zoxide
)

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
source $ZSH/oh-my-zsh.sh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

#  NOTE: vi-mode
bindkey -v
export KEYTIMEOUT=1

#  NOTE: Use vim keys in tab complete menu:
bindkey -M vicmd "i" vi-insert
bindkey -M vicmd "I" vi-insert-bol
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "n" down-line-or-history
bindkey -M vicmd "u" up-line-or-history
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "h" vi-backward-char
bindkey -M vicmd "d" undo

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} == '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[6 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[6 q'

# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[6 q' ;}

_fix_cursor() {
  echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)


# bindkey
bindkey ',' autosuggest-accept



# Example aliases
alias ra='ranger'
alias c="clear"
alias s="neofetch"
alias pc="sudo pacman -S"
alias pcs="sudo pacman -Ss"
alias pcq="sudo pacman -Qs"
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

alias "cmake"="/usr/local/cmake/bin/cmake"

#  NOTE: plocate
alias "locate"="plocate"

# ------------ Tmux Start-------------------
alias "tmux"="tmux -u"
alias "tls"="tmux ls"        #  NOTE: 列出会话
alias "tcs"="tmux new -s"    #  NOTE: 新建会话
alias "td"="tmux detach"     #  NOTE: 分离会话
alias "tsc"="tmux switch -t" #  NOTE: 切换会话
alias "tka"="tmux ls | cut -d: -f 1 | xargs -n1 tmux kill-session -t" #  NOTE: 杀死全部会话
alias "ts"="tmux source ~/.tmux.conf"
alias "at"="tmux at"
alias "ss"="smug start server" #  NOTE: smug session tool
alias "sa"="smug start accounting" #  NOTE: smug session tool
# ------------ Tmux End--------------------

# ------------ logo-ls Start-------------------
alias "ls"="logo-ls"
alias "la"="logo-ls -A"
alias "ll"="logo-ls -al"
alias "lsg"="logo-ls -D"
alias "lag"="logo-ls -AD"
alias "llg"="logo-ls -alD"
# ------------ logo-ls End --------------------

alias "rcf"="rsync -r -v -u"
# alias "rcf"='rcf(){ rsync \-r \-v \-u;};rcf'
alias "rcx"="rsync --bwlimit=30000 --progress --append-verify"
alias "rcb"="rsync -r -v --archive"
alias "texdata1"="rcf ~/github_upload/texdata1/* ."
alias "texdata2"="rcf ~/github_upload/texdata2/* ."

# font
alias "zh"="fc-list :lang=zh > zh.md"
alias "ko"="fc-list :lang=ko > ko.md"

alias "hs"="sudo shutdown -h now"
alias "rs"="sudo shutdown -r now"
alias "fz"="pip freeze > requirements.md"   # pip freeze

#  NOTE: crontab
alias "ce"="crontab -e"
alias "cl"="crontab -l"
alias "cr"="crontab -r"

alias "pipd"="pipdeptree -p"
alias "pips"="pip3 show"

# jupyterlab
alias "jpl"="jupyter-lab"

# -----------   nnn ---------------
alias "nnn"="nnn -de"
export NNN_PLUG="i:imgvie;p:preview-tabbed;f:fzcd;t:preview-tui"
export NNN_OPENER="xdg-open"
export NNN_BMS="a:~/github_upload/accounting/"
export NNN_SEL="/tmp/.sel"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_COLORS="c1e2272e006033f7c6d6abc4"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tgz|zip|rar|tar)$"

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
export FZF_DEFAULT_OPTS='--height=80% --layout=reverse --inline-info --bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || ccat --color=always {} || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500" --preview-window right,45%'

# _fzf_compgen_path() {
#     fd --hidden --follow -E ".git" -E "node_modules" . /home /etc
# }
#
# _fzf_compgen_dir() {
#     fd --hidden --follow -E ".git" -E "node_modules" . /home /etc
# }


export PATH=$PATH:/usr/bin/ueberzug
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/usr/local/share/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.local/src/
export PATH=$PATH:~/.local/bin/statusbar/
export PATH=$PATH:~/.local/share/applications/
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/share/bob/nvim-bin/

export PATH=$PATH:~/.local/share/nvim/mason/bin


export DISABLE_AUTO_TITLE='true'


####### golang ########
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOPATH=$HOME/golang
export GO111MODULE=auto
# export GOMOD=on
# export GOPROXY=https://proxy.golang.com.cn,direct
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# export GOPROXY=https://goproxy.cn,https://goproxy.io,direct
# export GOPROXY=https://goproxy.cn,direct  # 七牛云

# export PATH=$PATH:~/scripts/

export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info
export PATH="$HOME/.local/bin${PATH:+:${PATH}}"

#  NOTE: rust mirror
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

#  NOTE: rye
export PATH=$PATH:/HOME/.rye/shims
# source "$HOME/.rye/env"

export BOB_CONFIG="$HOME/.config/bob/config.json"

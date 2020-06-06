# ZI
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes
# ZI

export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"

setopt no_beep
setopt prompt_subst

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=$(($SAVEHIST * 2))

autoload -Uz add-zsh-hook

# 色指定を使う
autoload -Uz colors
colors

# 補完機能の有効化と初期化
autoload -Uz compinit
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*:default' menu select=2
compinit

# VCS表示設定
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
add-zsh-hook precmd vcs_info

bindkey -v

PROMPT='%F{cyan}%n@%m%f:%B%~%b %F{green}${vcs_info_msg_0_}%f
%# '

if [ -f $HOME/.ziplugin ]; then . "$HOME/.ziplugin"; fi
if [ -f $HOME/.zshfunc ]; then . "$HOME/.zshfunc"; fi
if [ -f $HOME/.zshlocal ]; then . "$HOME/.zshlocal"; fi

# .zshenvに書くと上書きされてしまうもの
path=(
 /opt/homebrew/opt/ruby/bin
 $path
)

alias ls='ls -FG'
alias ll='ls -alFG'

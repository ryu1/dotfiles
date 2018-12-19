#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# - Powerlevel9k AwesomeFont selection (must call before sourcing)
POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_MODE='nerdfont-complete'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# 環境変数
export LANG=ja_JP.UTF-8

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "sorin-ionescu/prezto"
zplug load --verbose


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
HISTSIZE=10000
SAVEHIST=10000

# この秒数を超えたとき実行時間を表示する
REPORTTIME=1

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
# %# "
#PROMPT='%n@%m:%c$ '
#RPROMPT=''
# カレントディレクトリのフルパス表示
#RPROMPT="${RPROMPT}[%d] "
# 時間表示
#RPROMPT="${RPROMPT}[%T] "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# Add to HOOK the given FUNCTION.
# HOOK is one of chpwd, precmd, preexec, periodic, zshaddhistory,
# zshexit (the _functions subscript is not required).
autoload -Uz add-zsh-hook

########################################
# 時間がかかるコマンドを実行した後に通知する
local COMMAND=""
local COMMAND_TIME=""

_precmd_done_notifier() {
    if [ "$COMMAND_TIME" -ne "0" ] ; then
        local d=`date +%s`
        d=`expr $d - $COMMAND_TIME`
        if [ "$d" -ge "3" ] ; then
            COMMAND="$COMMAND "
            # brew install terminal-notifier
            which terminal-notifier > /dev/null 2>&1 && terminal-notifier -message "${${(s: :)COMMAND}[1]}" -m "$COMMAND";
        fi
    fi
    COMMAND="0"
    COMMAND_TIME="0"
}
add-zsh-hook precmd _precmd_done_notifier

_preexec_done_notifier() {
    COMMAND="${1}"
    if [ "`perl -e 'print($ARGV[0]=~/ssh|^vi/)' $COMMAND`" -ne 1 ] ; then
        COMMAND_TIME=`date +%s`
    fi
}
add-zsh-hook preexec _preexec_done_notifier



########################################
# vcs_info
#
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%s)-[%b]'
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
#
#_precmd_vcs_info() {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#add-zsh-hook precmd _precmd_vcs_info
#
#precmd () {
#    psvar=()
#    LANG=en_US.UTF-8 vcs_info
#    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}
#
#RPROMPT="${RPROMPT}%1(v|%F{green}%1v%f|)"
#

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# = の後はパス名として補完する
setopt magic_equal_subst

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias history='history -i -1000'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# brewでインストールしたgdbに別のエイリアスをふる
alias ggdb=/usr/local/Cellar/gdb/7.9.1/bin/gdb

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

# vim:set ft=zsh:

# MacPorts Installer addition on 2012-11-08_at_00:01:43: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Homebrew Installer addition on 2013-01-09_at_00:01:43: adding an appropriate PATH variable for use with Homebrew.
export PATH=/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with Homebrew.
# Homebrew Installer addition on 2012-11-08_at_00:01:43: adding an appropriate PATH variable for use with Homebrew.

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# npm
#export PATH="/usr/local/share/npm/bin:$PATH"

# go
#export GOROOT=/usr/local/opt/go/libexec
#export GOPATH="$HOME/go"
#export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# goenv(goof)
#export GOENVHOME=$HOME/.goenvs
#export GOENVTARGET=$HOME/.goenvtarget
#export GOENVGOROOT=$HOME/.goenvgoroot
#export GOROOT=$GOENVGOROOT/release
#export PATH=$GOROOT/bin:$PATH

#if [[ -r `which goenvwrapper.sh` ]]; then
#    source `which goenvwrapper.sh`
#else
#    echo "WARNING: Can't find goenvwrapper.sh"
#fi

# wfarr/goenv
#export PATH="$HOME/.goenv/bin:$PATH"
#eval "$(goenv init -)"
#export GOPATH="$HOME/go"
#export PATH="$GOPATH/bin:$PATH"

# cryptojuice/gobrew
#export PATH="$HOME/.gobrew/bin:$PATH"
#eval "$(gobrew init -)"

# Android SDK
#export ANDROID_BIN=~/Development/adt-bundle-mac-x86_64-20130917/sdk/tools/android
#export PATH=${PATH}:~/Development/adt-bundle-matcp://$(boot2docker ip 2>/dev/null):2375c-x86_64-20130917/sdk/platform-tools:~/Development/adt-bundle-mac-x86_64-20130917/sdk/tools
export ANDROID_HOME=~/Library/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk;
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH;
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$PATH;

# Gradle
export GRADLE_HOME=/usr/local/Cellar/gradle/1.12
export PATH=$PATH:$GRADLE_HOME/bin
export GRADLE_OPTS=-Dorg.gradle.daemon=true

# MacVim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
eval $(docker-machine env default --shell=zsh)


# nodebrew
#export NODEBREW_ROOT=$HOME/.nodebrew
#export PATH=$NODEBREW_ROOT:$NODEBREW_ROOT/current/bin:$PATH


# Python
#export PYENV_ROOT="${HOME}/.pyenv"
#if [ -d "${PYENV_ROOT}" ]; then
#    export PATH=${PYENV_ROOT}/bin:$PATH
#    eval "$(pyenv init -)"
#fi

# Ruby
#eval "$(rbenv init -)"

# To avoid the error of following .
#
# $ brew doctor
# Warning: "config" scripts exist outside your system or Homebrew directories.
# `./configure` scripts often look for *-config scripts to determine if
# software packages are installed, and what additional flags to use when
# compiling and linking.
#
# Having additional scripts in your path can confuse software installed via
# Homebrew if the config script overrides a system or Homebrew provided
# script of the same name. We found the following "config" scripts:
#    /Users/ryu/.pyenv/shims/python-config
#    /Users/ryu/.pyenv/shims/python2-config
#    /Users/ryu/.pyenv/shims/python2.7-config
#    /Users/ryu/.pyenv/shims/python3-config
#    /Users/ryu/.pyenv/shims/python3.4-config
#    /Users/ryu/.pyenv/shims/python3.4m-config
alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ryu/.sdkman"
[[ -s "/Users/ryu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ryu/.sdkman/bin/sdkman-init.sh"

# Xcode
## symbolicatecrash
### use `symbolicatecrash PATH/TO/input.crash PATH/TO/input.app.dSYM > PATH/TO/output.crash`
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
alias symbolicatecrash="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash"
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# PECO
# brew install peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

## OpenSSL
# $ brea install openssl
# A CA file has been bootstrapped using certificates from the SystemRoots
# keychain. To add additional certificates (e.g. the certificates added in
# the System keychain), place .pem files in
#   /usr/local/etc/openssl/certs
#
# and run
#   /usr/local/opt/openssl/bin/c_rehash
#
# openssl is keg-only, which means it was not symlinked into /usr/local,
# because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.
#
# If you need to have openssl first in your PATH run:
#   echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find openssl you may need to set:
#   export LDFLAGS="-L/usr/local/opt/openssl/lib"
#   export CPPFLAGS="-I/usr/local/opt/openssl/include"
#
# For pkg-config to find openssl you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export PATH="/usr/local/opt/openssl/bin:$PATH"

## Powerlevel9k
#
# Install Powerlevel9k for Prezto
#
# ```
# $ git clone https://github.com/bhilburn/powerlevel9k.git  ~/.zprezto/modules/prompt/external/powerlevel9k
# $ ln -s ~/.zprezto/modules/prompt/external/powerlevel9k/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup
# ```
# Install fonts.
#
# ```
# brew tap caskroom/fonts
# brew cask install font-hack-nerd-font
# brew cask install font-awesome-terminal-fonts
# ```
#
# - Powerlevel9k theme configuration
# - - Prompts

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv nvm time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# - - dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=7
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# - - vcs
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# - - status (level of description)
# POWERLEVEL9K_STATUS_VERBOSE=false

# - - time
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868 %Y.%m.%d}"
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uf017 %Y.%m.%d}"
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %Y.%m.%d}"


# anyenv
# - anyenv
#   git clone https://github.com/riywo/anyenv ~/.anyenv
#   mkdir -p $(anyenv root)/plugins
#
# - anyenv-update
#   git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
#
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

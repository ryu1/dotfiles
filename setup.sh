# 事前作業

# Key Customize
# システム環境設定 > キーボード>修飾キー > Caps Lockキー: ⌘ Command

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# SIP Disable
# Reboot Mac OS with Command + r

# iTerm2 Download And Install
# Chrome Download And Install
# Homebrew Download And Install
# https://brew.sh

# ログインシェルをzshに変更 
# (システム環境設定 > ユーザとグループ > 詳細オプション > ログインシェル: /usr/local/bin/zsh)
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh 


# home-brew
# ln -s ${DOTFILES_DIR}/Brewfile ~/Brewfile
# brew bundle

brew cask install java
export JAVA_HOME=`/usr/libexec/java_home -v 10`

brew install zplug
brew install wget
brew install tree
brew install zsh-completions
brew install peco
brew install git
brew install tmux
brew install anyenv
brew install direnv
brew install vim
brew install openssl
brew cask install docker

# Vim 
# Download and Install.
# https://github.com/splhack/macvim-kaoriya

# Ricty
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf


DOTFILES_DIR="/Users/ishitsuka/Repositories/git/dotfiles"
ln -fs ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -fs ${DOTFILES_DIR}/.zpreztorc ~/.zpreztorc

# prezto
export ZPLUG_HOME=/usr/local/opt/zplug
zplug install
ln -fs $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto

# preztoのdotfileに対してシンボルリンクを貼る
./prezto-setup.sh

# vim
ln -fs ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -fs ${DOTFILES_DIR}/.vim ~/.vim
ln -fs ${DOTFILES_DIR}/.dein.toml ~/.dein.toml

# git
ln -fs ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -fs ${DOTFILES_DIR}/.gitignore_global ~/.gitignore_global
cp -rf ${DOTFILES_DIR}/.gitconfig.local ~/.gitconfig.local


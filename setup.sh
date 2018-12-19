# 事前作業
# システム環境設定 > キーボード>修飾キー > Caps Lockキー: ⌘ Command
# Reboot Mac OS with Command + r
# Download https://brew.sh
# brew install zsh
# sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
# or (システム環境設定 > ユーザとグループ > 詳細オプション > ログインシェル: /usr/local/bin/zsh)
# chsh -s /usr/local/bin/zsh
# brew install zplug

DOTFILES_DIR="/Users/ryuichiishitsuka/Documents/git/dotfiles"

# homebrew
ln -s ${DOTFILES_DIR}/Brewfile ~/Brewfile
brew cask install java
export JAVA_HOME=`/usr/libexec/java_home -v 10`
brew install zplug
brew install ricty --with-powerline
brew bundle

# zsh
ln -fs ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -fs ${DOTFILES_DIR}/.zpreztorc ~/.zpreztorc

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


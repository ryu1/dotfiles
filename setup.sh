# 事前作業
# brew install zsh
# brew install zplug

DOTFILES_DIR="/Users/ryu/git/dotfiles"

# zsh
ln -s ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -s ${DOTFILES_DIR}/.zpreztorc ~/.zpreztorc

zplug install
ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto

# preztoのdotfileに対してシンボルリンクを貼る
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim
ln -s ${DOTFILES_DIR}/.vimrc ~/.vimrc
ln -s ${DOTFILES_DIR}/.vim ~/.vim
ln -s ${DOTFILES_DIR}/.dein.toml ~/.dein.toml

# git
ln -s ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -s ${DOTFILES_DIR}/.gitignore_global ~/.gitignore_global

# homebrew
ln -s ${DOTFILES_DIR}/Brewfile ~/Brewfile

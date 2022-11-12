ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.ocamlinit ~/.ocamlinit
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.vim/ftplugin
mkdir -p ~/.vim/snippets
mkdir -p ~/.vim/userautoload
ln -sf ~/dotfiles/vim/ftplugin/rust.vim ~/.vim/ftplugin/rust.vim
ln -sf ~/dotfiles/vim/ftplugin/c.vim ~/.vim/ftplugin/c.vim
ln -sf ~/dotfiles/vim/ftplugin/cpp.vim ~/.vim/ftplugin/cpp.vim
ln -sf ~/dotfiles/vim/snippets/org.snip ~/.vim/snippets/org.snip
ln -sf ~/dotfiles/vim/snippets/rust.snip ~/.vim/snippets/rust.snip
ln -sf ~/dotfiles/vim/userautoload/unix.vim ~/.vim/userautoload/unix.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim/ftplugin
mkdir -p ~/.config/nvim/snippets
mkdir -p ~/.config/nvim/userautoload
ln -sf ~/dotfiles/vim/ftplugin/rust.vim ~/.config/nvim/ftplugin/rust.vim
ln -sf ~/dotfiles/vim/ftplugin/c.vim ~/.config/nvim/ftplugin/c.vim
ln -sf ~/dotfiles/vim/ftplugin/cpp.vim ~/.config/nvim/ftplugin/cpp.vim
ln -sf ~/dotfiles/vim/snippets/org.snip ~/.config/nvim/snippets/org.snip
ln -sf ~/dotfiles/vim/snippets/rust.snip ~/.config/nvim/snippets/rust.snip
ln -sf ~/dotfiles/vim/userautoload/unix.vim ~/.config/nvim/userautoload/unix.vim
ln -sf ~/dotfiles/vim/coc/coc-settings.json ~/.config/nvim/coc-settings.json

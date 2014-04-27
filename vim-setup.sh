sudo yum install ack
vim +PluginInstall +qall
cd ~/.vim/bundle/vimproc
make
sudo mv /usr/share/vim/vim74/ftplugin/lisp.vim ~/lisp.vim.backup

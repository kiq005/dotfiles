# dotfiles
My dot files, to make life easier. The dotfiles were made for Arch Linux, but I'll try to keep it compatible with other systems.

## Files
On main, you'll find configurations files for:
- [Vim](https://www.vim.org/)
- [Tmux](https://github.com/tmux/tmux)

If you run on Linux or OS X, you probably can install them directly from your package manager.

There is also:
- Bash aliases

## Scripts
Some scripts are program specific, others are more general. Check it, and modify to your needs :smile:
Here is the list of programs that you may use with these scripts:
- [cmus](https://cmus.github.io/): A great CLI music player.
- [mpv](https://mpv.io/): I like VLC, but I always use mpv with my scripts.
- [calibre](https://calibre-ebook.com/): Until I find a better option, it's what I use for managing e-books. Use `calibredb` to access the database.
- [taskwarrior](https://taskwarrior.org/): The best task manager I found.
- [jrnl](https://jrnl.sh/): A simple jornal application.
- [ranger](https://github.com/ranger/ranger): A CLI file manager.

## Sub dependencies
- cmake
- ibus
- `pip install --user powerline-shell`
- `pip install --user thefuck`

## What you will need:
All tmux plugins are installed with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm). To install it:
```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plvim +PluginInstall +qallugins/tpm
```

Don't forget to `prefix` + <kbd>I</kbd> to install Tmux's plugins.

For vim plugins, I'm using vundle. Don't forget this commands:
```bash
vim -c VundleInstall -c quitall
vim -c VundleUpdate -c quitall
vim -c VundleClean -c quitall
```

To install it, use:
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then, from terminal, use `vim +PluginInstall +qall`.

**Be aware of the last command! It will erase plugins not installed listed in Vundle!**

Also, to setup [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe), run `~/.vim/bundle/Youcompleteme/install.py`.

Currently, the music related scripts works with cmus or spotify. Everything works fine with cmus, but you will need the [official spotify client](https://www.spotify.com/br/download/linux/) and [spotifycli](https://github.com/pwittchen/spotify-cli-linux) to get information and controll spotify.

## Tips
### You can remove window boarders in xfce by creating an empty theme....
```bash
sudo mkdir -p /usr/share/themes/empty/xfwm4/
sudo touch /usr/share/themes/empty/xfwm4/themerc
```
(From: https://www.reddit.com/r/unixporn/comments/7vmnim/xfce_minimal_no_border_xfce_desktop/)

## TODO:
- [ ] Add Rofi dotfiles
- [ ] Add Dunst dotfiles

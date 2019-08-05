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

## What you will need:
All tmux plugins are installed with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm). To install it:
```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Don't forget to `prefix` + <kbd>I</kbd> to install Tmux's plugins.

# Dotfiles

Personal shell and terminal configuration, mirrored using the same paths as the home directory.

Run `dotfiles-sync` to copy the current live configs here. In an existing shell, run
`source ~/.zshrc` once to load the alias. You can also run `bash ~/Developer/nezubn/dotfiles/sync.sh` directly.

Includes zsh startup files when present, tmux config and its retitle helper, and Ghostty config.
Missing source files are skipped; existing snapshots are kept. Sync overwrites the corresponding
copies here, so make configuration changes in your home directory before syncing.

Plugins, shell history, credentials, caches, and backup files are not collected.
Review configs for private values before publishing. Sync does not commit or push to Git.

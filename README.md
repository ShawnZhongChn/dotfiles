# dotfiles

Structured home environment for this machine.

## Principles

- Keep `~` minimal. Only standard user folders and a few shell entry files live there.
- Put active program configuration under `~/.config`.
- Use `~/.local/bin`, `~/.local/share`, and `~/.local/state` for user-managed binaries, data, and state.
- Treat `~/dotfiles` as the source of truth for maintained shell and CLI configuration.
- Prefer symlinks from `~` or `~/.config` into `~/dotfiles` instead of editing scattered files directly.

## Layout

- `home/`: files that must exist directly in `~`
- `config/`: files linked into `~/.config`
- `bin/`: user scripts intended to be on `PATH`
- `scripts/`: setup and maintenance helpers
- `docs/`: conventions and machine notes

## Host Roles

Local macOS keeps connection and display configuration:

- `config/ghostty`
- SSH configuration under `~/.ssh`
- WireGuard configuration under `~/.config/wireguard`

Remote development hosts keep the durable development environment:

- `config/tmux`
- `config/zsh`
- `config/git`
- `config/lazygit`
- editor and language tool configuration

The intended workflow is local terminal -> `ssh dev` -> remote tmux session.

## Bootstrap

Run:

```sh
~/dotfiles/scripts/bootstrap.sh
```

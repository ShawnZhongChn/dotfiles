# Maintenance Rules

1. New terminal and CLI tool config goes into `~/dotfiles/config/<tool>` when possible.
2. Files that must live at `~` should stay as thin forwarders only.
3. Personal helper scripts go in `~/dotfiles/bin` or `~/.local/bin`.
4. Long-lived local state should prefer `~/.local/state`.
5. Downloaded installers, temp exports, and ad-hoc files should not stay in `~`; move them into `Downloads` or a project directory.
6. Before adding a new hidden file directly under `~`, check whether the app supports `~/.config` or a symlinked target from `~/dotfiles`.

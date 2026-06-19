# Home Structure

## Keep in `~`

- Standard macOS user folders: `Desktop`, `Documents`, `Downloads`, `Library`, `Movies`, `Music`, `Pictures`, `Public`
- Minimal shell entry files when the shell requires them: `.zprofile`, `.zshrc`, `.zshenv`
- Tool-managed caches only when the tool does not support XDG-style paths

## Keep in `~/.config`

- Shell configuration
- Git configuration fragments
- Editor configuration
- Terminal tool configuration
- App configs that support XDG layout

## Keep in `~/.local`

- `bin/`: personal scripts and wrappers
- `share/`: user-owned app data
- `state/`: logs, histories, durable local state

## Avoid

- Creating project directories directly under `~`
- Leaving one-off scripts in `Desktop` or `Downloads`
- Storing maintained config only inside hidden root files when the tool supports `~/.config`
- Mixing machine notes, scripts, and app state in the same directory

## Rule of Thumb

If a file is something you want to version, document, review, or reuse, it should usually originate from `~/dotfiles`.

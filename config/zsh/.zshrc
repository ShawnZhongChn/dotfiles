HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"

if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  . /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  . /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export COLORTERM=truecolor
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias ll='eza -lh --icons --git'
  alias la='eza -lah --icons --git'
else
  alias ll='ls -lh'
  alias la='ls -lah'
fi

command -v bat >/dev/null 2>&1 && alias cat='bat'
command -v rg >/dev/null 2>&1 && alias grep='rg'
command -v tmuxinator >/dev/null 2>&1 && alias mux='tmuxinator'

if [[ -t 0 ]]; then
  stty -ixon
fi
bindkey -r '^S' 2>/dev/null || true

# Remote SSH sessions attach to a durable tmux session by default. Local shells
# stay outside tmux unless explicitly started.
if [[ -n "$SSH_CONNECTION" && -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]] && command -v tmux >/dev/null 2>&1; then
  tmux attach -t main 2>/dev/null || tmux new -s main
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

if [ -r "$HOME/.orbstack/shell/init.zsh" ]; then
  . "$HOME/.orbstack/shell/init.zsh"
fi

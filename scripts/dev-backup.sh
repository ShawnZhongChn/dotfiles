#!/bin/sh

set -eu

STAMP="$(date +%Y%m%d-%H%M%S)"
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/dev-backups"
ARCHIVE_DIR="$STATE_DIR/archives"
ARCHIVE="$ARCHIVE_DIR/$STAMP.tar.gz"
REMOTE_HOST="admin@47.116.2.156"
REMOTE_DIR="~/backups/dev"
SSH_KEY="$HOME/.ssh/id_ed25519_backup"
SSH_OPTS="-i $SSH_KEY -o BatchMode=yes -o StrictHostKeyChecking=accept-new"

mkdir -p "$ARCHIVE_DIR"

tar -C "$HOME" \
  --exclude-vcs \
  --exclude='.cache' \
  --exclude='.cargo/registry' \
  --exclude='.cargo/git' \
  --exclude='.npm/_cacache' \
  --exclude='project/**/node_modules' \
  --exclude='project/**/dist' \
  --exclude='project/**/target' \
  -czf "$ARCHIVE" \
  dotfiles \
  project \
  ssh \
  .config \
  .ssh \
  .claude \
  .gemini \
  .codex \
  .local/state \
  .viminfo

if [ -f "$ARCHIVE" ]; then
  ls -1t "$ARCHIVE_DIR"/*.tar.gz 2>/dev/null | sed -n '11,$p' | xargs -r rm -f
fi

ssh $SSH_OPTS "$REMOTE_HOST" "mkdir -p $REMOTE_DIR"
rsync -a -e "ssh $SSH_OPTS" "$ARCHIVE" "$REMOTE_HOST:$REMOTE_DIR/"
ssh $SSH_OPTS "$REMOTE_HOST" "cd $REMOTE_DIR && ls -1t *.tar.gz 2>/dev/null | sed -n '11,\$p' | xargs -r rm -f"

printf '%s\n' "$ARCHIVE"

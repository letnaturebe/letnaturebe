#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
cd "$SCRIPT_DIR"

BUNDLE_BIN="$(brew --prefix ruby)/bin/bundle"
if [ ! -x "$BUNDLE_BIN" ]; then
  echo "Homebrew Ruby bundler not found at $BUNDLE_BIN. Falling back to bundle in PATH." >&2
  BUNDLE_BIN="bundle"
fi

exec "$BUNDLE_BIN" exec jekyll s "$@"


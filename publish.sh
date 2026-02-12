#!/bin/bash
# Copies package files to a local clone of the typst/packages fork.
# Usage: ./publish.sh /path/to/typst-packages-fork

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 /path/to/typst-packages-fork"
  exit 1
fi

VERSION=$(grep '^version' typst.toml | sed 's/.*"\(.*\)"/\1/')
DEST="$1/packages/preview/calmly-touying/$VERSION"

mkdir -p "$DEST"

# Copy only package files
cp typst.toml lib.typ LICENSE README.md thumbnail.png "$DEST/"
cp -r theme template "$DEST/"

# Remove non-package files that might have snuck in
rm -rf "$DEST/examples" "$DEST/.gitignore" "$DEST/.claude"
find "$DEST" -name '*.pdf' -delete

echo "Copied to $DEST (version $VERSION)"

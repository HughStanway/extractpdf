#!/usr/bin/env bash
set -euo pipefail

# install.sh — install extractpdf.sh into ~/bin (or ~/.local/bin) without sudo

SCRIPT="extractpdf.sh"
# prefer ~/.local/bin, fallback to ~/bin
TARGET_DIR="${HOME}/.local/bin"
if [ ! -d "${TARGET_DIR}" ]; then
  TARGET_DIR="${HOME}/bin"
fi

# make sure the script is here
if [ ! -f "${SCRIPT}" ]; then
  echo "❌  Can't find ${SCRIPT} in $(pwd)" >&2
  exit 1
fi

# create and copy
mkdir -p "${TARGET_DIR}"
install -m 755 "${SCRIPT}" "${TARGET_DIR}/extractpdf"

echo "✅  Installed -> ${TARGET_DIR}/extractpdf"
echo
echo "Make sure '${TARGET_DIR}' is in your PATH. For example, add to ~/.bashrc or ~/.zshrc:"
echo "  export PATH=\"\$HOME/.local/bin:\$HOME/bin:\$PATH\""


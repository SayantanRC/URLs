#!/usr/bin/env bash

#########
# Usage:
# curl -fsSL https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/kmonad/remove.sh | sudo bash
##########

set -euo pipefail

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: $0"
  exit 1
fi

echo "========================================"
echo "        KMonad Removal Script"
echo "========================================"
echo

# ── 1. Stop and disable the service ──────────
echo "[1/3] Stopping and disabling KMonad service..."

systemctl disable --now kmonad.service 2>/dev/null || true
echo "  Service stopped and disabled."

SERVICE_FILE="/etc/systemd/system/kmonad.service"
if [[ -f "$SERVICE_FILE" ]]; then
  rm -f "$SERVICE_FILE"
  echo "  Removed $SERVICE_FILE"
fi

systemctl daemon-reload
echo

# ── 2. Remove config ──────────────────────────
echo "[2/3] Removing KMonad config..."

KBD_DIR="/etc/kmonad"
if [[ -d "$KBD_DIR" ]]; then
  rm -rf "$KBD_DIR"
  echo "  Removed $KBD_DIR"
else
  echo "  $KBD_DIR not found, skipping."
fi

echo

# ── 3. Remove binary ──────────────────────────
echo "[3/3] Removing KMonad binary..."

BINARY="/usr/local/bin/kmonad"
if [[ -f "$BINARY" ]]; then
  rm -f "$BINARY"
  echo "  Removed $BINARY"
else
  echo "  $BINARY not found, skipping."
fi

echo
echo "========================================"
echo "KMonad removal complete."
echo "========================================"
echo

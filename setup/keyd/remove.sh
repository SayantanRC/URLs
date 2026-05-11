#!/usr/bin/env bash

#########
# Usage:
# curl -fsSL https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/keyd/remove.sh | sudo bash
##########

set -euo pipefail

# Require root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: $0"
  exit 1
fi

PREFIX="/usr/local"

# ─────────────────────────────────────────────
# keyd Remove Script
# ─────────────────────────────────────────────

echo "========================================"
echo "          keyd Remove Script"
echo "========================================"
echo

# ── 1. Stop and disable service ───────────────
echo "[1/3] Stopping and disabling keyd service..."

systemctl disable --now keyd 2>/dev/null || true
systemctl daemon-reload

echo

# ── 2. Remove installed files ─────────────────
echo "[2/3] Removing installed files..."

rm -rf \
  "$PREFIX/bin/keyd" \
  "$PREFIX/bin/keyd-application-mapper" \
  "$PREFIX/share/doc/keyd/" \
  "$PREFIX/share/man/man1/keyd"*.gz \
  "$PREFIX/share/keyd/" \
  "$PREFIX/lib/systemd/system/keyd.service" \
  "$PREFIX/lib/sysusers.d/keyd.conf"

groupdel keyd 2>/dev/null || true

echo

# ── 3. Remove config ──────────────────────────
echo "[3/3] Removing keyd config..."

rm -rf /etc/keyd/

echo
echo "========================================"
echo "         keyd removed"
echo "========================================"
echo

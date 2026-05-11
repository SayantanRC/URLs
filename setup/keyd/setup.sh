#########
# Usage:
# curl -fsSL https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/keyd/setup.sh | sudo bash
##########

#!/usr/bin/env bash

set -euo pipefail

# Require root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: $0"
  exit 1
fi

BASE_URL="https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/keyd"

# ─────────────────────────────────────────────
# keyd Setup Script
# ─────────────────────────────────────────────

echo "========================================"
echo "          keyd Setup Script"
echo "========================================"
echo

# ── 1. Build and install keyd from source ────
if [[ -z "$(which keyd 2>/dev/null)" ]]; then
  echo "[1/3] Building keyd from source..."
  echo

  BUILD_DEPS="git build-essential"
  echo "  Installing build dependencies: $BUILD_DEPS"
  apt-get install -y $BUILD_DEPS > /dev/null 2>&1 || true

  SRC_DIR="/tmp/keyd-src"
  rm -rf "$SRC_DIR"
  git clone https://github.com/rvaiya/keyd "$SRC_DIR"

  cd "$SRC_DIR"

  echo "  Applying custom patch..."
  curl -fsSL "$BASE_URL/deferred-layer-mods.patch" | git apply

  echo "  Building and installing..."
  make && make install

  cd /
  rm -rf "$SRC_DIR"

  echo "  keyd installed to $(which keyd)"
else
  echo "[1/3] keyd already installed at $(which keyd), skipping build."
fi

echo

# ── 2. Pull config from GitHub ────────────────
echo "[2/3] Fetching keyd config..."

CONF_DIR="/etc/keyd"
mkdir -p "$CONF_DIR"

echo "  Downloading default.conf..."
curl -fsSL "$BASE_URL/default.conf" -o "$CONF_DIR/default.conf"
echo "  Saved to $CONF_DIR/default.conf"

echo

# ── 3. Enable & start the keyd service ────────
echo "[3/3] Enabling and starting keyd service..."

systemctl enable --now keyd

echo
echo "========================================"
echo "         keyd setup complete"
echo "========================================"
echo

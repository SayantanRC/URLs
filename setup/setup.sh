#!/usr/bin/env bash

set -euo pipefail

# Require root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root: $0"
  exit 1
fi

# ─────────────────────────────────────────────
# KMonad Setup Script
# ─────────────────────────────────────────────

echo "========================================"
echo "         KMonad Setup Script"
echo "========================================"
echo

# ── 1. Download latest KMonad release ────────
if [[ -z "$(which kmonad 2>/dev/null)" ]]; then
  echo "[1/4] Downloading latest KMonad release..."
  echo

  download_url=$(curl -s https://api.github.com/repos/kmonad/kmonad/releases/latest \
    | grep browser_download_url \
    | grep -v exe \
    | awk '{print $2}' \
    | sed 's/"//g')

  if [[ -z "$download_url" ]]; then
    echo "ERROR: Could not determine download URL. Check your internet connection."
    exit 1
  fi

  echo "Downloading: $download_url"
  echo

  tmp="/tmp/kmonad"
  wget "$download_url" -O "$tmp"
  chmod +x "$tmp"
  mv "$tmp" /usr/local/bin/kmonad

  if [[ -n "$(which restorecon 2>/dev/null)" ]]; then
    restorecon /usr/local/bin/kmonad
  fi

  echo "KMonad installed to /usr/local/bin/kmonad"
else
  echo "[1/4] KMonad already installed at $(which kmonad), skipping download."
fi

echo

# ── 2. Groups: input & uinput ─────────────────
echo "[2/4] Configuring groups..."

# Create uinput group if it doesn't exist
if ! getent group uinput > /dev/null 2>&1; then
  echo "  Creating 'uinput' group..."
  groupadd uinput
else
  echo "  Group 'uinput' already exists."
fi

# Add current user to input and uinput groups
CURRENT_USER="${SUDO_USER:-$USER}"

for group in input uinput; do
  if id -nG "$CURRENT_USER" | grep -qw "$group"; then
    echo "  User '$CURRENT_USER' is already in group '$group'."
  else
    echo "  Adding '$CURRENT_USER' to group '$group'..."
    usermod -aG "$group" "$CURRENT_USER"
  fi
done

# Persist uinput permissions across reboots via udev rule
UDEV_RULE_FILE="/etc/udev/rules.d/99-uinput.rules"
if [[ ! -f "$UDEV_RULE_FILE" ]]; then
  echo "  Creating udev rule for uinput at $UDEV_RULE_FILE..."
  echo 'KERNEL=="uinput", GROUP="uinput", MODE="0660"' | tee "$UDEV_RULE_FILE" > /dev/null
  udevadm control --reload-rules && udevadm trigger
fi

echo

# ── 3. Pull config files from GitHub ──────────
echo "[3/4] Fetching KMonad config files..."

# kmonad_config.kbd → /etc/kmonad/
KBD_DIR="/etc/kmonad"
KBD_FILE="$KBD_DIR/kmonad_config.kbd"
KBD_URL="https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/kmonad_config.kbd"

if [[ ! -d "$KBD_DIR" ]]; then
  echo "  Creating directory $KBD_DIR..."
  mkdir -p "$KBD_DIR"
fi

echo "  Downloading kmonad_config.kbd..."
curl -fsSL "$KBD_URL" -o "$KBD_FILE"
echo "  Saved to $KBD_FILE"

# kmonad.service → /etc/systemd/system/
SERVICE_FILE="/etc/systemd/system/kmonad.service"
SERVICE_URL="https://raw.githubusercontent.com/SayantanRC/URLs/refs/heads/master/setup/kmonad.service"

echo "  Downloading kmonad.service..."
curl -fsSL "$SERVICE_URL" -o "$SERVICE_FILE"
echo "  Saved to $SERVICE_FILE"

echo

# ── 4. Enable & start the KMonad service ──────
echo "[4/4] Enabling and starting KMonad service..."

systemctl daemon-reload
systemctl enable kmonad.service
systemctl restart kmonad.service

echo
echo "KMonad setup complete. Please reboot for all changes to take effect."

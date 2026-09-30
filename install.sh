#!/usr/bin/env bash
# ==============================================================================
# DevPDCA Installer for Google Antigravity & Agentic Coding Assistants
# Supports macOS and Linux.
#
# Usage:
#   # Remote one-liner (Global):
#   curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash
#
#   # Project installation:
#   ./install.sh --project
# ==============================================================================

set -euo pipefail

REPO_OWNER="mydrego-James"
REPO_NAME="DevPDCA"
BRANCH="main"
SCOPE="global"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project|-p)
      SCOPE="project"
      shift
      ;;
    --global|-g)
      SCOPE="global"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo "============================================="
echo "   DevPDCA Installer (v1.2.0)"
echo "============================================="

# 1. Determine Source
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "")"
TEMP_DIR=""

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/devpdca/SKILL.md" ]]; then
  echo "[-] Detected local repository at $SCRIPT_DIR"
  SOURCE_DIR="$SCRIPT_DIR/devpdca"
  LOCAL_PLUGIN_JSON="$SCRIPT_DIR/plugin.json"
else
  echo "[+] Fetching latest DevPDCA from GitHub ($REPO_OWNER/$REPO_NAME)..."
  TEMP_DIR="$(mktemp -d 2>/dev/null || mktemp -d -t 'devpdca')"
  ZIP_PATH="$TEMP_DIR/DevPDCA.zip"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "https://github.com/$REPO_OWNER/$REPO_NAME/archive/refs/heads/$BRANCH.zip" -o "$ZIP_PATH"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$ZIP_PATH" "https://github.com/$REPO_OWNER/$REPO_NAME/archive/refs/heads/$BRANCH.zip"
  else
    echo "Error: Neither curl nor wget was found. Please install one of them." >&2
    exit 1
  fi

  unzip -q "$ZIP_PATH" -d "$TEMP_DIR"
  SOURCE_DIR="$TEMP_DIR/$REPO_NAME-$BRANCH/devpdca"
  LOCAL_PLUGIN_JSON="$TEMP_DIR/$REPO_NAME-$BRANCH/plugin.json"
fi

if [[ ! -f "$SOURCE_DIR/SKILL.md" ]]; then
  echo "Error: Failed to find devpdca/SKILL.md." >&2
  exit 1
fi

# 2. Perform Installation based on Scope
if [[ "$SCOPE" == "global" ]]; then
  GEMINI_CONFIG="$HOME/.gemini/config"
  PLUGIN_DIR="$GEMINI_CONFIG/plugins/devpdca"
  SKILL_DIR="$PLUGIN_DIR/skills/devpdca"
  GLOBAL_SKILLS="$GEMINI_CONFIG/skills/devpdca"

  echo "[+] Installing DevPDCA to Global Plugin directory:"
  echo "    -> $PLUGIN_DIR"

  mkdir -p "$SKILL_DIR"
  cp -R "$SOURCE_DIR/"* "$SKILL_DIR/"

  # plugin.json
  if [[ -f "$LOCAL_PLUGIN_JSON" ]]; then
    cp "$LOCAL_PLUGIN_JSON" "$PLUGIN_DIR/plugin.json"
  else
    cat <<'EOF' > "$PLUGIN_DIR/plugin.json"
{
  "name": "devpdca",
  "displayName": "DevPDCA",
  "version": "1.2.0",
  "description": "A standalone development judgment skill for AI agents with a lightweight convergence check.",
  "author": {
    "name": "mydrego-James"
  },
  "license": "Apache-2.0",
  "keywords": [
    "pdca",
    "judgment",
    "convergence",
    "verification",
    "software-engineering"
  ]
}
EOF
  fi

  # Create symlink in ~/.gemini/config/skills/devpdca for dual compatibility
  mkdir -p "$GEMINI_CONFIG/skills"
  if [[ ! -e "$GLOBAL_SKILLS" ]]; then
    ln -s "$SKILL_DIR" "$GLOBAL_SKILLS"
  fi

  echo "[+] Files copied successfully."

  if command -v agy >/dev/null 2>&1; then
    echo "[+] Validating plugin with agy CLI..."
    agy plugin validate "$PLUGIN_DIR" || true
  fi

else
  PROJECT_SKILL_DIR="$(pwd)/.agent/skills/devpdca"
  echo "[+] Installing DevPDCA to project workspace:"
  echo "    -> $PROJECT_SKILL_DIR"

  mkdir -p "$PROJECT_SKILL_DIR"
  cp -R "$SOURCE_DIR/"* "$PROJECT_SKILL_DIR/"
  echo "[+] Project skill installed successfully."
fi

# 3. Cleanup
if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
  rm -rf "$TEMP_DIR"
fi

echo ""
echo "[✓] DevPDCA Installation Complete!"
echo "[i] The skill will now guide your agent with 'Convergence Before Consequential Action'."
echo "============================================="

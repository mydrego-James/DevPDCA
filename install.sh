#!/usr/bin/env bash
# ==============================================================================
# DevPDCA Installer for Google Antigravity & Agentic Coding Assistants
# Supports macOS and Linux (Debian, Ubuntu, Alpine, Fedora, CentOS, Arch, etc.)
#
# Usage:
#   # Remote one-liner (Global):
#   curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash
#
#   # Remote one-liner (Project):
#   curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash -s -- --project
#
#   # Local execution:
#   ./install.sh [--global|--project]
# ==============================================================================

set -euo pipefail

# Ensure consistent locale behavior
export LC_ALL="${LC_ALL:-C.UTF-8}"

REPO_OWNER="mydrego-James"
REPO_NAME="DevPDCA"
BRANCH="main"
SCOPE="${DEVPDCA_SCOPE:-global}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project|-p|project)
      SCOPE="project"
      shift
      ;;
    --global|-g|global)
      SCOPE="global"
      shift
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

echo "============================================="
echo "   [+] DevPDCA Installer (v1.2.0)"
echo "============================================="

# Function to remove UTF-8 BOM if present (POSIX compatible)
strip_bom() {
  local target="$1"
  if [[ -f "$target" ]]; then
    local bom
    bom="$(printf '\357\273\277')"
    local head3
    head3="$(dd if="$target" bs=1 count=3 2>/dev/null || echo "")"
    if [[ "$head3" == "$bom" ]]; then
      tail -c +4 "$target" > "${target}.tmp_nobom" && mv "${target}.tmp_nobom" "$target"
    fi
  fi
}

# 1. Determine Source
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd -P || echo "")"
TEMP_DIR=""

# Ensure cleanup on script exit or interruption
cleanup() {
  if [[ -n "${TEMP_DIR:-}" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT INT TERM

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/devpdca/SKILL.md" ]]; then
  echo "[-] Detected local repository at: $SCRIPT_DIR"
  SOURCE_DIR="$SCRIPT_DIR/devpdca"
  LOCAL_PLUGIN_JSON="$SCRIPT_DIR/plugin.json"
else
  echo "[+] Fetching latest DevPDCA from GitHub ($REPO_OWNER/$REPO_NAME)..."
  TEMP_DIR="$(mktemp -d 2>/dev/null || mktemp -d -t 'devpdca.XXXXXX')"

  # Prefer tar.gz (POSIX standard, present in 100% of minimal Linux/macOS environments)
  # Fallback to .zip if tar is not available
  if command -v tar >/dev/null 2>&1; then
    TAR_URL="https://github.com/$REPO_OWNER/$REPO_NAME/archive/refs/heads/$BRANCH.tar.gz"
    TAR_PATH="$TEMP_DIR/DevPDCA.tar.gz"
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL "$TAR_URL" -o "$TAR_PATH"
    elif command -v wget >/dev/null 2>&1; then
      wget -qO "$TAR_PATH" "$TAR_URL"
    else
      echo "Error: Neither curl nor wget was found. Please install one of them." >&2
      exit 1
    fi
    tar -xzf "$TAR_PATH" -C "$TEMP_DIR"
  elif command -v unzip >/dev/null 2>&1; then
    ZIP_URL="https://github.com/$REPO_OWNER/$REPO_NAME/archive/refs/heads/$BRANCH.zip"
    ZIP_PATH="$TEMP_DIR/DevPDCA.zip"
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL "$ZIP_URL" -o "$ZIP_PATH"
    elif command -v wget >/dev/null 2>&1; then
      wget -qO "$ZIP_PATH" "$ZIP_URL"
    else
      echo "Error: Neither curl nor wget was found. Please install one of them." >&2
      exit 1
    fi
    unzip -q "$ZIP_PATH" -d "$TEMP_DIR"
  else
    echo "Error: Neither tar nor unzip was found. Please install tar or unzip." >&2
    exit 1
  fi

  SOURCE_DIR="$TEMP_DIR/$REPO_NAME-$BRANCH/devpdca"
  LOCAL_PLUGIN_JSON="$TEMP_DIR/$REPO_NAME-$BRANCH/plugin.json"
fi

if [[ ! -f "$SOURCE_DIR/SKILL.md" ]]; then
  echo "Error: Failed to find devpdca/SKILL.md in source directory." >&2
  exit 1
fi

# 2. Perform Installation based on Scope
if [[ "$SCOPE" == "global" ]]; then
  USER_HOME="${HOME:-$(eval echo ~${USER:-})}"
  GEMINI_CONFIG="$USER_HOME/.gemini/config"
  PLUGIN_DIR="$GEMINI_CONFIG/plugins/devpdca"
  SKILL_DIR="$PLUGIN_DIR/skills/devpdca"
  GLOBAL_SKILLS="$GEMINI_CONFIG/skills/devpdca"

  echo "[+] Installing DevPDCA to Global Plugin directory:"
  echo "    -> $PLUGIN_DIR"

  mkdir -p "$SKILL_DIR"
  cp -R "$SOURCE_DIR/." "$SKILL_DIR/"

  # plugin.json (guaranteed UTF-8 without BOM)
  if [[ -f "$LOCAL_PLUGIN_JSON" ]]; then
    cp "$LOCAL_PLUGIN_JSON" "$PLUGIN_DIR/plugin.json"
    strip_bom "$PLUGIN_DIR/plugin.json"
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

  # Sanitize SKILL.md BOM
  strip_bom "$SKILL_DIR/SKILL.md"

  # Create symlink in ~/.gemini/config/skills/devpdca for dual compatibility
  mkdir -p "$GEMINI_CONFIG/skills"
  if [[ -L "$GLOBAL_SKILLS" ]]; then
    ln -sfn "$SKILL_DIR" "$GLOBAL_SKILLS"
  elif [[ -d "$GLOBAL_SKILLS" ]]; then
    # Directory already exists from older install; replace with symlink or sync
    rm -rf "$GLOBAL_SKILLS"
    ln -sf "$SKILL_DIR" "$GLOBAL_SKILLS" || cp -R "$SKILL_DIR/." "$GLOBAL_SKILLS/"
  else
    ln -sf "$SKILL_DIR" "$GLOBAL_SKILLS"
  fi

  echo "    [OK] Files deployed successfully."

  if command -v agy >/dev/null 2>&1; then
    echo "[+] Validating plugin with Antigravity CLI (agy)..."
    agy plugin validate "$PLUGIN_DIR" || true
  fi

else
  CURRENT_DIR="$(pwd -P)"
  PROJECT_SKILL_DIR="$CURRENT_DIR/.agent/skills/devpdca"
  echo "[+] Installing DevPDCA to project workspace:"
  echo "    -> $PROJECT_SKILL_DIR"

  mkdir -p "$PROJECT_SKILL_DIR"
  cp -R "$SOURCE_DIR/." "$PROJECT_SKILL_DIR/"
  strip_bom "$PROJECT_SKILL_DIR/SKILL.md"

  echo "    [OK] Project skill installed successfully."
fi

echo ""
echo "[OK] DevPDCA Installation Complete!"
echo "[i] The skill will now guide your agent with 'Convergence Before Consequential Action'."
echo "============================================="

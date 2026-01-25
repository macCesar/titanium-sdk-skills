#!/bin/bash

# Titanium SDK Skills Installer
# Compatible with: Claude Code, Gemini CLI, Codex CLI

set -e

REPO_URL="https://github.com/macCesar/titanium-sdk-skills"
SKILLS=(alloy-expert purgetss ti-ui ti-howtos ti-guides alloy-guides alloy-howtos)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}Titanium SDK Skills Installer${NC}"
echo ""

# Parse arguments first
CUSTOM_PATH=""
ALL_FLAG=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --path)
            CUSTOM_PATH="$2"
            shift 2
            ;;
        --all)
            ALL_FLAG=true
            shift
            ;;
        --help)
            echo "Usage: ./install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --all          Install to all detected platforms without prompting"
            echo "  --path PATH    Install to a custom path"
            echo "  --help         Show this help message"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Detect installed platforms
PLATFORM_NAMES=()
PLATFORM_PATHS=()
PLATFORM_DISPLAY=()

if [ -d "$HOME/.claude" ]; then
    PLATFORM_NAMES+=("claude")
    PLATFORM_PATHS+=("$HOME/.claude/skills")
    PLATFORM_DISPLAY+=("Claude Code")
    echo -e "${GREEN}✓${NC} Claude Code detected"
fi

if [ -d "$HOME/.gemini" ]; then
    PLATFORM_NAMES+=("gemini")
    PLATFORM_PATHS+=("$HOME/.gemini/skills")
    PLATFORM_DISPLAY+=("Gemini CLI")
    echo -e "${GREEN}✓${NC} Gemini CLI detected"
fi

if [ -d "$HOME/.codex" ]; then
    PLATFORM_NAMES+=("codex")
    PLATFORM_PATHS+=("$HOME/.codex/skills")
    PLATFORM_DISPLAY+=("Codex CLI")
    echo -e "${GREEN}✓${NC} Codex CLI detected"
fi

if [ ${#PLATFORM_NAMES[@]} -eq 0 ]; then
    echo -e "${YELLOW}No AI coding assistants detected.${NC}"
    echo "Install one of: Claude Code, Gemini CLI, or Codex CLI"
    echo "Or use: ./install.sh --path /custom/path"
    exit 1
fi

echo ""

# Install function
install_skills() {
    local dest="$1"
    mkdir -p "$dest"
    for skill in "${SKILLS[@]}"; do
        if [ -d "$TMP_DIR/repo/skills/$skill" ]; then
            cp -r "$TMP_DIR/repo/skills/$skill" "$dest/"
        fi
    done
}

# Handle custom path
if [ -n "$CUSTOM_PATH" ]; then
    TMP_DIR=$(mktemp -d)
    trap "rm -rf $TMP_DIR" EXIT
    echo -ne "Downloading... "
    git clone --depth 1 --quiet "$REPO_URL" "$TMP_DIR/repo" 2>/dev/null || { echo -e "${RED}Failed${NC}"; exit 1; }
    echo -e "${GREEN}Done${NC}"
    echo -ne "Installing to $CUSTOM_PATH... "
    install_skills "$CUSTOM_PATH"
    echo -e "${GREEN}Done${NC}"
    SKILLS_LIST=$(printf '%s, ' "${SKILLS[@]}" | sed 's/, $//')
echo -e "\n${GREEN}✓ Installed:${NC} $SKILLS_LIST"
echo ""
echo "Start using them by asking about Titanium SDK development!"
echo ""
echo "Examples:"
echo "  \"Create a login screen with PurgeTSS styling\""
echo "  \"How do I structure an Alloy app?\""
echo "  \"Implement push notifications\""
echo ""
    exit 0
fi

# Select platforms to install
SELECTED_INDICES=()

if [ "$ALL_FLAG" = true ]; then
    for i in "${!PLATFORM_NAMES[@]}"; do
        SELECTED_INDICES+=("$i")
    done
else
    # Interactive selection
    echo -e "${BOLD}Select platform to install:${NC}"
    echo ""
    echo -e "  ${CYAN}a)${NC} All detected platforms"

    for i in "${!PLATFORM_NAMES[@]}"; do
        echo -e "  ${CYAN}$((i+1)))${NC} ${PLATFORM_DISPLAY[$i]} only"
    done

    echo -e "  ${CYAN}q)${NC} Quit"
    echo ""

    read -p "Enter your choice: " choice

    case $choice in
        a|A)
            for i in "${!PLATFORM_NAMES[@]}"; do
                SELECTED_INDICES+=("$i")
            done
            ;;
        q|Q)
            echo "Cancelled."
            exit 0
            ;;
        *)
            if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#PLATFORM_NAMES[@]} ]; then
                SELECTED_INDICES+=("$((choice-1))")
            else
                IFS=',' read -ra SELECTIONS <<< "$choice"
                for sel in "${SELECTIONS[@]}"; do
                    sel=$(echo "$sel" | tr -d ' ')
                    if [[ "$sel" =~ ^[0-9]+$ ]] && [ "$sel" -ge 1 ] && [ "$sel" -le ${#PLATFORM_NAMES[@]} ]; then
                        SELECTED_INDICES+=("$((sel-1))")
                    fi
                done
                if [ ${#SELECTED_INDICES[@]} -eq 0 ]; then
                    echo -e "${RED}Invalid selection.${NC}"
                    exit 1
                fi
            fi
            ;;
    esac
fi

if [ ${#SELECTED_INDICES[@]} -eq 0 ]; then
    echo "No platforms selected."
    exit 0
fi

# Download
TMP_DIR=$(mktemp -d)
trap "rm -rf $TMP_DIR" EXIT

echo -ne "\nDownloading... "
git clone --depth 1 --quiet "$REPO_URL" "$TMP_DIR/repo" 2>/dev/null || { echo -e "${RED}Failed${NC}"; exit 1; }
echo -e "${GREEN}Done${NC}"

# Install to selected platforms
for i in "${SELECTED_INDICES[@]}"; do
    echo -ne "Installing to ${PLATFORM_DISPLAY[$i]}... "
    install_skills "${PLATFORM_PATHS[$i]}"
    echo -e "${GREEN}Done${NC}"
done

SKILLS_LIST=$(printf '%s, ' "${SKILLS[@]}" | sed 's/, $//')
echo -e "\n${GREEN}✓ Installed:${NC} $SKILLS_LIST"
echo ""
echo "Start using them by asking about Titanium SDK development!"
echo ""
echo "Examples:"
echo "  \"Create a login screen with PurgeTSS styling\""
echo "  \"How do I structure an Alloy app?\""
echo "  \"Implement push notifications\""
echo ""

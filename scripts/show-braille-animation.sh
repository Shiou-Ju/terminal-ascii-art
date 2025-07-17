#!/bin/bash

# Braille Capybara Animation Script
# 逐一顯示 Braille 水豚圖案，每個間隔 1 秒

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BRAILLE_FILE="$SCRIPT_DIR/../asciiart/capybara-braille-complete.txt"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Clear screen first
clear

echo -e "${CYAN}🦫 Braille Capybara Animation${NC}"
echo -e "${YELLOW}Credit: emojicombos.com/capybara-ascii-art${NC}"
echo ""
sleep 1

# Array to store patterns
declare -a patterns=()
declare -a pattern_names=()

# Read patterns into array
current_pattern=""
pattern_name=""
in_pattern=false

while IFS= read -r line; do
    if [[ "$line" == "## "* ]]; then
        if [[ -n "$current_pattern" ]]; then
            patterns+=("$current_pattern")
            pattern_names+=("$pattern_name")
        fi
        pattern_name=$(echo "$line" | sed 's/## //')
        current_pattern=""
        in_pattern=true
        continue
    fi
    
    if [[ "$in_pattern" == true ]]; then
        # Skip empty lines at the beginning
        if [[ -z "$line" ]] && [[ -z "$current_pattern" ]]; then
            continue
        fi
        current_pattern+="$line"$'\n'
    fi
done < "$BRAILLE_FILE"

# Add last pattern
if [[ -n "$current_pattern" ]]; then
    patterns+=("$current_pattern")
    pattern_names+=("$pattern_name")
fi

# Show each pattern with 1 second delay
for i in "${!patterns[@]}"; do
    clear
    echo -e "${CYAN}🦫 Braille Capybara Animation${NC}"
    echo -e "${YELLOW}Credit: emojicombos.com/capybara-ascii-art${NC}"
    echo ""
    echo -e "${GREEN}Pattern: ${pattern_names[$i]}${NC}"
    echo ""
    echo "${patterns[$i]}"
    sleep 1
done

# Final message
echo ""
echo -e "${BLUE}Animation complete! 🦫${NC}"
echo -e "${YELLOW}Total patterns shown: ${#patterns[@]}${NC}"
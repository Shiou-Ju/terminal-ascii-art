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

# Parse command line arguments
ARG="$1"
START_IDX=0
END_IDX=$((${#patterns[@]} - 1))

# Parse additional parameters
FAST_MODE=false
NO_CLEAR=false
QUIET_MODE=false
STARTUP_MODE=false

# Check for parameters
for param in "$@"; do
    case $param in
        --fast|--no-sleep)
            FAST_MODE=true
            ;;
        --no-clear)
            NO_CLEAR=true
            ;;
        --quiet)
            QUIET_MODE=true
            ;;
        --startup)
            STARTUP_MODE=true
            FAST_MODE=true
            NO_CLEAR=true
            QUIET_MODE=true
            ;;
    esac
done

if [[ -n "$ARG" && ! "$ARG" =~ ^-- ]]; then
    if [[ "$ARG" =~ ^[0-9]+$ ]]; then
        # Single number: show only that pattern
        PATTERN_NUM=$((ARG - 1))  # Convert to 0-based index
        if [[ $PATTERN_NUM -ge 0 && $PATTERN_NUM -lt ${#patterns[@]} ]]; then
            START_IDX=$PATTERN_NUM
            END_IDX=$PATTERN_NUM
        else
            echo -e "${YELLOW}Pattern number $ARG not found. Available: 1-${#patterns[@]}${NC}"
            exit 1
        fi
    elif [[ "$ARG" =~ ^([0-9]+)-([0-9]+)$ ]]; then
        # Range: show patterns in range
        START_NUM=$((${BASH_REMATCH[1]} - 1))
        END_NUM=$((${BASH_REMATCH[2]} - 1))
        if [[ $START_NUM -ge 0 && $END_NUM -lt ${#patterns[@]} && $START_NUM -le $END_NUM ]]; then
            START_IDX=$START_NUM
            END_IDX=$END_NUM
        else
            echo -e "${YELLOW}Invalid range. Available: 1-${#patterns[@]}${NC}"
            exit 1
        fi
    else
        echo -e "${YELLOW}Usage: $0 [number|range] [options]${NC}"
        echo -e "${YELLOW}  $0                    - Show all patterns${NC}"
        echo -e "${YELLOW}  $0 5                 - Show pattern 5${NC}"
        echo -e "${YELLOW}  $0 1-10              - Show patterns 1 to 10${NC}"
        echo -e "${YELLOW}  $0 3 --fast          - Show pattern 3 without delay${NC}"
        echo -e "${YELLOW}  $0 25 --startup      - Show pattern 25 in startup mode${NC}"
        echo ""
        echo -e "${YELLOW}Options:${NC}"
        echo -e "${YELLOW}  --fast, --no-sleep   - No delay between frames${NC}"
        echo -e "${YELLOW}  --no-clear           - Don't clear screen${NC}"
        echo -e "${YELLOW}  --quiet              - Don't show title and info${NC}"
        echo -e "${YELLOW}  --startup            - Startup mode (fast + no-clear + quiet)${NC}"
        exit 1
    fi
fi

# Show selected patterns with optional delay
for i in $(seq $START_IDX $END_IDX); do
    # Clear screen unless --no-clear is specified
    if [[ "$NO_CLEAR" != true ]]; then
        clear
    fi
    
    # Show header unless --quiet is specified
    if [[ "$QUIET_MODE" != true ]]; then
        echo -e "${CYAN}🦫 Braille Capybara Animation${NC}"
        echo -e "${YELLOW}Credit: emojicombos.com/capybara-ascii-art${NC}"
        echo ""
        echo -e "${GREEN}Pattern: ${pattern_names[$i]} (${i+1}/${#patterns[@]})${NC}"
        echo ""
    fi
    
    # Show the pattern
    echo "${patterns[$i]}"
    
    # Add delay unless --fast is specified
    if [[ "$FAST_MODE" != true ]]; then
        sleep 1
    fi
done

# Final message
echo ""
echo -e "${BLUE}Animation complete! 🦫${NC}"
SHOWN_COUNT=$((END_IDX - START_IDX + 1))
echo -e "${YELLOW}Patterns shown: $SHOWN_COUNT of ${#patterns[@]}${NC}"
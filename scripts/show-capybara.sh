#!/bin/bash

# Terminal ASCII Art - Capybara Collection
# Simple capybara display script for MVP demo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GALLERY_FILE="$SCRIPT_DIR/../asciiart/capybara-gallery.txt"

# Colors (optional, fallback to no color if not supported)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display a specific capybara
show_capybara() {
    local style="$1"
    local found=false
    
    if [[ ! -f "$GALLERY_FILE" ]]; then
        echo "Error: Gallery file not found at $GALLERY_FILE"
        exit 1
    fi
    
    # Read the gallery file and extract the requested capybara
    while IFS= read -r line; do
        if [[ "$line" == "### CAPYBARA_${style}_"* ]]; then
            found=true
            echo -e "${GREEN}🦫 Capybara ($style):${NC}"
            echo ""
            continue
        fi
        
        if [[ "$found" == true ]]; then
            if [[ "$line" == "### END ###" ]]; then
                break
            fi
            echo -e "${YELLOW}$line${NC}"
        fi
    done < "$GALLERY_FILE"
    
    if [[ "$found" == false ]]; then
        echo "Error: Capybara style '$style' not found"
        echo "Available styles: relaxed, zen, happy, swimming, sleepy, small"
        exit 1
    fi
}

# Function to show random capybara
show_random() {
    local styles=("relaxed" "zen" "happy" "swimming" "sleepy" "small")
    local random_style=${styles[$RANDOM % ${#styles[@]}]}
    show_capybara "$random_style"
}

# Function to show help
show_help() {
    echo -e "${BLUE}🦫 Capybara ASCII Art Display Tool${NC}"
    echo ""
    echo "Usage: $0 [STYLE|random]"
    echo ""
    echo "Available styles:"
    echo "  relaxed   - Chill and relaxed capybara"
    echo "  zen       - Meditative capybara"
    echo "  happy     - Happy capybara"
    echo "  swimming  - Swimming capybara"
    echo "  sleepy    - Sleepy capybara"
    echo "  small     - Small basic capybara"
    echo "  random    - Random capybara"
    echo ""
    echo "Examples:"
    echo "  $0 relaxed"
    echo "  $0 zen"
    echo "  $0 random"
    echo ""
    echo "No arguments = random capybara"
}

# Main logic
main() {
    case "${1:-random}" in
        "help"|"-h"|"--help")
            show_help
            ;;
        "random"|"")
            show_random
            ;;
        "relaxed"|"zen"|"happy"|"swimming"|"sleepy"|"small")
            show_capybara "$1"
            ;;
        *)
            echo "Error: Unknown style '$1'"
            echo ""
            show_help
            exit 1
            ;;
    esac
    
    echo ""
    echo -e "${BLUE}Let terminal be more cute, one capybara at a time! 🦫${NC}"
}

# Execute main function
main "$@"
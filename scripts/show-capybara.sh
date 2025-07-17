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
        if [[ "$line" == "### CAPYBARA_${style} ###" ]] || [[ "$line" == "### CAPYBARA_${style}_"* ]]; then
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
        echo "Available styles: relaxed, zen, happy, swimming, sleepy, small, enhanced_relaxed, enhanced_zen, profile_left, sitting"
        exit 1
    fi
}

# Function to show random capybara
show_random() {
    local styles=("relaxed" "zen" "happy" "swimming" "sleepy" "small" "enhanced_relaxed" "enhanced_zen" "profile_left" "sitting")
    local random_style=${styles[$RANDOM % ${#styles[@]}]}
    show_capybara "$random_style"
}

# Function to show braille gallery
show_braille_gallery() {
    local braille_file="$SCRIPT_DIR/../asciiart/capybara-braille-gallery.txt"
    
    if [[ ! -f "$braille_file" ]]; then
        echo -e "${RED}Error: Braille gallery file not found${NC}"
        return 1
    fi
    
    # Check Unicode support
    if ! locale | grep -q "UTF-8"; then
        echo -e "${YELLOW}⚠️  Your terminal may not support Unicode properly${NC}"
        echo -e "${YELLOW}    Braille art may not display correctly${NC}"
        echo ""
    fi
    
    echo -e "${BLUE}🦫 Capybara Braille Art Gallery${NC}"
    echo -e "${CYAN}High-resolution Unicode point art${NC}"
    echo ""
    
    # Show all braille patterns
    local current_pattern=""
    local in_pattern=false
    
    while IFS= read -r line; do
        if [[ "$line" == "### CAPYBARA_braille_"* ]]; then
            current_pattern=$(echo "$line" | sed 's/###.*braille_\(.*\)_.*###/\1/')
            in_pattern=true
            echo -e "${GREEN}🎨 $current_pattern${NC}"
            echo ""
            continue
        fi
        
        if [[ "$in_pattern" == true ]]; then
            if [[ "$line" == "### END ###" ]]; then
                in_pattern=false
                echo ""
                continue
            fi
            # Skip comment lines and credit lines
            if [[ ! "$line" =~ ^#.*$ ]] && [[ ! "$line" =~ ^.*Credit:.*$ ]]; then
                echo "$line"
            fi
        fi
    done < "$braille_file"
    
    echo -e "${YELLOW}📝 Braille art credited to emojicombos.com${NC}"
}

# Function to show scenes
show_scenes() {
    local scenes_file="$SCRIPT_DIR/../asciiart/capybara-scenes.txt"
    
    if [[ ! -f "$scenes_file" ]]; then
        echo -e "${RED}Error: Scenes file not found${NC}"
        return 1
    fi
    
    echo -e "${BLUE}🦫 Capybara Scene Collection${NC}"
    echo ""
    
    local current_scene=""
    local in_scene=false
    
    while IFS= read -r line; do
        if [[ "$line" == "### CAPYBARA_"* ]]; then
            current_scene=$(echo "$line" | sed 's/###.*CAPYBARA_\(.*\)_.*###/\1/')
            in_scene=true
            echo -e "${GREEN}🌅 $current_scene${NC}"
            echo ""
            continue
        fi
        
        if [[ "$in_scene" == true ]]; then
            if [[ "$line" == "### END ###" ]]; then
                in_scene=false
                echo ""
                continue
            fi
            # Skip comment lines
            if [[ ! "$line" =~ ^#.*$ ]]; then
                echo -e "${YELLOW}$line${NC}"
            fi
        fi
    done < "$scenes_file"
}

# Function to show animations
show_animations() {
    echo -e "${BLUE}🦫 Capybara Animation Preview${NC}"
    echo -e "${CYAN}Simple animation frames${NC}"
    echo ""
    
    local animations_file="$SCRIPT_DIR/../asciiart/capybara-animations.txt"
    
    if [[ ! -f "$animations_file" ]]; then
        echo -e "${RED}Error: Animations file not found${NC}"
        return 1
    fi
    
    echo -e "${GREEN}👁️  Blink Animation:${NC}"
    show_animation_set "blink" "$animations_file"
    
    echo -e "${GREEN}🍃 Chew Animation:${NC}"
    show_animation_set "chew" "$animations_file"
    
    echo -e "${GREEN}🏊 Swim Animation:${NC}"
    show_animation_set "swim" "$animations_file"
}

# Helper function to show animation set
show_animation_set() {
    local animation_name="$1"
    local file="$2"
    local frame_num=1
    
    while IFS= read -r line; do
        if [[ "$line" == "### ANIMATION_${animation_name}_frame${frame_num} ###" ]]; then
            echo ""
            echo -e "${YELLOW}Frame $frame_num:${NC}"
            
            # Read until ### END ###
            while IFS= read -r content_line; do
                if [[ "$content_line" == "### END ###" ]]; then
                    break
                fi
                echo "$content_line"
            done
            
            ((frame_num++))
            echo ""
        fi
    done < "$file"
}

# Function to show help
show_help() {
    echo -e "${BLUE}🦫 Capybara ASCII Art Display Tool${NC}"
    echo ""
    echo "Usage: $0 [STYLE|random]"
    echo ""
    echo "Available styles:"
    echo "  relaxed        - Chill and relaxed capybara"
    echo "  zen            - Meditative capybara"
    echo "  happy          - Happy capybara"
    echo "  swimming       - Swimming capybara"
    echo "  sleepy         - Sleepy capybara"
    echo "  small          - Small basic capybara"
    echo "  enhanced_relaxed - Enhanced version with better proportions"
    echo "  enhanced_zen   - Enhanced zen with improved design"
    echo "  profile_left   - Side view profile"
    echo "  sitting        - Sitting posture"
    echo "  random         - Random capybara"
    echo ""
    echo "Additional content:"
    echo "  braille        - High-resolution Braille art (requires Unicode)"
    echo "  scenes         - Contextual scenes"
    echo "  animations     - Animation frames"
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
        "relaxed"|"zen"|"happy"|"swimming"|"sleepy"|"small"|"enhanced_relaxed"|"enhanced_zen"|"profile_left"|"sitting")
            show_capybara "$1"
            ;;
        "braille")
            show_braille_gallery
            ;;
        "scenes")
            show_scenes
            ;;
        "animations")
            show_animations
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
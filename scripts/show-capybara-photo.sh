#!/bin/bash

# Terminal ASCII Art - Capybara Photo Collection
# 獨立的照片轉 ASCII 工具，使用 jp2a

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PHOTOS_DIR="$SCRIPT_DIR/../photos/originals"
CONVERT_SCRIPT="$SCRIPT_DIR/convert-photo.sh"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to show photo
show_photo() {
    local photo_path="$1"
    
    # Check if convert script exists
    if [[ ! -x "$CONVERT_SCRIPT" ]]; then
        echo -e "${RED}Error: convert-photo.sh not found or not executable${NC}"
        exit 1
    fi
    
    # If no specific photo, show gallery
    if [[ -z "$photo_path" ]] || [[ "$photo_path" == "gallery" ]]; then
        show_photo_gallery
        return
    fi
    
    # Convert specific photo
    if [[ -f "$photo_path" ]]; then
        echo -e "${GREEN}🦫 Converting photo to ASCII art...${NC}"
        "$CONVERT_SCRIPT" -s medium "$photo_path"
    else
        echo -e "${RED}Error: Photo not found: $photo_path${NC}"
        exit 1
    fi
}

# Function to show photo gallery
show_photo_gallery() {
    echo -e "${BLUE}🦫 Capybara Photo Gallery${NC}"
    echo ""
    
    if [[ ! -d "$PHOTOS_DIR" ]]; then
        echo -e "${RED}Error: Photos directory not found${NC}"
        exit 1
    fi
    
    local photos=($(ls "$PHOTOS_DIR"/*.jpg 2>/dev/null))
    
    if [[ ${#photos[@]} -eq 0 ]]; then
        echo -e "${YELLOW}No photos found in gallery${NC}"
        return
    fi
    
    # Show each photo
    for photo in "${photos[@]}"; do
        local name=$(basename "$photo" .jpg)
        echo -e "${GREEN}>>> $name${NC}"
        "$CONVERT_SCRIPT" -s small "$photo" | head -15
        echo ""
    done
}

# Function to show random photo
show_random_photo() {
    local photos=($(ls "$PHOTOS_DIR"/*.jpg 2>/dev/null))
    
    if [[ ${#photos[@]} -eq 0 ]]; then
        echo -e "${RED}No photos found${NC}"
        exit 1
    fi
    
    local random_photo=${photos[$RANDOM % ${#photos[@]}]}
    echo -e "${GREEN}🦫 Random photo: $(basename "$random_photo")${NC}"
    echo ""
    "$CONVERT_SCRIPT" -s medium "$random_photo"
}

# Function to show help
show_help() {
    echo -e "${BLUE}🦫 Capybara Photo ASCII Art Tool${NC}"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  gallery           - Show all photos in gallery"
    echo "  random            - Show random photo"
    echo "  [FILE]            - Convert specific photo"
    echo ""
    echo "Examples:"
    echo "  $0 gallery"
    echo "  $0 random"
    echo "  $0 /path/to/photo.jpg"
    echo "  $0 photos/originals/capybara-relax.jpg"
    echo ""
    echo "For more photo conversion options, use:"
    echo "  ./convert-photo.sh --help"
    echo ""
    echo "Note: This tool uses jp2a for photo conversion"
}

# Main logic
main() {
    case "${1:-gallery}" in
        "help"|"-h"|"--help")
            show_help
            ;;
        "gallery"|"")
            show_photo_gallery
            ;;
        "random")
            show_random_photo
            ;;
        *)
            # Treat as file path
            show_photo "$1"
            ;;
    esac
    
    echo ""
    echo -e "${BLUE}Let terminal be more cute, one capybara at a time! 🦫${NC}"
}

# Execute main function
main "$@"
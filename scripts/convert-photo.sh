#!/bin/bash

# convert-photo.sh - 將照片轉換為 ASCII art
# 使用 jp2a 工具進行轉換，支援多種參數設定

# 顏色輸出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 預設參數
DEFAULT_WIDTH=60
DEFAULT_CHARS=" .oO@"
OUTPUT_DIR="photos/ascii"
DEFAULT_INVERT="--invert"

# 函數：顯示使用說明
show_help() {
    cat << EOF
使用方式: $0 [選項] <圖片檔案>

將圖片轉換為 ASCII art 的工具

選項:
  -w, --width WIDTH      設定輸出寬度 (預設: $DEFAULT_WIDTH)
  -s, --size SIZE        設定預設尺寸 (small/medium/large)
  -c, --chars CHARS      自訂字符集 (預設: "$DEFAULT_CHARS")
  -i, --invert          反轉顏色（深色背景用）
  -o, --output FILE      輸出到檔案
  -b, --border          加上邊框
  -p, --preview         預覽不同參數效果
  -h, --help            顯示此說明

預設尺寸:
  small   - 40 字符寬（終端友善）
  medium  - 60 字符寬（平衡）
  large   - 80 字符寬（細節豐富）

範例:
  $0 photo.jpg                    # 使用預設設定
  $0 -s small photo.jpg           # 小尺寸輸出
  $0 -w 100 -i photo.jpg          # 100字符寬，反轉顏色
  $0 -p photo.jpg                 # 預覽不同效果

EOF
}

# 函數：檢查 jp2a 是否安裝
check_jp2a() {
    if ! command -v jp2a &> /dev/null; then
        echo -e "${RED}錯誤：jp2a 未安裝${NC}"
        echo "請執行以下指令安裝："
        echo "  macOS: brew install jp2a"
        echo "  Ubuntu: sudo apt install jp2a"
        exit 1
    fi
}

# 函數：預覽不同參數效果
preview_effects() {
    local image="$1"
    
    echo -e "${BLUE}=== 預覽不同參數效果 ===${NC}"
    
    # 尺寸預覽
    echo -e "\n${YELLOW}1. 小尺寸 (40字符)${NC}"
    jp2a "$image" --width=40 | head -10
    
    echo -e "\n${YELLOW}2. 中尺寸 (60字符)${NC}"
    jp2a "$image" --width=60 | head -10
    
    echo -e "\n${YELLOW}3. 大尺寸 (80字符)${NC}"
    jp2a "$image" --width=80 | head -10
    
    # 字符集預覽
    echo -e "\n${YELLOW}4. 簡單字符集${NC}"
    jp2a "$image" --width=40 --chars=" .oO@" | head -10
    
    echo -e "\n${YELLOW}5. 複雜字符集${NC}"
    jp2a "$image" --width=40 --chars=" .',:;i1tfLCG08@" | head -10
    
    # 反轉效果
    echo -e "\n${YELLOW}6. 反轉顏色（深色背景）${NC}"
    jp2a "$image" --width=40 --invert | head -10
}

# 主程式
main() {
    # 檢查 jp2a
    check_jp2a
    
    # 解析參數
    local width=$DEFAULT_WIDTH
    local chars="$DEFAULT_CHARS"
    local invert="$DEFAULT_INVERT"
    local output=""
    local border=""
    local preview=false
    local image=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -w|--width)
                width="$2"
                shift 2
                ;;
            -s|--size)
                case $2 in
                    small) width=40 ;;
                    medium) width=60 ;;
                    large) width=80 ;;
                    *) echo -e "${RED}錯誤：無效的尺寸 '$2'${NC}"; exit 1 ;;
                esac
                shift 2
                ;;
            -c|--chars)
                chars="$2"
                shift 2
                ;;
            -i|--invert)
                invert="--invert"
                shift
                ;;
            --no-invert)
                invert=""
                shift
                ;;
            -o|--output)
                output="$2"
                shift 2
                ;;
            -b|--border)
                border="--border"
                shift
                ;;
            -p|--preview)
                preview=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                image="$1"
                shift
                ;;
        esac
    done
    
    # 檢查圖片參數
    if [[ -z "$image" ]]; then
        echo -e "${RED}錯誤：請指定圖片檔案${NC}"
        show_help
        exit 1
    fi
    
    if [[ ! -f "$image" ]]; then
        echo -e "${RED}錯誤：找不到檔案 '$image'${NC}"
        exit 1
    fi
    
    # 預覽模式
    if $preview; then
        preview_effects "$image"
        exit 0
    fi
    
    # 建立輸出目錄
    mkdir -p "$OUTPUT_DIR"
    
    # 構建 jp2a 指令
    local cmd="jp2a"
    cmd="$cmd --width=$width"
    cmd="$cmd --chars=\"$chars\""
    [[ -n "$invert" ]] && cmd="$cmd $invert"
    [[ -n "$border" ]] && cmd="$cmd $border"
    cmd="$cmd \"$image\""
    
    # 執行轉換
    if [[ -n "$output" ]]; then
        echo -e "${GREEN}轉換中...${NC}"
        eval "$cmd" > "$output"
        echo -e "${GREEN}已儲存到: $output${NC}"
    else
        eval "$cmd"
    fi
}

# 執行主程式
main "$@"
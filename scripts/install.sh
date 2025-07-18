#!/bin/bash

# Terminal ASCII Art - Capybara Collection 安裝腳本
# 自動安裝和配置 capybara ASCII art 工具集

set -e  # 遇到錯誤立即退出

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 全域變數
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INSTALL_DIR="$HOME/.capybara-ascii"
SHELL_RC=""
SYSTEM_TYPE=""

# 函數：顯示標題
show_header() {
    echo -e "${CYAN}"
    echo "🦫 =================================="
    echo "   Terminal ASCII Art - Capybara"
    echo "   Installation Script"
    echo "=================================== 🦫"
    echo -e "${NC}"
}

# 函數：檢測系統類型
detect_system() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        SYSTEM_TYPE="macOS"
        echo -e "${BLUE}🖥️  檢測到系統：macOS${NC}"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SYSTEM_TYPE="Linux"
        echo -e "${BLUE}🐧 檢測到系統：Linux${NC}"
    else
        echo -e "${RED}❌ 不支援的系統類型：$OSTYPE${NC}"
        exit 1
    fi
}

# 函數：檢測 Shell 類型
detect_shell() {
    if [[ -n "$ZSH_VERSION" ]]; then
        SHELL_RC="$HOME/.zshrc"
        echo -e "${BLUE}🐚 檢測到 Shell：zsh${NC}"
    elif [[ -n "$BASH_VERSION" ]]; then
        SHELL_RC="$HOME/.bashrc"
        echo -e "${BLUE}🐚 檢測到 Shell：bash${NC}"
    else
        # 預設使用 bash
        SHELL_RC="$HOME/.bashrc"
        echo -e "${YELLOW}⚠️  無法檢測 Shell 類型，使用預設：bash${NC}"
    fi
}

# 函數：檢查單個依賴
check_dependency() {
    local dep="$1"
    local install_cmd="$2"
    
    if command -v "$dep" &> /dev/null; then
        echo -e "${GREEN}✅ $dep 已安裝${NC}"
        return 0
    else
        echo -e "${RED}❌ $dep 未安裝${NC}"
        echo -e "${YELLOW}   請執行：$install_cmd${NC}"
        return 1
    fi
}

# 函數：檢查所有依賴
check_dependencies() {
    echo -e "${PURPLE}🔍 檢查依賴套件...${NC}"
    
    local missing_deps=0
    
    # 檢查系統依賴
    if [[ "$SYSTEM_TYPE" == "macOS" ]]; then
        check_dependency "cowsay" "brew install cowsay" || ((missing_deps++))
        check_dependency "figlet" "brew install figlet" || ((missing_deps++))
        check_dependency "jp2a" "brew install jp2a" || ((missing_deps++))
    elif [[ "$SYSTEM_TYPE" == "Linux" ]]; then
        check_dependency "cowsay" "sudo apt-get install cowsay" || ((missing_deps++))
        check_dependency "figlet" "sudo apt-get install figlet" || ((missing_deps++))
        check_dependency "jp2a" "sudo apt-get install jp2a" || ((missing_deps++))
    fi
    
    if [[ $missing_deps -gt 0 ]]; then
        echo -e "${RED}❌ 發現 $missing_deps 個未安裝的依賴${NC}"
        echo -e "${YELLOW}📋 請先安裝上述依賴，然後重新執行安裝腳本${NC}"
        return 1
    else
        echo -e "${GREEN}✅ 所有依賴都已安裝${NC}"
        return 0
    fi
}

# 函數：創建安裝目錄
create_install_dir() {
    echo -e "${PURPLE}📁 創建安裝目錄...${NC}"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        echo -e "${YELLOW}⚠️  目錄已存在：$INSTALL_DIR${NC}"
        read -p "是否要覆蓋現有安裝？(y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}⏹️  安裝已取消${NC}"
            exit 0
        fi
        rm -rf "$INSTALL_DIR"
    fi
    
    mkdir -p "$INSTALL_DIR"
    echo -e "${GREEN}✅ 創建目錄：$INSTALL_DIR${NC}"
}

# 函數：複製檔案
copy_files() {
    echo -e "${PURPLE}📋 複製專案檔案...${NC}"
    
    # 複製核心目錄
    cp -r "$PROJECT_DIR/cowsay" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 cowsay 檔案${NC}"
    cp -r "$PROJECT_DIR/figlet" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 figlet 檔案${NC}"
    cp -r "$PROJECT_DIR/asciiart" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 asciiart 檔案${NC}"
    cp -r "$PROJECT_DIR/scripts" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 scripts 檔案${NC}"
    cp -r "$PROJECT_DIR/photos" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 photos 檔案${NC}"
    
    # 複製文件
    cp "$PROJECT_DIR/README.md" "$INSTALL_DIR/" && echo -e "${GREEN}✅ 複製 README.md${NC}"
    
    # 設定執行權限
    chmod +x "$INSTALL_DIR/scripts/"*.sh
    echo -e "${GREEN}✅ 設定執行權限${NC}"
}

# 函數：設定 Shell 別名
setup_aliases() {
    echo -e "${PURPLE}⚙️  設定 Shell 別名...${NC}"
    
    # 創建別名配置
    local alias_config="
# 🦫 Terminal ASCII Art - Capybara Collection 別名
# 自動產生於 $(date)

# ASCII Art 水豚指令
alias capy='$INSTALL_DIR/scripts/show-capybara.sh'
alias capy-zen='$INSTALL_DIR/scripts/show-capybara.sh zen'
alias capy-happy='$INSTALL_DIR/scripts/show-capybara.sh happy'
alias capy-swim='$INSTALL_DIR/scripts/show-capybara.sh swimming'
alias capy-sleepy='$INSTALL_DIR/scripts/show-capybara.sh sleepy'
alias capy-random='$INSTALL_DIR/scripts/show-capybara.sh random'

# Cowsay 水豚指令
alias cowsay-capy='cowsay -f $INSTALL_DIR/cowsay/capybara.cow'
alias cowsay-zen='cowsay -f $INSTALL_DIR/cowsay/capybara-zen.cow'
alias cowsay-happy='cowsay -f $INSTALL_DIR/cowsay/capybara-happy.cow'
alias cowsay-swim='cowsay -f $INSTALL_DIR/cowsay/capybara-swimming.cow'
alias cowsay-sleepy='cowsay -f $INSTALL_DIR/cowsay/capybara-sleepy.cow'

# Figlet 水豚指令
alias figlet-capy='figlet -f $INSTALL_DIR/figlet/capybara.flf'

# JP2A 照片轉換指令
alias capy-photo='$INSTALL_DIR/scripts/show-capybara-photo.sh'
alias capy-gallery='$INSTALL_DIR/scripts/show-capybara-photo.sh gallery'
"

    # 檢查是否已有配置
    if grep -q "Terminal ASCII Art - Capybara Collection" "$SHELL_RC" 2>/dev/null; then
        echo -e "${YELLOW}⚠️  檢測到現有別名配置${NC}"
        read -p "是否要更新別名配置？(y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # 移除舊配置
            sed -i.bak '/# 🦫 Terminal ASCII Art - Capybara Collection 別名/,/^$/d' "$SHELL_RC"
            echo -e "${GREEN}✅ 移除舊配置${NC}"
        else
            echo -e "${YELLOW}⏹️  保留現有別名配置${NC}"
            return 0
        fi
    fi
    
    # 新增配置
    echo "$alias_config" >> "$SHELL_RC"
    echo -e "${GREEN}✅ 別名已新增到 $SHELL_RC${NC}"
}

# 函數：驗證安裝
verify_installation() {
    echo -e "${PURPLE}🔍 驗證安裝...${NC}"
    
    # 檢查檔案是否存在
    local files_to_check=(
        "$INSTALL_DIR/scripts/show-capybara.sh"
        "$INSTALL_DIR/scripts/show-capybara-photo.sh"
        "$INSTALL_DIR/cowsay/capybara.cow"
        "$INSTALL_DIR/figlet/capybara.flf"
        "$INSTALL_DIR/asciiart/capybara-gallery.txt"
    )
    
    for file in "${files_to_check[@]}"; do
        if [[ -f "$file" ]]; then
            echo -e "${GREEN}✅ 檔案存在：$(basename "$file")${NC}"
        else
            echo -e "${RED}❌ 檔案缺失：$(basename "$file")${NC}"
            return 1
        fi
    done
    
    echo -e "${GREEN}✅ 檔案驗證完成${NC}"
}

# 函數：顯示完成訊息
show_completion() {
    echo -e "${CYAN}"
    echo "🎉 =================================="
    echo "   安裝完成！"
    echo "=================================== 🎉"
    echo -e "${NC}"
    
    echo -e "${GREEN}📍 安裝位置：$INSTALL_DIR${NC}"
    echo -e "${GREEN}⚙️  別名配置：$SHELL_RC${NC}"
    echo
    echo -e "${YELLOW}📋 使用方式：${NC}"
    echo "   重新載入 Shell 或執行：source $SHELL_RC"
    echo
    echo -e "${BLUE}🚀 快速開始：${NC}"
    echo "   capy                    # 隨機水豚"
    echo "   capy-zen                # 禪意水豚"
    echo "   cowsay-capy 'Hello!'    # 水豚對話"
    echo "   figlet-capy 'CAPY'      # 水豚字型"
    echo "   capy-gallery            # 照片展示"
    echo
    echo -e "${PURPLE}🔗 更多資訊：${NC}"
    echo "   cat $INSTALL_DIR/README.md"
    echo
    echo -e "${CYAN}讓終端變得更可愛，一次一隻水豚！ 🦫${NC}"
}

# 函數：顯示使用說明
show_usage() {
    echo "使用方式: $0 [選項]"
    echo
    echo "選項:"
    echo "  -h, --help              顯示此說明"
    echo "  --check-deps            僅檢查依賴"
    echo "  --no-aliases            不設定別名"
    echo "  --install-dir DIR       指定安裝目錄 (預設: $HOME/.capybara-ascii)"
    echo
    echo "範例:"
    echo "  $0                      # 完整安裝"
    echo "  $0 --check-deps         # 僅檢查依賴"
    echo "  $0 --no-aliases         # 安裝但不設定別名"
}

# 主函數
main() {
    local check_deps_only=false
    local setup_aliases_flag=true
    
    # 解析參數
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_usage
                exit 0
                ;;
            --check-deps)
                check_deps_only=true
                shift
                ;;
            --no-aliases)
                setup_aliases_flag=false
                shift
                ;;
            --install-dir)
                INSTALL_DIR="$2"
                shift 2
                ;;
            *)
                echo "未知選項: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    # 顯示標題
    show_header
    
    # 檢測系統
    detect_system
    detect_shell
    
    # 檢查依賴
    if ! check_dependencies; then
        exit 1
    fi
    
    # 如果只檢查依賴，則結束
    if [[ "$check_deps_only" == true ]]; then
        echo -e "${GREEN}✅ 依賴檢查完成${NC}"
        exit 0
    fi
    
    # 執行安裝步驟
    create_install_dir
    copy_files
    
    # 設定別名 (可選)
    if [[ "$setup_aliases_flag" == true ]]; then
        setup_aliases
    fi
    
    # 驗證安裝
    verify_installation
    
    # 顯示完成訊息
    show_completion
}

# 執行主函數
main "$@"
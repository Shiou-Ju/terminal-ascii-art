# 📦 安裝指南

完整的 Terminal ASCII Art Capybara Collection 安裝說明。

## 🔧 系統需求

### 作業系統支援
- ✅ macOS 10.15+ (Catalina 或更新版本)
- ✅ Ubuntu 18.04+
- ✅ Debian 10+
- ✅ CentOS 7+
- ✅ Fedora 30+
- ✅ Arch Linux
- ⚠️ Windows (透過 WSL2)

### 必要依賴
- **cowsay** - 對話框產生器
- **figlet** - ASCII 文字藝術
- **jp2a** - 圖片轉 ASCII（可選）
- **bash/zsh** - Shell 環境

### 終端需求
- UTF-8 編碼支援
- 256 色支援（建議）
- 等寬字型
- 最小尺寸：80x24

## 🚀 快速安裝

### 一鍵安裝腳本（推薦）
```bash
# 下載並執行安裝腳本
curl -fsSL https://raw.githubusercontent.com/Shiou-Ju/terminal-ascii-art/main/scripts/install.sh | bash
```

### 手動安裝

#### 步驟 1：安裝依賴

**macOS (使用 Homebrew)：**
```bash
# 安裝 Homebrew（如果尚未安裝）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安裝依賴
brew install cowsay figlet jp2a
```

**Ubuntu/Debian：**
```bash
# 更新套件列表
sudo apt update

# 安裝依賴
sudo apt install -y cowsay figlet jp2a
```

**CentOS/RHEL/Fedora：**
```bash
# 安裝 EPEL repository（CentOS/RHEL）
sudo yum install -y epel-release

# 安裝依賴
sudo yum install -y cowsay figlet
# jp2a 可能需要從源碼編譯
```

**Arch Linux：**
```bash
# 使用 pacman
sudo pacman -S cowsay figlet

# jp2a 從 AUR 安裝
yay -S jp2a
```

#### 步驟 2：下載專案

```bash
# 使用 git clone（推薦）
cd ~
git clone https://github.com/Shiou-Ju/terminal-ascii-art.git

# 或使用 wget 下載壓縮檔
wget https://github.com/Shiou-Ju/terminal-ascii-art/archive/main.zip
unzip main.zip
mv terminal-ascii-art-main terminal-ascii-art
```

#### 步驟 3：設定執行權限

```bash
cd ~/terminal-ascii-art
chmod +x scripts/*.sh
```

#### 步驟 4：驗證安裝

```bash
# 測試基本功能
./scripts/show-capybara.sh help

# 測試 cowsay
cowsay -f ./cowsay/capybara.cow "Installation successful!"

# 測試 Braille 動畫
./scripts/show-braille-animation.sh 25
```

## 🔗 路徑設定

### 方法 1：使用絕對路徑（簡單）
在 `.zshrc` 或 `.bashrc` 中設定別名：
```bash
# 設定 Capybara 家目錄
export CAPYBARA_HOME="$HOME/terminal-ascii-art"

# 基本別名
alias capy="$CAPYBARA_HOME/scripts/show-capybara.sh"
alias capy-braille="$CAPYBARA_HOME/scripts/show-braille-animation.sh"
```

### 方法 2：加入 PATH（進階）
```bash
# 將腳本目錄加入 PATH
export PATH="$PATH:$HOME/terminal-ascii-art/scripts"

# 現在可以直接執行
show-capybara.sh happy
```

### 方法 3：建立符號連結
```bash
# 在系統路徑建立連結
sudo ln -s ~/terminal-ascii-art/scripts/show-capybara.sh /usr/local/bin/capy
sudo ln -s ~/terminal-ascii-art/scripts/show-braille-animation.sh /usr/local/bin/capy-braille
```

## 🎨 Cowsay 整合

### 系統級安裝
```bash
# 複製 cow 檔案到 cowsay 目錄
sudo cp ~/terminal-ascii-art/cowsay/*.cow /usr/share/cowsay/cows/
# 或
sudo cp ~/terminal-ascii-art/cowsay/*.cow /usr/local/share/cows/
```

### 使用者級安裝
```bash
# 建立個人 cowsay 目錄
mkdir -p ~/.cowsay
cp ~/terminal-ascii-art/cowsay/*.cow ~/.cowsay/

# 設定環境變數
export COWPATH="$HOME/.cowsay:$COWPATH"
```

## 🔤 Figlet 字型安裝

### 找到 figlet 字型目錄
```bash
# 通常位於以下位置之一
/usr/share/figlet/
/usr/local/share/figlet/
/usr/share/figlet/fonts/
```

### 安裝字型
```bash
# 複製字型檔案
sudo cp ~/terminal-ascii-art/figlet/capybara.flf /usr/share/figlet/

# 測試
figlet -f capybara "TEST"
```

## 🐚 Shell 整合

### Zsh 設定
編輯 `~/.zshrc`：
```bash
# Capybara ASCII Art 設定
if [ -d "$HOME/terminal-ascii-art" ]; then
    source "$HOME/terminal-ascii-art/scripts/capybara-setup.sh"
fi

# 啟動時顯示
capybara-favorites-fast() {
    local favorites=(3 13 34 25)
    local selected=${favorites[$((RANDOM % 4))]}
    ~/terminal-ascii-art/scripts/show-braille-animation.sh $selected --startup
}
capybara-favorites-fast
```

### Bash 設定
編輯 `~/.bashrc`：
```bash
# Capybara ASCII Art 設定
if [ -d "$HOME/terminal-ascii-art" ]; then
    # Bash 相容性調整
    RANDOM=$(($(date +%s) % 32768))
    
    # 載入設定
    source "$HOME/terminal-ascii-art/scripts/capybara-setup.sh"
fi
```

## 📱 特殊環境設定

### SSH 環境
```bash
# 檢查是否在 SSH 會話中
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # 使用簡單模式避免延遲
    alias capy='~/terminal-ascii-art/scripts/show-capybara.sh small'
fi
```

### Docker 容器
```dockerfile
# Dockerfile 範例
FROM ubuntu:20.04

# 安裝依賴
RUN apt-get update && apt-get install -y \
    cowsay \
    figlet \
    git \
    && rm -rf /var/lib/apt/lists/*

# 複製專案
COPY . /opt/terminal-ascii-art

# 設定環境
ENV PATH="/opt/terminal-ascii-art/scripts:${PATH}"
```

### WSL2 (Windows)
```bash
# 確保正確的換行符號
cd ~/terminal-ascii-art
find . -name "*.sh" -exec dos2unix {} \;

# 設定執行權限
chmod +x scripts/*.sh
```

## 🔍 驗證安裝

執行以下命令確認安裝成功：

```bash
# 1. 檢查依賴
command -v cowsay >/dev/null 2>&1 && echo "✅ cowsay installed" || echo "❌ cowsay missing"
command -v figlet >/dev/null 2>&1 && echo "✅ figlet installed" || echo "❌ figlet missing"
command -v jp2a >/dev/null 2>&1 && echo "✅ jp2a installed" || echo "❌ jp2a missing"

# 2. 測試腳本權限
[ -x ~/terminal-ascii-art/scripts/show-capybara.sh ] && echo "✅ Scripts executable" || echo "❌ Scripts not executable"

# 3. 測試 UTF-8 支援
locale | grep -q "UTF-8" && echo "✅ UTF-8 supported" || echo "❌ UTF-8 not configured"

# 4. 執行測試
~/terminal-ascii-art/scripts/show-capybara.sh small
```

## ❌ 解除安裝

如需移除：

```bash
# 1. 移除專案目錄
rm -rf ~/terminal-ascii-art

# 2. 移除 shell 設定（手動編輯 .zshrc/.bashrc）
# 刪除所有 Capybara 相關設定

# 3. 移除系統連結（如有）
sudo rm -f /usr/local/bin/capy*

# 4. 移除 cowsay 檔案（如有）
sudo rm -f /usr/share/cowsay/cows/capybara*.cow
```

## 🆘 需要協助？

如果遇到問題，請查看：
- [故障排除指南](./troubleshooting.md)
- [GitHub Issues](https://github.com/Shiou-Ju/terminal-ascii-art/issues)

---
*安裝愉快！讓水豚陪伴你的終端時光！* 🦫
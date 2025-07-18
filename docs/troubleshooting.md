# 🔧 故障排除指南

解決 Terminal ASCII Art Capybara Collection 的常見問題。

## 🚨 常見問題

### 顯示問題

#### 問題：顯示亂碼或方框
**症狀：**
```
��������������
������������
```

**解決方案：**
1. 檢查終端編碼：
   ```bash
   locale
   # 應該看到 UTF-8
   ```

2. 設定 UTF-8 編碼：
   ```bash
   # 臨時設定
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   
   # 永久設定（加入 .zshrc/.bashrc）
   echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
   echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
   ```

3. 使用支援 Unicode 的終端：
   - macOS: iTerm2, Terminal.app
   - Linux: GNOME Terminal, Konsole, Terminator
   - Windows: Windows Terminal, WSL2

#### 問題：Braille 圖案顯示不完整
**症狀：**
- 圖案被截斷
- 行錯位

**解決方案：**
1. 調整終端視窗大小：
   ```bash
   # 檢查當前大小
   echo "Columns: $COLUMNS, Rows: $LINES"
   # 建議至少 80x24
   ```

2. 使用等寬字型：
   - 推薦：Monaco, Menlo, Source Code Pro, Fira Code
   - 避免：比例字型

3. 檢查行間距設定：
   - 將行間距設為 1.0 或預設值

### 執行權限問題

#### 問題：Permission denied
**症狀：**
```bash
$ ./scripts/show-capybara.sh
-bash: ./scripts/show-capybara.sh: Permission denied
```

**解決方案：**
```bash
# 設定執行權限
chmod +x scripts/*.sh

# 確認權限
ls -la scripts/
```

#### 問題：Command not found
**症狀：**
```bash
$ show-capybara.sh
command not found: show-capybara.sh
```

**解決方案：**
1. 使用完整路徑：
   ```bash
   ~/terminal-ascii-art/scripts/show-capybara.sh
   ```

2. 或設定 PATH：
   ```bash
   export PATH="$PATH:$HOME/terminal-ascii-art/scripts"
   ```

### 依賴問題

#### 問題：cowsay: command not found
**解決方案：**

macOS:
```bash
# 安裝 Homebrew（如未安裝）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 安裝 cowsay
brew install cowsay
```

Ubuntu/Debian:
```bash
sudo apt update
sudo apt install cowsay
```

CentOS/RHEL:
```bash
sudo yum install epel-release
sudo yum install cowsay
```

#### 問題：figlet 字型找不到
**症狀：**
```bash
$ figlet -f capybara "TEST"
figlet: capybara: Unable to open font file
```

**解決方案：**
1. 找到 figlet 字型目錄：
   ```bash
   figlet -I2
   # 或
   find /usr -name "*.flf" -type f 2>/dev/null | head -5
   ```

2. 複製字型到正確位置：
   ```bash
   sudo cp ~/terminal-ascii-art/figlet/capybara.flf $(figlet -I2)
   ```

### 顏色顯示問題

#### 問題：顏色無法正常顯示
**症狀：**
- 看到顏色代碼如 `\033[0;32m`
- 全部顯示為單色

**解決方案：**
1. 檢查終端支援：
   ```bash
   echo $TERM
   # 應該包含 color 或 256color
   ```

2. 設定終端類型：
   ```bash
   export TERM=xterm-256color
   ```

3. 測試顏色支援：
   ```bash
   # 測試腳本
   for i in {0..255}; do
       printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
   done
   ```

### Shell 整合問題

#### 問題：.zshrc 設定後沒有顯示
**解決方案：**
1. 重新載入設定：
   ```bash
   source ~/.zshrc
   ```

2. 檢查路徑：
   ```bash
   # 確認專案路徑正確
   ls -la ~/terminal-ascii-art/
   ```

3. 除錯模式：
   ```bash
   # 在 .zshrc 中加入除錯
   echo "Loading Capybara settings..."
   if [ -d "$HOME/terminal-ascii-art" ]; then
       echo "Capybara directory found"
       # ... 其他設定
   else
       echo "Capybara directory NOT found at $HOME/terminal-ascii-art"
   fi
   ```

#### 問題：啟動很慢
**解決方案：**
1. 使用快速模式：
   ```bash
   # 修改 .zshrc 中的函數
   capybara-favorites-fast() {
       # 使用 --startup 模式
       ~/terminal-ascii-art/scripts/show-braille-animation.sh 25 --startup
   }
   ```

2. 條件載入：
   ```bash
   # 只在非 SSH 環境載入
   if [ -z "$SSH_CLIENT" ]; then
       capybara-favorites-fast
   fi
   ```

### 特定系統問題

#### macOS 特定問題

**問題：Homebrew 找不到套件**
```bash
# 更新 Homebrew
brew update
brew upgrade

# 如果還是找不到
brew search cowsay
```

**問題：macOS Catalina+ 安全性警告**
```bash
# 如果腳本被阻擋
xattr -d com.apple.quarantine scripts/*.sh
```

#### Linux 特定問題

**問題：沒有 cowsay 目錄**
```bash
# 手動建立
sudo mkdir -p /usr/share/cowsay/cows
sudo cp ~/terminal-ascii-art/cowsay/*.cow /usr/share/cowsay/cows/
```

**問題：jp2a 編譯失敗**
```bash
# 安裝編譯依賴
sudo apt install build-essential libjpeg-dev

# 從源碼編譯
git clone https://github.com/Talinx/jp2a.git
cd jp2a
autoreconf -vi
./configure
make
sudo make install
```

#### WSL2 特定問題

**問題：換行符號問題**
```bash
# 安裝 dos2unix
sudo apt install dos2unix

# 轉換所有腳本
find ~/terminal-ascii-art -name "*.sh" -exec dos2unix {} \;
```

**問題：Windows 路徑問題**
```bash
# 使用 WSL 路徑而非 Windows 路徑
# ❌ 錯誤：/mnt/c/Users/...
# ✅ 正確：~/terminal-ascii-art/...
```

## 🔍 進階除錯

### 啟用除錯模式

在腳本開頭加入：
```bash
#!/bin/bash
set -x  # 顯示執行的每個命令
set -e  # 遇到錯誤立即停止
```

### 檢查環境變數
```bash
# 建立除錯腳本
cat > debug-capybara.sh << 'EOF'
#!/bin/bash
echo "=== Capybara Debug Info ==="
echo "Shell: $SHELL"
echo "Term: $TERM"
echo "Lang: $LANG"
echo "Path to project: ~/terminal-ascii-art"
echo "Checking files..."
ls -la ~/terminal-ascii-art/scripts/ | head -5
echo "Checking permissions..."
stat ~/terminal-ascii-art/scripts/show-capybara.sh
echo "Testing basic display..."
~/terminal-ascii-art/scripts/show-capybara.sh small
EOF

chmod +x debug-capybara.sh
./debug-capybara.sh
```

### 記錄檔分析
```bash
# 建立記錄
~/terminal-ascii-art/scripts/show-capybara.sh zen 2>&1 | tee capybara.log

# 分析錯誤
grep -i error capybara.log
```

## 📊 效能分析

### 測量執行時間
```bash
time ~/terminal-ascii-art/scripts/show-capybara.sh zen
```

### 找出瓶頸
```bash
# 使用 bash -x 追蹤
bash -x ~/terminal-ascii-art/scripts/show-braille-animation.sh 1
```

## 🆘 取得協助

如果以上方案都無法解決問題：

1. **收集資訊：**
   ```bash
   # 系統資訊
   uname -a
   echo $SHELL
   echo $TERM
   locale
   
   # 版本資訊
   cowsay -h | head -1
   figlet -v
   jp2a --version
   ```

2. **建立 Issue：**
   - 前往 [GitHub Issues](https://github.com/Shiou-Ju/terminal-ascii-art/issues)
   - 提供詳細錯誤訊息
   - 附上系統資訊
   - 說明重現步驟

3. **社群支援：**
   - 查看現有 Issues
   - 參與討論
   - 分享解決方案

## 💡 預防措施

### 最佳實踐
1. 定期更新專案：
   ```bash
   cd ~/terminal-ascii-art
   git pull origin main
   ```

2. 備份個人設定：
   ```bash
   cp ~/.zshrc ~/.zshrc.backup
   ```

3. 測試新功能：
   ```bash
   # 在臨時 shell 測試
   zsh -f  # 不載入設定檔
   source ~/terminal-ascii-art/scripts/test-setup.sh
   ```

---
*遇到問題不要氣餒，水豚會陪你一起解決！* 🦫
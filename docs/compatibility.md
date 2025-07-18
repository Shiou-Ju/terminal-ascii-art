# 🖥️ 相容性說明

Terminal ASCII Art Capybara Collection 的相容性資訊和支援狀況。

## 🐧 作業系統支援

### 完整支援 ✅

| 作業系統 | 版本 | 測試狀態 | 備註 |
|---------|------|---------|------|
| macOS | 10.15+ (Catalina) | ✅ 已測試 | 原生支援所有功能 |
| Ubuntu | 18.04 LTS+ | ✅ 已測試 | 完整支援 |
| Debian | 10 (Buster)+ | ✅ 已測試 | 完整支援 |
| Fedora | 30+ | ✅ 已測試 | 完整支援 |
| Arch Linux | Rolling | ✅ 已測試 | AUR 支援 |

### 部分支援 ⚠️

| 作業系統 | 版本 | 測試狀態 | 限制 |
|---------|------|---------|------|
| CentOS | 7+ | ⚠️ 部分測試 | jp2a 需手動編譯 |
| RHEL | 7+ | ⚠️ 部分測試 | 需要 EPEL |
| openSUSE | Leap 15+ | ⚠️ 基本測試 | 部分套件需手動安裝 |
| Windows | 10/11 (WSL2) | ⚠️ 已測試 | 需透過 WSL2 |

### 實驗性支援 🧪

| 作業系統 | 版本 | 測試狀態 | 備註 |
|---------|------|---------|------|
| FreeBSD | 12+ | 🧪 未測試 | 理論上可行 |
| Alpine Linux | 3.12+ | 🧪 基本測試 | 輕量環境 |
| Termux (Android) | Latest | 🧪 部分測試 | 基本功能可用 |

## 🖥️ 終端模擬器相容性

### 優秀支援 ⭐

**macOS:**
- iTerm2 3.0+ ⭐⭐⭐⭐⭐
  - 完整 Unicode 支援
  - 優秀的字型渲染
  - 256 色和真彩色
  
- Terminal.app ⭐⭐⭐⭐
  - macOS 內建
  - 良好的 Unicode 支援
  - 基本功能完整

**Linux:**
- GNOME Terminal ⭐⭐⭐⭐⭐
  - 優秀的 Unicode 支援
  - 完整顏色支援
  
- Konsole (KDE) ⭐⭐⭐⭐⭐
  - 豐富的自訂選項
  - 優秀的效能
  
- Terminator ⭐⭐⭐⭐
  - 分割視窗功能
  - 良好的相容性

**跨平台:**
- Alacritty ⭐⭐⭐⭐⭐
  - GPU 加速
  - 極佳效能
  
- Kitty ⭐⭐⭐⭐⭐
  - 現代化終端
  - 完整功能支援

### 基本支援 ✓

- xterm ✓
  - 需要正確設定
  - 可能需要字型調整
  
- rxvt-unicode ✓
  - 需要 Unicode 設定
  - 基本功能可用

### 已知問題 ⚠️

- Windows CMD ❌
  - 不支援 ANSI 顏色
  - Unicode 顯示問題
  
- PowerShell (舊版) ⚠️
  - 有限的 Unicode 支援
  - 需要額外設定

## 🔤 字型相容性

### 推薦字型 ⭐

| 字型名稱 | 平台 | Braille 支援 | 備註 |
|---------|------|-------------|------|
| SF Mono | macOS | ⭐⭐⭐⭐⭐ | Apple 官方 |
| Monaco | macOS | ⭐⭐⭐⭐ | 經典選擇 |
| Menlo | macOS | ⭐⭐⭐⭐⭐ | 優秀支援 |
| Source Code Pro | 全平台 | ⭐⭐⭐⭐⭐ | Adobe 開源 |
| Fira Code | 全平台 | ⭐⭐⭐⭐⭐ | 連字支援 |
| JetBrains Mono | 全平台 | ⭐⭐⭐⭐⭐ | 優秀設計 |
| Cascadia Code | 全平台 | ⭐⭐⭐⭐ | Microsoft |
| Ubuntu Mono | Linux | ⭐⭐⭐⭐ | Ubuntu 預設 |

### 字型設定建議

```bash
# 檢查當前字型支援
fc-list :mono | grep -i "mono"

# 測試 Braille 顯示
echo "⠀⠁⠂⠃⠄⠅⠆⠇⠈⠉⠊⠋⠌⠍⠎⠏"

# 測試 Unicode 方框繪圖
echo "┌─┬─┐"
echo "│ │ │"
echo "├─┼─┤"
echo "└─┴─┘"
```

## 🌐 編碼支援

### UTF-8 需求

必須支援 UTF-8 編碼：

```bash
# 檢查系統編碼
locale | grep UTF-8

# 設定 UTF-8（如需要）
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
```

### 語言環境測試

```bash
# 測試多語言支援
echo "English: Capybara"
echo "中文：水豚"
echo "日本語：カピバラ"
echo "Español: Capibara"
echo "Emoji: 🦫"
```

## 🎨 顏色支援

### 檢查顏色能力

```bash
# 檢查終端顏色支援
tput colors

# 應該回傳：
# 8   = 基本顏色
# 256 = 256 色（推薦）
# 16777216 = 真彩色
```

### 顏色模式設定

```bash
# 8 色模式（基本）
export TERM=xterm

# 256 色模式（推薦）
export TERM=xterm-256color

# 真彩色模式
export TERM=xterm-direct
```

## 📱 特殊環境

### SSH 連線

```bash
# SSH 設定建議
# 在 ~/.ssh/config 加入
Host *
    SendEnv LANG LC_*
    ForwardX11 no
```

### Docker 容器

```dockerfile
# Dockerfile 相容性設定
FROM ubuntu:20.04

# 設定語言環境
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# 安裝必要套件
RUN apt-get update && apt-get install -y \
    locales \
    cowsay \
    figlet \
    && locale-gen en_US.UTF-8
```

### 雲端 IDE

| 平台 | 支援度 | 備註 |
|------|--------|------|
| GitHub Codespaces | ✅ | 完整支援 |
| Gitpod | ✅ | 完整支援 |
| Cloud9 | ⚠️ | 基本支援 |
| Replit | ⚠️ | 需要調整 |

## 🐚 Shell 相容性

### 完整支援

- **Zsh** 5.0+ ⭐⭐⭐⭐⭐
  - 所有功能完整支援
  - 建議使用版本
  
- **Bash** 4.0+ ⭐⭐⭐⭐
  - 大部分功能支援
  - 部分語法需調整

### 基本支援

- **Fish** 3.0+ ⚠️
  - 語法差異較大
  - 需要改寫部分腳本
  
- **Dash** ⚠️
  - POSIX 相容
  - 功能受限

## 📋 功能相容性矩陣

| 功能 | macOS | Ubuntu | Windows (WSL2) | 最低需求 |
|------|-------|--------|----------------|----------|
| ASCII Art | ✅ | ✅ | ✅ | 基本終端 |
| Cowsay | ✅ | ✅ | ✅ | cowsay 套件 |
| Figlet | ✅ | ✅ | ✅ | figlet 套件 |
| Braille Art | ✅ | ✅ | ⚠️ | UTF-8 + 字型 |
| 256 色 | ✅ | ✅ | ⚠️ | 256color 終端 |
| jp2a | ✅ | ✅ | ⚠️ | jp2a + libjpeg |
| 動畫 | ✅ | ✅ | ✅ | Bash 4.0+ |

## 🔧 相容性檢查腳本

```bash
#!/bin/bash
# compatibility-check.sh

echo "🔍 Capybara ASCII Art Compatibility Check"
echo "========================================"

# OS 檢查
echo -n "OS: "
uname -s

# Shell 檢查
echo -n "Shell: "
echo $SHELL

# 終端檢查
echo -n "Terminal: "
echo $TERM

# UTF-8 檢查
echo -n "UTF-8: "
locale | grep -q UTF-8 && echo "✅" || echo "❌"

# 顏色檢查
echo -n "Colors: "
tput colors

# 依賴檢查
echo ""
echo "Dependencies:"
for cmd in cowsay figlet jp2a; do
    echo -n "  $cmd: "
    command -v $cmd >/dev/null 2>&1 && echo "✅" || echo "❌"
done

# Unicode 測試
echo ""
echo "Unicode Test:"
echo "  Braille: ⠿⠿⠿"
echo "  Emoji: 🦫"
echo "  Box: ┌─┐"

echo ""
echo "========================================"
```

## 📚 相關資源

- [終端模擬器比較](https://github.com/topics/terminal-emulators)
- [字型支援測試](https://www.unicode.org/charts/PDF/U2800.pdf)
- [ANSI 顏色代碼](https://en.wikipedia.org/wiki/ANSI_escape_code)

---
*確保相容性，讓每個人都能享受水豚的陪伴！* 🦫
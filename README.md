# 🦫 Terminal ASCII Art - Capybara Collection

一個可愛的終端 ASCII art 工具集合，專為 capybara 愛好者設計！為三種經典終端工具（cowsay、figlet、asciiart）提供水豚主題的 ASCII 圖案。

## 🎯 專案概述

本專案提供：
- **cowsay** - 可愛的水豚對話框，支援多種表情 ✅ **已完成**
- **figlet** - 水豚風格的文字字型 ✅ **已完成**
- **asciiart** - 豐富的水豚圖案庫和場景 ✅ **已完成**
- **jp2a** - 照片轉 ASCII 工具 ✅ **已完成**

## 📸 圖片授權聲明

**本專案使用的所有水豚照片均來自 Pixabay，為免費開放授權圖片。**
- 所有照片都可以自由使用、修改和分享
- 無需署名（但我們感謝 Pixabay 的貢獻者們！）
- 可用於個人和商業用途

## 🚀 快速開始

### 安裝依賴
```bash
# macOS
brew install cowsay figlet jp2a

# Ubuntu/Debian
sudo apt-get install cowsay figlet jp2a

# 或使用專案提供的安裝腳本
./scripts/install-dependencies.sh
```

### 使用方式
```bash
# 🦫 asciiart 水豚圖案 (立即可用)
./scripts/show-capybara.sh zen

# 🐄 cowsay 水豚對話 (立即可用)
cowsay -f ./cowsay/capybara.cow "Hello! I'm a chill capybara 🌿"

# 🔤 figlet 水豚字型 (立即可用)
figlet -f ./figlet/capybara.flf "CAPY"

# 📸 jp2a 照片轉 ASCII (立即可用)
./scripts/show-capybara-photo.sh gallery

# ⠿ Braille 點字藝術動畫 (立即可用)
./scripts/show-braille-animation.sh      # 顯示全部 41 個圖案
./scripts/show-braille-animation.sh 25   # 顯示特定編號
```

## 📁 專案結構

```
terminal-ascii-art/
├── README.md           # 專案說明
├── CLAUDE.md          # 開發指引
├── cowsay/            # cowsay 相關檔案 ✅
│   ├── capybara.cow           # 基本風格
│   ├── capybara-zen.cow       # 禪意冥想
│   ├── capybara-happy.cow     # 開心表情
│   ├── capybara-swimming.cow  # 游泳風格
│   └── capybara-sleepy.cow    # 愛睏表情
├── asciiart/          # ASCII art 圖案庫 ✅
│   ├── capybara-gallery.txt        # 10種風格圖案
│   ├── capybara-braille-complete.txt # 41個 Braille 圖案
│   ├── capybara-scenes.txt         # 場景圖案
│   ├── capybara-animations.txt     # 動畫幀
│   └── credits.txt                 # 版權資訊
├── scripts/           # 工具腳本 ✅
│   ├── show-capybara.sh            # 主要圖案顯示腳本
│   ├── show-braille-animation.sh   # Braille 動畫腳本
│   ├── show-capybara-photo.sh      # 照片轉 ASCII 腳本
│   └── convert-photo.sh            # jp2a 轉換工具
├── figlet/            # figlet 字型檔案 ✅
│   └── capybara.flf           # 水豚字型
├── photos/            # 照片素材 ✅
│   └── originals/             # Pixabay 免費照片
└── examples/          # 使用範例 🔄
    └── (待完成)
```

## 🎨 可用的水豚風格

### ASCII Art 風格
- **relaxed** - 悠閒放鬆的水豚 `●   ●`
- **zen** - 禪意冥想的水豚 `-   -`
- **swimming** - 游泳中的水豚 `~ ~ ~`
- **happy** - 開心的水豚 `^   ^` ✨
- **sleepy** - 愛睏的水豚 `˘   ˘` 💤
- **small** - 小型基本水豚（緊湊版）

### 🎯 Braille 點字藝術 (41 個高解析度圖案)
```bash
# 顯示所有 Braille 圖案動畫
./scripts/show-braille-animation.sh

# 顯示特定編號的圖案
./scripts/show-braille-animation.sh 3
./scripts/show-braille-animation.sh 13
./scripts/show-braille-animation.sh 34
./scripts/show-braille-animation.sh 25

# 我的最愛 ❤️
./scripts/show-braille-animation.sh 3    # 極簡風格
./scripts/show-braille-animation.sh 13   # 優雅側臉
./scripts/show-braille-animation.sh 34   # 完整細節
./scripts/show-braille-animation.sh 25   # 可愛正面

# 進階選項
./scripts/show-braille-animation.sh 25 --fast      # 快速顯示（無延遲）
./scripts/show-braille-animation.sh 3 --no-clear   # 不清除螢幕
./scripts/show-braille-animation.sh 13 --quiet     # 靜音模式（不顯示標題）
./scripts/show-braille-animation.sh 34 --startup   # 啟動模式（結合所有靜音選項）
```

### 🎭 場景圖案
```bash
# 顯示可用場景
./scripts/show-capybara.sh scene

# 顯示特定場景
./scripts/show-capybara.sh scene-onsen      # 溫泉場景
./scripts/show-capybara.sh scene-river      # 河邊晨景
./scripts/show-capybara.sh scene-picnic     # 草地野餐
./scripts/show-capybara.sh scene-family     # 親子互動
./scripts/show-capybara.sh scene-sunset     # 夕陽沉思
./scripts/show-capybara.sh scene-rain       # 雨天耐心
```

### 🎬 動畫效果
```bash
# 播放所有動畫
./scripts/show-capybara.sh animate

# 播放特定動畫
./scripts/show-capybara.sh animate-blink    # 眨眼動畫
./scripts/show-capybara.sh animate-chew     # 咀嚼動畫
./scripts/show-capybara.sh animate-swim     # 游泳動畫
./scripts/show-capybara.sh animate-nod      # 點頭動畫
./scripts/show-capybara.sh animate-ear      # 耳朵抽動
```

### 📸 jp2a 照片轉 ASCII
```bash
# 顯示照片圖庫
./scripts/show-capybara-photo.sh gallery

# 顯示特定照片
./scripts/show-capybara-photo.sh 1    # 水豚特寫
./scripts/show-capybara-photo.sh 2    # 游泳水豚
./scripts/show-capybara-photo.sh 3    # 水豚家族

# 轉換自訂照片
./scripts/convert-photo.sh ~/Pictures/my-capybara.jpg

# jp2a 進階選項
./scripts/convert-photo.sh ~/Pictures/my-capybara.jpg --width=80 --color
```

## 🔧 設定別名

在你的 `.zshrc` 或 `.bashrc` 中加入：

```bash
# 🦫 asciiart 水豚指令
alias capy='~/terminal-ascii-art/scripts/show-capybara.sh'
alias capy-zen='~/terminal-ascii-art/scripts/show-capybara.sh zen'
alias capy-happy='~/terminal-ascii-art/scripts/show-capybara.sh happy'
alias capy-swim='~/terminal-ascii-art/scripts/show-capybara.sh swimming'
alias capy-sleepy='~/terminal-ascii-art/scripts/show-capybara.sh sleepy'

# 🐄 cowsay 水豚指令
alias cowsay-capy='cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow'
alias cowsay-zen='cowsay -f ~/terminal-ascii-art/cowsay/capybara-zen.cow'
alias cowsay-happy='cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow'
alias cowsay-swim='cowsay -f ~/terminal-ascii-art/cowsay/capybara-swimming.cow'
alias cowsay-sleepy='cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow'

# ⠿ Braille 動畫快速指令
alias capy-braille='~/terminal-ascii-art/scripts/show-braille-animation.sh'
alias capy-favorites='~/terminal-ascii-art/scripts/show-braille-animation.sh 3 13 34 25'

# 🌅 終端啟動顯示（加入 .zshrc 末尾）
capybara-favorites-fast() {
    local favorites=(3 13 34 25)
    local random_index=$((RANDOM % ${#favorites[@]}))
    local selected=${favorites[$random_index]}
    ~/terminal-ascii-art/scripts/show-braille-animation.sh $selected --startup
}
# 自動執行
capybara-favorites-fast
```

## 📸 使用範例

### 🦫 ASCII Art 範例
```bash
$ ./scripts/show-capybara.sh zen
🦫 Capybara (zen):

    ∩     ∩
   _______________
  /   -       -   \
 |     ( ● ● )     |
 |      \___/      |
  \_______________/
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

Let terminal be more cute, one capybara at a time! 🦫
```

### 🐄 Cowsay 範例
```bash
$ cowsay -f cowsay/capybara.cow "Time to relax!"
 ________________
< Time to relax! >
 ----------------
        \
         \
          \
            ∩     ∩
           _______________
          /   oo       oo   \
         |     ( ● ● )     |
         |      \___/      |
          \_______________/
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...
```

### 🔤 Figlet 範例
```bash
$ figlet -f figlet/capybara.flf "CAPY"
  ____     _     ____   __   __
 / ___|   / \   |  _ \  \ \ / /
| |      / _ \  | |_) |  \ V / 
| |___  / ___ \ |  __/    | |  
 \____|/_/   \_\|_|       |_|  
```

## 🛠️ 開發與貢獻

查看 [CLAUDE.md](./CLAUDE.md) 了解開發指引和貢獻方式。

## 🚨 故障排除

### 常見問題

**Q: 顯示亂碼或方框？**
- 確保終端支援 UTF-8 編碼：`locale | grep UTF-8`
- 使用支援 Unicode 的終端（iTerm2、Terminal.app、GNOME Terminal）

**Q: 找不到 cowsay/figlet 指令？**
```bash
# macOS
brew install cowsay figlet jp2a

# Ubuntu/Debian
sudo apt-get install cowsay figlet jp2a
```

**Q: 腳本執行權限錯誤？**
```bash
chmod +x scripts/*.sh
```

**Q: Braille 圖案顯示不完整？**
- 調整終端視窗大小（建議至少 80x24）
- 使用等寬字型（如 Monaco、Menlo、Source Code Pro）

**Q: 顏色無法正常顯示？**
- 確認終端支援 256 色：`echo $TERM`
- 設定環境變數：`export TERM=xterm-256color`

## 📄 授權

MIT License - 自由使用和修改

## 🙏 致謝

- 感謝所有水豚愛好者和 ASCII art 社群的貢獻！
- Braille 圖案來源：[emojicombos.com](https://emojicombos.com/capybara-ascii-art)
- 照片來源：Pixabay 免費圖庫

---

*讓終端變得更可愛，一次一隻水豚！* 🦫
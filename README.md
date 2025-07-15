# 🦫 Terminal ASCII Art - Capybara Collection

一個可愛的終端 ASCII art 工具集合，專為 capybara 愛好者設計！為三種經典終端工具（cowsay、figlet、asciiart）提供水豚主題的 ASCII 圖案。

## 🎯 專案概述

本專案提供：
- **cowsay** - 可愛的水豚對話框，支援多種表情 ✅ **已完成**
- **figlet** - 水豚風格的文字字型 🔄 **開發中**
- **asciiart** - 豐富的水豚圖案庫和場景 ✅ **已完成**

## 🚀 快速開始

### 安裝依賴
```bash
# macOS
brew install cowsay figlet

# Ubuntu/Debian
sudo apt-get install cowsay figlet

# 或使用專案提供的安裝腳本
./scripts/install-dependencies.sh
```

### 使用方式
```bash
# 🦫 asciiart 水豚圖案 (立即可用)
./scripts/show-capybara.sh zen

# 🐄 cowsay 水豚對話 (立即可用)
cowsay -f ./cowsay/capybara.cow "Hello! I'm a chill capybara 🌿"

# 🔤 figlet 水豚字型 (開發中)
figlet -f ./figlet/capybara.flf "CAPY"
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
│   └── capybara-gallery.txt   # 6種風格圖案
├── scripts/           # 工具腳本 ✅
│   └── show-capybara.sh       # 圖案顯示腳本
├── figlet/            # figlet 字型檔案 🔄
│   └── (開發中)
└── examples/          # 使用範例 🔄
    └── (待完成)
```

## 🎨 可用的水豚風格

- **relaxed** - 悠閒放鬆的水豚 `●   ●`
- **zen** - 禪意冥想的水豚 `-   -`
- **swimming** - 游泳中的水豚 `~ ~ ~`
- **happy** - 開心的水豚 `^   ^` ✨
- **sleepy** - 愛睏的水豚 `˘   ˘` 💤
- **small** - 小型基本水豚（緊湊版）

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

### 🔤 Figlet 範例（開發中）
```bash
$ figlet -f figlet/capybara.flf "CAPY"
# 即將推出...
```

## 🛠️ 開發與貢獻

查看 [CLAUDE.md](./CLAUDE.md) 了解開發指引和貢獻方式。

## 📄 授權

MIT License - 自由使用和修改

## 🙏 致謝

感謝所有水豚愛好者和 ASCII art 社群的貢獻！

---

*讓終端變得更可愛，一次一隻水豚！* 🦫
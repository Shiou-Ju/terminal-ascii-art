# 🦫 Terminal ASCII Art - Capybara Collection

一個可愛的終端 ASCII art 工具集合，專為 capybara 愛好者設計！為三種經典終端工具（cowsay、figlet、asciiart）提供水豚主題的 ASCII 圖案。

## 🎯 專案概述

本專案提供：
- **cowsay** - 可愛的水豚對話框，支援多種表情
- **figlet** - 水豚風格的文字字型 
- **asciiart** - 豐富的水豚圖案庫和場景

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
# cowsay 水豚對話
cowsay -f ./cowsay/capybara.cow "Hello! I'm a chill capybara 🌿"

# figlet 水豚字型
figlet -f ./figlet/capybara.flf "CAPY"

# asciiart 水豚圖案
./scripts/show-capybara.sh zen
```

## 📁 專案結構

```
terminal-ascii-art/
├── README.md           # 專案說明
├── CLAUDE.md          # 開發指引
├── .claude/           # Claude 設定檔案
├── cowsay/            # cowsay 相關檔案
│   ├── capybara.cow
│   ├── capybara-zen.cow
│   └── capybara-swimming.cow
├── figlet/            # figlet 字型檔案
│   ├── capybara.flf
│   └── capybara-small.flf
├── asciiart/          # ASCII art 圖案庫
│   ├── capybara-gallery.txt
│   ├── capybara-scenes.txt
│   └── capybara-animations.txt
├── scripts/           # 工具腳本
│   ├── install-dependencies.sh
│   ├── setup-aliases.sh
│   └── show-capybara.sh
└── examples/          # 使用範例
    └── usage-examples.md
```

## 🎨 可用的水豚風格

- **relaxed** - 悠閒放鬆的水豚
- **zen** - 禪意冥想的水豚
- **swimming** - 游泳中的水豚
- **happy** - 開心的水豚
- **sleepy** - 愛睏的水豚

## 🔧 設定別名

在你的 `.zshrc` 或 `.bashrc` 中加入：

```bash
# 基本水豚指令
alias capybara='cowsay -f ~/.local/share/cows/capybara.cow'
alias capy='cowsay -f ~/.local/share/cows/capybara.cow "Just chillin..."'

# 不同風格的水豚
alias capy-zen='cowsay -f ~/.local/share/cows/capybara-zen.cow'
alias capy-swim='cowsay -f ~/.local/share/cows/capybara-swimming.cow'

# 隨機水豚訊息
alias random-capy='./scripts/random-capybara.sh'
```

## 📸 使用範例

### Cowsay 範例
```bash
$ capybara "Time to relax!"
 ________________
< Time to relax! >
 ----------------
    \   ∩─────∩
     \  (  ◉   ◉  )
      \ /           \
       (  ~~~~~~~~~~~  )
        \             /
         \___________/
```

### Figlet 範例
```bash
$ figlet -f capybara.flf "CAPY"
 ██████   █████  ██████  ██    ██ 
██       ██   ██ ██   ██  ██  ██  
██       ███████ ██████    ████   
██       ██   ██ ██         ██    
 ██████  ██   ██ ██         ██    
```

## 🛠️ 開發與貢獻

查看 [CLAUDE.md](./CLAUDE.md) 了解開發指引和貢獻方式。

## 📄 授權

MIT License - 自由使用和修改

## 🙏 致謝

感謝所有水豚愛好者和 ASCII art 社群的貢獻！

---

*讓終端變得更可愛，一次一隻水豚！* 🦫
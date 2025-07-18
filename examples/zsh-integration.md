# 🐚 Zsh 整合指南

完整的 zsh 設定指南，讓水豚陪伴你的每個終端會話！

## 🌅 終端啟動顯示

### 基本設定

在 `~/.zshrc` 末尾加入：
```bash
# 簡單隨機顯示
~/terminal-ascii-art/scripts/show-capybara.sh random
```

### 進階設定（推薦）

```bash
# Braille 動畫最愛集合
capybara-favorites-fast() {
    # 你的最愛水豚編號
    local favorites=(3 13 34 25)
    local random_index=$((RANDOM % ${#favorites[@]}))
    local selected=${favorites[$random_index]}
    
    # 使用啟動模式（快速、靜音、不清屏）
    ~/terminal-ascii-art/scripts/show-braille-animation.sh $selected --startup
}

# 自動執行
capybara-favorites-fast
```

### 根據時間顯示不同風格

```bash
# 時間感知水豚
capybara-time-aware() {
    local hour=$(date +%H)
    
    if [ $hour -lt 6 ]; then
        # 凌晨：睡覺
        ~/terminal-ascii-art/scripts/show-capybara.sh sleepy
    elif [ $hour -lt 12 ]; then
        # 早上：游泳
        ~/terminal-ascii-art/scripts/show-capybara.sh swimming
    elif [ $hour -lt 18 ]; then
        # 下午：放鬆
        ~/terminal-ascii-art/scripts/show-capybara.sh relaxed
    else
        # 晚上：禪意
        ~/terminal-ascii-art/scripts/show-capybara.sh zen
    fi
}

# 啟動時執行
capybara-time-aware
```

## 🎨 自訂提示符

### 簡單水豚提示符

```bash
# 在提示符前顯示小水豚
PROMPT='🦫 %~ %# '
```

### 動態水豚提示符

```bash
# 根據上個指令結果顯示不同表情
capybara_prompt() {
    if [ $? -eq 0 ]; then
        echo "😊🦫"  # 成功：開心水豚
    else
        echo "😴🦫"  # 失敗：睡覺水豚
    fi
}

# 整合到提示符
setopt PROMPT_SUBST
PROMPT='$(capybara_prompt) %~ %# '
```

## 🚀 實用別名

### 基本別名設定

```bash
# 快速顯示水豚
alias capy='~/terminal-ascii-art/scripts/show-capybara.sh'
alias capy-random='capy random'
alias capy-help='capy help'

# 各種風格
alias capy-zen='capy zen'
alias capy-happy='capy happy'
alias capy-swim='capy swimming'
alias capy-sleep='capy sleepy'
alias capy-relax='capy relaxed'

# Braille 動畫
alias capy-braille='~/terminal-ascii-art/scripts/show-braille-animation.sh'
alias capy-fav='capy-braille 3 13 34 25'  # 顯示最愛

# Cowsay 快捷
alias cs-capy='cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow'
alias cs-zen='cowsay -f ~/terminal-ascii-art/cowsay/capybara-zen.cow'
alias cs-happy='cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow'
```

### 進階別名功能

```bash
# 帶訊息的水豚
capy-say() {
    echo "$@" | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
}

# 顯示當前目錄資訊
capy-pwd() {
    pwd | cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
}

# 顯示 git 狀態
capy-git() {
    git status --short | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
}
```

## 🎯 自動觸發功能

### 目錄切換提示

```bash
# 進入特定目錄時顯示水豚
capybara_cd() {
    builtin cd "$@"
    
    # 進入專案目錄時顯示開心水豚
    if [[ $PWD == *"/projects"* ]]; then
        ~/terminal-ascii-art/scripts/show-capybara.sh happy
    fi
    
    # 進入 Downloads 時提醒整理
    if [[ $PWD == *"/Downloads"* ]]; then
        echo "Time to organize downloads!" | \
        cowsay -f ~/terminal-ascii-art/cowsay/capybara-zen.cow
    fi
}
alias cd='capybara_cd'
```

### 長指令完成通知

```bash
# 執行時間超過 10 秒的指令完成後顯示水豚
capybara_preexec() {
    timer=$(($(date +%s)))
}

capybara_precmd() {
    if [ $timer ]; then
        now=$(($(date +%s)))
        elapsed=$((now-timer))
        
        if [ $elapsed -gt 10 ]; then
            ~/terminal-ascii-art/scripts/show-capybara.sh happy
            echo "Task completed in ${elapsed}s! 🎉"
        fi
        
        unset timer
    fi
}

# 註冊 hooks
preexec_functions+=(capybara_preexec)
precmd_functions+=(capybara_precmd)
```

## 🌈 主題整合

### Oh My Zsh 整合

如果使用 Oh My Zsh，在 `~/.zshrc` 中：
```bash
# 在 Oh My Zsh 載入後加入
source $ZSH/oh-my-zsh.sh

# 水豚功能
source ~/terminal-ascii-art/scripts/capybara-zsh-plugin.sh
```

創建 `~/terminal-ascii-art/scripts/capybara-zsh-plugin.sh`：
```bash
#!/bin/zsh
# Capybara ASCII Art Plugin for Oh My Zsh

# 所有水豚相關功能
capybara-favorites-fast() {
    local favorites=(3 13 34 25)
    local selected=${favorites[$((RANDOM % 4))]}
    ~/terminal-ascii-art/scripts/show-braille-animation.sh $selected --startup
}

# 別名
alias capy='~/terminal-ascii-art/scripts/show-capybara.sh'
alias capy-braille='~/terminal-ascii-art/scripts/show-braille-animation.sh'

# 啟動顯示
capybara-favorites-fast
```

### Powerlevel10k 整合

在 Powerlevel10k 設定中加入自訂 segment：
```bash
# 在 ~/.p10k.zsh 中
function prompt_capybara() {
    local capybara_mood
    if [ $? -eq 0 ]; then
        capybara_mood="🦫"
    else
        capybara_mood="😴"
    fi
    p10k segment -f 208 -t "$capybara_mood"
}

# 加入到 segments
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # ... 其他 segments
    capybara
)
```

## 🔧 效能優化

### 條件載入

```bash
# 只在互動式 shell 載入
if [[ -o interactive ]]; then
    # 檢查是否在 SSH 會話（可能較慢）
    if [ -z "$SSH_CLIENT" ]; then
        capybara-favorites-fast
    fi
fi
```

### 快取機制

```bash
# 快取今日水豚
CAPYBARA_CACHE_DIR="${HOME}/.cache/capybara"
mkdir -p "$CAPYBARA_CACHE_DIR"

capybara_daily() {
    local today=$(date +%Y%m%d)
    local cache_file="$CAPYBARA_CACHE_DIR/daily_$today.txt"
    
    if [ -f "$cache_file" ]; then
        cat "$cache_file"
    else
        # 產生並快取
        ~/terminal-ascii-art/scripts/show-capybara.sh random | tee "$cache_file"
    fi
}

# 使用快取版本
capybara_daily
```

## 🎮 互動功能

### 指令建議

```bash
# 指令找不到時顯示水豚建議
command_not_found_handler() {
    echo "Command '$1' not found" | \
    cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow
    
    # 提供建議
    if command -v brew &> /dev/null; then
        echo "Try: brew search $1"
    fi
    
    return 127
}
```

### 歡迎訊息

```bash
# 個人化歡迎訊息
capybara_welcome() {
    local hour=$(date +%H)
    local day=$(date +%A)
    local weather=$(curl -s "wttr.in?format=%c%t" 2>/dev/null || echo "🌤️")
    
    cat << EOF | cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
Welcome back, $(whoami)!
Today is $day
Weather: $weather
Have a great day! 🌿
EOF
}

# 只在新的終端視窗顯示
if [ -z "$CAPYBARA_WELCOMED" ]; then
    capybara_welcome
    export CAPYBARA_WELCOMED=1
fi
```

## 📝 完整配置範例

這是一個完整的 `.zshrc` 配置片段：

```bash
# ===== Capybara ASCII Art Configuration =====

# 路徑設定
export CAPYBARA_HOME="$HOME/terminal-ascii-art"

# 基本別名
alias capy="$CAPYBARA_HOME/scripts/show-capybara.sh"
alias capy-braille="$CAPYBARA_HOME/scripts/show-braille-animation.sh"

# Cowsay 別名
for style in "" -zen -happy -swimming -sleepy; do
    alias "cs${style}"="cowsay -f $CAPYBARA_HOME/cowsay/capybara${style}.cow"
done

# 啟動顯示（最愛 Braille 圖案）
if [[ -o interactive ]] && [ -z "$SSH_CLIENT" ]; then
    capybara-favorites-fast() {
        local favorites=(3 13 34 25)
        local selected=${favorites[$((RANDOM % 4))]}
        $CAPYBARA_HOME/scripts/show-braille-animation.sh $selected --startup
    }
    capybara-favorites-fast
fi

# 實用函數
capy-say() { echo "$@" | cs; }
capy-date() { date | cs-happy; }
capy-pwd() { pwd | cs-zen; }

# ===== End Capybara Configuration =====
```

---
更多創意整合請參考 [creative-examples.md](./creative-examples.md)
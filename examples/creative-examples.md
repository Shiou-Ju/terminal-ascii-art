# 🎨 創意使用案例

展示 Terminal ASCII Art Capybara Collection 的創意應用！

## 🎉 節日主題

### 生日提醒
```bash
#!/bin/bash
# birthday-reminder.sh

# 設定生日（月-日）
BIRTHDAYS=(
    "01-15:Alice"
    "03-22:Bob"
    "07-08:Charlie"
)

TODAY=$(date +%m-%d)

for birthday in "${BIRTHDAYS[@]}"; do
    date_part="${birthday%%:*}"
    name_part="${birthday##*:}"
    
    if [ "$TODAY" = "$date_part" ]; then
        figlet -f ~/terminal-ascii-art/figlet/capybara.flf "HAPPY"
        figlet -f ~/terminal-ascii-art/figlet/capybara.flf "BIRTHDAY"
        echo "🎂 Today is $name_part's birthday! 🎉" | \
        cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
    fi
done
```

### 新年倒數
```bash
#!/bin/bash
# new-year-countdown.sh

# 計算到新年的天數
CURRENT_YEAR=$(date +%Y)
NEXT_YEAR=$((CURRENT_YEAR + 1))
NEW_YEAR_DATE="${NEXT_YEAR}-01-01"
DAYS_LEFT=$(( ($(date -d "$NEW_YEAR_DATE" +%s) - $(date +%s)) / 86400 ))

if [ $DAYS_LEFT -gt 0 ]; then
    echo "$DAYS_LEFT days until New Year!" | \
    cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
else
    ~/terminal-ascii-art/scripts/show-capybara.sh happy
    figlet -f ~/terminal-ascii-art/figlet/capybara.flf "HAPPY $NEXT_YEAR"
fi
```

## 📊 資料儀表板

### Git 儲存庫狀態板
```bash
#!/bin/bash
# git-dashboard.sh

show_git_status() {
    echo "=== Git Repository Dashboard ==="
    echo ""
    
    # 分支資訊
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo "Current Branch: $BRANCH" | \
        cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
        
        # 提交統計
        COMMITS_TODAY=$(git log --since="midnight" --oneline | wc -l)
        COMMITS_WEEK=$(git log --since="1 week ago" --oneline | wc -l)
        
        echo "📈 Commit Statistics:"
        echo "  Today: $COMMITS_TODAY commits"
        echo "  This Week: $COMMITS_WEEK commits"
        
        # 檔案狀態
        MODIFIED=$(git status --porcelain | grep "^ M" | wc -l)
        UNTRACKED=$(git status --porcelain | grep "^??" | wc -l)
        
        if [ $MODIFIED -gt 0 ] || [ $UNTRACKED -gt 0 ]; then
            echo ""
            echo "📝 File Status:"
            echo "  Modified: $MODIFIED files"
            echo "  Untracked: $UNTRACKED files"
        fi
    else
        echo "Not a git repository" | \
        cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow
    fi
}

# 在所有 git 專案中執行
for dir in ~/projects/*/; do
    if [ -d "$dir/.git" ]; then
        echo ""
        echo "🦫 Repository: $(basename "$dir")"
        cd "$dir"
        show_git_status
    fi
done
```

### 系統健康監控
```bash
#!/bin/bash
# health-monitor.sh

check_system_health() {
    # CPU 使用率
    CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
    
    # 記憶體使用
    if [[ "$OSTYPE" == "darwin"* ]]; then
        MEM_USAGE=$(top -l 1 | grep PhysMem | awk '{print $2}' | sed 's/M//')
    else
        MEM_USAGE=$(free -m | awk 'NR==2{printf "%.1f", $3*100/$2}')
    fi
    
    # 磁碟使用
    DISK_USAGE=$(df -h / | awk 'NR==2{print $5}' | sed 's/%//')
    
    # 根據狀態選擇水豚
    if [ ${CPU_USAGE%.*} -gt 80 ] || [ ${DISK_USAGE} -gt 90 ]; then
        CAPYBARA_STYLE="sleepy"
        STATUS="⚠️  System needs attention!"
    else
        CAPYBARA_STYLE="happy"
        STATUS="✅ System is healthy!"
    fi
    
    # 顯示儀表板
    clear
    ~/terminal-ascii-art/scripts/show-capybara.sh $CAPYBARA_STYLE
    
    cat << EOF
System Health Dashboard
=======================
CPU Usage: ${CPU_USAGE}%
Memory Usage: ${MEM_USAGE}%
Disk Usage: ${DISK_USAGE}%

Status: $STATUS
=======================
Last updated: $(date +"%Y-%m-%d %H:%M:%S")
EOF
}

# 持續監控模式
if [ "$1" = "--watch" ]; then
    while true; do
        check_system_health
        sleep 5
    done
else
    check_system_health
fi
```

## 🎮 終端遊戲

### 水豚賽跑
```bash
#!/bin/bash
# capybara-race.sh

# 初始化
TRACK_LENGTH=50
declare -a positions=(0 0 0)
declare -a names=("Zen" "Happy" "Sleepy")
declare -a symbols=("🧘" "😊" "😴")

clear
echo "🏁 Welcome to Capybara Race! 🏁"
echo "Press Enter to start..."
read

# 遊戲主循環
while true; do
    clear
    echo "🏁 Capybara Race 🏁"
    echo ""
    
    # 顯示賽道
    for i in {0..2}; do
        echo -n "${names[$i]} ${symbols[$i]} "
        
        # 畫賽道
        for j in $(seq 0 $TRACK_LENGTH); do
            if [ $j -eq ${positions[$i]} ]; then
                echo -n "🦫"
            else
                echo -n "."
            fi
        done
        echo " |"
    done
    
    # 移動水豚
    for i in {0..2}; do
        move=$((RANDOM % 3))
        positions[$i]=$((positions[$i] + move))
        
        # 檢查獲勝者
        if [ ${positions[$i]} -ge $TRACK_LENGTH ]; then
            echo ""
            echo "🎉 ${names[$i]} Capybara wins! 🎉" | \
            cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
            exit 0
        fi
    done
    
    sleep 0.3
done
```

### 水豚記憶遊戲
```bash
#!/bin/bash
# memory-game.sh

# 遊戲設定
STYLES=(relaxed zen happy swimming sleepy small)
SEQUENCE=()
LEVEL=1

show_sequence() {
    echo "Remember this sequence:"
    for style in "${SEQUENCE[@]}"; do
        clear
        ~/terminal-ascii-art/scripts/show-capybara.sh $style
        echo "Style: $style"
        sleep 1.5
        clear
    done
}

play_round() {
    # 新增一個隨機樣式到序列
    NEW_STYLE=${STYLES[$((RANDOM % ${#STYLES[@]}))]}
    SEQUENCE+=($NEW_STYLE)
    
    echo "Level $LEVEL - Remember ${#SEQUENCE[@]} capybaras!"
    sleep 2
    
    show_sequence
    
    echo "Now repeat the sequence:"
    echo "Available: ${STYLES[@]}"
    
    # 玩家輸入
    for i in "${!SEQUENCE[@]}"; do
        read -p "Capybara #$((i+1)): " user_input
        
        if [ "$user_input" != "${SEQUENCE[$i]}" ]; then
            echo "❌ Wrong! The correct sequence was: ${SEQUENCE[@]}"
            echo "You reached level $LEVEL!" | \
            cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow
            exit 0
        fi
    done
    
    echo "✅ Correct! Moving to next level..."
    ((LEVEL++))
    sleep 2
}

# 遊戲開始
clear
echo "🧠 Capybara Memory Game 🧠" | \
cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
echo "Press Enter to start..."
read

while true; do
    clear
    play_round
done
```

## 🎬 動畫故事

### 水豚的一天 - 互動版
```bash
#!/bin/bash
# capybara-day-interactive.sh

clear
echo "🦫 A Day in the Life of a Capybara - Interactive Story 🦫"
echo ""
echo "You are a capybara. What's your name?"
read -p "> " CAPY_NAME

echo ""
echo "Good morning, $CAPY_NAME!"
sleep 2

# 早晨選擇
clear
~/terminal-ascii-art/scripts/show-capybara.sh sleepy
echo "You just woke up. What do you want to do?"
echo "1) Go for a swim"
echo "2) Meditate"
echo "3) Go back to sleep"
read -p "> " morning_choice

case $morning_choice in
    1)
        clear
        ~/terminal-ascii-art/scripts/show-capybara.sh swimming
        echo "$CAPY_NAME is enjoying a refreshing morning swim! 🏊"
        ;;
    2)
        clear
        ~/terminal-ascii-art/scripts/show-capybara.sh zen
        echo "$CAPY_NAME finds inner peace through meditation 🧘"
        ;;
    3)
        clear
        ~/terminal-ascii-art/scripts/show-capybara.sh sleepy
        echo "$CAPY_NAME decides five more minutes won't hurt... 😴"
        ;;
esac

sleep 3

# 繼續故事...
echo ""
echo "What a great morning! Press Enter to continue..."
read
```

## 🌐 網路整合

### 天氣預報水豚
```bash
#!/bin/bash
# weather-capybara.sh

# 獲取天氣（需要網路連線）
WEATHER=$(curl -s "wttr.in?format=%C+%t+%w" 2>/dev/null)

if [ -z "$WEATHER" ]; then
    echo "Cannot fetch weather data" | \
    cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow
    exit 1
fi

# 解析天氣資訊
CONDITION=$(echo $WEATHER | awk '{print $1}')
TEMP=$(echo $WEATHER | awk '{print $2}')

# 根據天氣選擇水豚
case "$CONDITION" in
    *Sunny*|*Clear*)
        STYLE="happy"
        MESSAGE="Perfect day for sunbathing! ☀️"
        ;;
    *Rain*|*Drizzle*)
        STYLE="zen"
        MESSAGE="A good day to stay calm indoors 🌧️"
        ;;
    *Cloud*)
        STYLE="relaxed"
        MESSAGE="Nice and cloudy, perfect for a nap ☁️"
        ;;
    *)
        STYLE="small"
        MESSAGE="Interesting weather today!"
        ;;
esac

# 顯示天氣報告
clear
~/terminal-ascii-art/scripts/show-capybara.sh $STYLE
echo ""
echo "🌤️ Capybara Weather Report 🌤️"
echo "=========================="
echo "Condition: $CONDITION"
echo "Temperature: $TEMP"
echo ""
echo "$MESSAGE" | cowsay -f ~/terminal-ascii-art/cowsay/capybara-$STYLE.cow
```

### RSS 新聞閱讀器
```bash
#!/bin/bash
# news-capybara.sh

# 簡單的 RSS 解析（需要 curl 和 xmllint）
RSS_URL="https://news.ycombinator.com/rss"
NEWS_COUNT=5

echo "📰 Capybara News Reader 📰" | \
cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow

echo ""
echo "Fetching latest news..."

# 獲取並解析 RSS
curl -s "$RSS_URL" | \
xmllint --xpath "//item[position()<=$NEWS_COUNT]/title/text()" - 2>/dev/null | \
while IFS= read -r title; do
    echo "• $title"
    echo ""
done

echo ""
echo "That's all for now!" | \
cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
```

## 🎨 藝術創作

### ASCII 藝術組合器
```bash
#!/bin/bash
# art-combiner.sh

# 創建水豚藝術牆
create_art_wall() {
    local cols=3
    local rows=2
    
    echo "🎨 Capybara Art Gallery 🎨"
    echo "========================="
    
    for row in $(seq 1 $rows); do
        # 準備一行的圖案
        local patterns=()
        for col in $(seq 1 $cols); do
            local random_num=$((RANDOM % 41 + 1))
            patterns+=($random_num)
        done
        
        # 並排顯示
        paste <(~/terminal-ascii-art/scripts/show-braille-animation.sh ${patterns[0]} --quiet) \
              <(~/terminal-ascii-art/scripts/show-braille-animation.sh ${patterns[1]} --quiet) \
              <(~/terminal-ascii-art/scripts/show-braille-animation.sh ${patterns[2]} --quiet)
    done
}

create_art_wall
```

### 動態橫幅產生器
```bash
#!/bin/bash
# banner-generator.sh

create_capybara_banner() {
    local message="$1"
    local width=60
    
    # 頂部邊框
    printf '🦫%.0s' $(seq 1 $((width/2)))
    echo ""
    
    # 訊息
    figlet -f ~/terminal-ascii-art/figlet/capybara.flf -w $width "$message"
    
    # 底部邊框
    printf '🦫%.0s' $(seq 1 $((width/2)))
    echo ""
}

# 使用範例
create_capybara_banner "WELCOME"
echo ""
echo "To the wonderful world of Capybaras!" | \
cowsay -f ~/terminal-ascii-art/cowsay/capybara-happy.cow
```

---

這些創意範例展示了 Terminal ASCII Art Capybara Collection 的無限可能性。發揮你的創意，創造更多有趣的應用！ 🦫
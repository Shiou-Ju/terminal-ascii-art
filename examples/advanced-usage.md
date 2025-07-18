# 🚀 進階使用技巧

本文件展示 Terminal ASCII Art Capybara Collection 的進階使用方法和技巧。

## 🔧 終端整合

### Git Hook 整合

在 `.git/hooks/post-commit` 中加入：
```bash
#!/bin/bash
# 每次 commit 後顯示開心的水豚
~/terminal-ascii-art/scripts/show-capybara.sh happy
echo "Great commit! 🦫"
```

### Shell 提示符整合

在 `.zshrc` 或 `.bashrc` 中：
```bash
# 錯誤時顯示愛睏水豚
command_not_found_handler() {
    ~/terminal-ascii-art/scripts/show-capybara.sh sleepy
    echo "Command not found: $1"
    return 127
}
```

## 🎯 自動化腳本

### 系統監控報告
```bash
#!/bin/bash
# system-monitor.sh

# 收集系統資訊
UPTIME=$(uptime | awk -F'up' '{print $2}' | awk -F',' '{print $1}')
LOAD=$(uptime | awk -F'load average:' '{print $2}')
DISK=$(df -h / | tail -1 | awk '{print $5}')

# 產生報告
cat << EOF | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
System Status Report
====================
Uptime: $UPTIME
Load: $LOAD
Disk Usage: $DISK
EOF
```

### 定時提醒
```bash
#!/bin/bash
# reminder.sh

# 使用 cron 設定定時提醒
# crontab -e
# 0 */2 * * * ~/terminal-ascii-art/scripts/reminder.sh

MESSAGE="Time to take a break! 🌿"
echo $MESSAGE | cowsay -f ~/terminal-ascii-art/cowsay/capybara-zen.cow | wall
```

## 🎨 創意組合

### ASCII 動畫序列
```bash
#!/bin/bash
# capybara-story.sh

clear
echo "A Day in the Life of a Capybara..."
sleep 2

# 早晨
~/terminal-ascii-art/scripts/show-capybara.sh sleepy
echo "6:00 AM - Waking up..."
sleep 3

# 游泳
clear
~/terminal-ascii-art/scripts/show-capybara.sh swimming
echo "8:00 AM - Morning swim..."
sleep 3

# 放鬆
clear
~/terminal-ascii-art/scripts/show-capybara.sh zen
echo "10:00 AM - Meditation time..."
sleep 3

# 開心
clear
~/terminal-ascii-art/scripts/show-capybara.sh happy
echo "12:00 PM - Lunch time!"
sleep 3
```

### 互動式選單
```bash
#!/bin/bash
# capybara-menu.sh

while true; do
    clear
    ~/terminal-ascii-art/scripts/show-capybara.sh small
    echo "
🦫 Capybara Menu
================
1) Show Random Capybara
2) Play Animation
3) Show Braille Art
4) Convert Photo
5) Exit

Choose an option: "
    read -r choice
    
    case $choice in
        1) ~/terminal-ascii-art/scripts/show-capybara.sh random ;;
        2) ~/terminal-ascii-art/scripts/show-capybara.sh animate ;;
        3) ~/terminal-ascii-art/scripts/show-braille-animation.sh 25 ;;
        4) echo "Enter photo path: "; read -r photo
           ~/terminal-ascii-art/scripts/convert-photo.sh "$photo" ;;
        5) echo "Bye! 🦫"; exit 0 ;;
        *) echo "Invalid option" ;;
    esac
    
    echo "Press Enter to continue..."
    read -r
done
```

## 🌈 主題和樣式

### 彩色輸出增強
```bash
# 使用 lolcat 增加彩虹效果（需先安裝 lolcat）
./scripts/show-capybara.sh happy | lolcat

# 動態彩虹 Braille
./scripts/show-braille-animation.sh 25 | lolcat -a -d 10
```

### 自訂顏色主題
```bash
#!/bin/bash
# colored-capybara.sh

# 定義顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 根據時間顯示不同顏色
HOUR=$(date +%H)

if [ $HOUR -lt 12 ]; then
    COLOR=$YELLOW  # 早上：黃色
elif [ $HOUR -lt 18 ]; then
    COLOR=$GREEN   # 下午：綠色
else
    COLOR=$BLUE    # 晚上：藍色
fi

echo -e "${COLOR}"
./scripts/show-capybara.sh random
echo -e "${NC}"
```

## 📊 資料視覺化

### 進度條顯示
```bash
#!/bin/bash
# progress-capybara.sh

show_progress() {
    local progress=$1
    local total=10
    local filled=$((progress * total / 100))
    
    echo -n "["
    for ((i=0; i<filled; i++)); do echo -n "🦫"; done
    for ((i=filled; i<total; i++)); do echo -n " "; done
    echo "] $progress%"
}

# 模擬進度
for i in {0..100..10}; do
    clear
    ./scripts/show-capybara.sh small
    show_progress $i
    sleep 0.5
done
```

### 統計圖表
```bash
#!/bin/bash
# stats-display.sh

# 顯示檔案大小統計
echo "File Size Distribution:" | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow

du -sh * | sort -hr | head -10 | while read size file; do
    # 根據大小選擇不同表情
    if [[ $size == *"M"* ]] || [[ $size == *"G"* ]]; then
        echo "😱 $size $file"  # 大檔案
    else
        echo "😊 $size $file"  # 小檔案
    fi
done
```

## 🔗 管道和串流處理

### 日誌監控
```bash
# 即時日誌監控，錯誤時顯示水豚
tail -f /var/log/system.log | while read line; do
    if echo "$line" | grep -i "error" > /dev/null; then
        echo "$line" | cowsay -f ~/terminal-ascii-art/cowsay/capybara-sleepy.cow
    fi
done
```

### 網路狀態監控
```bash
#!/bin/bash
# network-monitor.sh

check_connection() {
    if ping -c 1 google.com > /dev/null 2>&1; then
        ~/terminal-ascii-art/scripts/show-capybara.sh happy
        echo "Internet connection: OK ✅"
    else
        ~/terminal-ascii-art/scripts/show-capybara.sh sleepy
        echo "Internet connection: DOWN ❌"
    fi
}

# 每 5 分鐘檢查一次
while true; do
    clear
    check_connection
    sleep 300
done
```

## 🎮 互動遊戲

### 猜數字遊戲
```bash
#!/bin/bash
# guess-the-number.sh

SECRET=$((RANDOM % 10 + 1))
ATTEMPTS=0

~/terminal-ascii-art/scripts/show-capybara.sh happy
echo "I'm thinking of a number between 1 and 10!"

while true; do
    read -p "Your guess: " guess
    ((ATTEMPTS++))
    
    if [ "$guess" -eq "$SECRET" ]; then
        ~/terminal-ascii-art/scripts/show-capybara.sh happy
        echo "Correct! You got it in $ATTEMPTS attempts! 🎉"
        break
    elif [ "$guess" -lt "$SECRET" ]; then
        echo "Too low! Try higher..." | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
    else
        echo "Too high! Try lower..." | cowsay -f ~/terminal-ascii-art/cowsay/capybara.cow
    fi
done
```

## 🚀 效能優化

### 快取常用圖案
```bash
# 建立快取目錄
mkdir -p ~/.capybara-cache

# 快取常用圖案
for style in relaxed zen happy swimming sleepy; do
    ~/terminal-ascii-art/scripts/show-capybara.sh $style > ~/.capybara-cache/$style.txt
done

# 快速顯示快取圖案
cat ~/.capybara-cache/happy.txt
```

### 批次處理
```bash
# 批次轉換照片
find ~/Pictures -name "*.jpg" -type f | head -10 | while read photo; do
    output="${photo%.jpg}_ascii.txt"
    ~/terminal-ascii-art/scripts/convert-photo.sh "$photo" > "$output"
    echo "Converted: $photo -> $output"
done
```

---
更多創意用法請參考 [creative-examples.md](./creative-examples.md)
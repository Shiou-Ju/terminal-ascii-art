# 🦫 基礎使用範例

這裡展示 Terminal ASCII Art Capybara Collection 的基礎使用方法。

## 🎨 ASCII Art 基礎使用

### 顯示單一風格
```bash
# 顯示特定風格的水豚
./scripts/show-capybara.sh relaxed   # 悠閒風格
./scripts/show-capybara.sh zen       # 禪意風格
./scripts/show-capybara.sh happy     # 開心風格
./scripts/show-capybara.sh swimming  # 游泳風格
./scripts/show-capybara.sh sleepy    # 愛睏風格
./scripts/show-capybara.sh small     # 迷你風格
```

### 隨機顯示
```bash
# 隨機選擇一個風格顯示
./scripts/show-capybara.sh random
./scripts/show-capybara.sh           # 預設為隨機
```

### 查看幫助
```bash
./scripts/show-capybara.sh help
```

## 🐄 Cowsay 基礎使用

### 基本對話
```bash
# 使用預設水豚
cowsay -f ./cowsay/capybara.cow "Hello World!"

# 使用不同表情的水豚
cowsay -f ./cowsay/capybara-zen.cow "Finding inner peace..."
cowsay -f ./cowsay/capybara-happy.cow "I'm so happy!"
cowsay -f ./cowsay/capybara-swimming.cow "Just keep swimming!"
cowsay -f ./cowsay/capybara-sleepy.cow "Time for a nap..."
```

### 管道使用
```bash
# 顯示系統資訊
uname -a | cowsay -f ./cowsay/capybara.cow

# 顯示日期
date | cowsay -f ./cowsay/capybara-happy.cow

# 顯示檔案內容
cat README.md | head -5 | cowsay -f ./cowsay/capybara.cow
```

## 🔤 Figlet 基礎使用

### 簡單文字
```bash
# 顯示單一單詞
figlet -f ./figlet/capybara.flf "HELLO"

# 顯示多個單詞
figlet -f ./figlet/capybara.flf "CAPY BARA"
```

### 組合使用
```bash
# Figlet + Cowsay 組合
figlet -f ./figlet/capybara.flf "CAPY" | cowsay -f ./cowsay/capybara.cow
```

## ⠿ Braille 點字藝術

### 單一圖案顯示
```bash
# 顯示特定編號的圖案
./scripts/show-braille-animation.sh 1
./scripts/show-braille-animation.sh 25
./scripts/show-braille-animation.sh 41
```

### 範圍顯示
```bash
# 顯示連續範圍的圖案
./scripts/show-braille-animation.sh 1-5    # 顯示第 1 到 5 個
./scripts/show-braille-animation.sh 10-20  # 顯示第 10 到 20 個
```

### 快速瀏覽模式
```bash
# 無延遲快速瀏覽
./scripts/show-braille-animation.sh --fast

# 顯示特定圖案（無延遲）
./scripts/show-braille-animation.sh 25 --fast
```

## 📸 照片轉 ASCII

### 瀏覽圖庫
```bash
# 顯示所有可用照片
./scripts/show-capybara-photo.sh gallery

# 顯示特定照片
./scripts/show-capybara-photo.sh 1
./scripts/show-capybara-photo.sh 2
```

### 轉換自訂照片
```bash
# 基本轉換
./scripts/convert-photo.sh ~/Pictures/my-photo.jpg

# 指定寬度
./scripts/convert-photo.sh ~/Pictures/my-photo.jpg --width=60

# 彩色輸出
./scripts/convert-photo.sh ~/Pictures/my-photo.jpg --color
```

## 🎬 場景和動畫

### 場景顯示
```bash
# 列出所有場景
./scripts/show-capybara.sh scene

# 顯示特定場景
./scripts/show-capybara.sh scene-onsen   # 溫泉場景
./scripts/show-capybara.sh scene-river   # 河邊場景
```

### 動畫播放
```bash
# 播放所有動畫
./scripts/show-capybara.sh animate

# 播放特定動畫
./scripts/show-capybara.sh animate-blink  # 眨眼
./scripts/show-capybara.sh animate-swim   # 游泳
```

## 💡 實用技巧

### 1. 清屏後顯示
```bash
clear && ./scripts/show-capybara.sh zen
```

### 2. 保存輸出到檔案
```bash
./scripts/show-capybara.sh happy > capybara-happy.txt
```

### 3. 組合多個圖案
```bash
for style in relaxed zen happy; do
    ./scripts/show-capybara.sh $style
    sleep 2
done
```

### 4. 隨機問候語
```bash
GREETINGS=("Hello!" "Hi there!" "Good day!" "Welcome!")
GREETING=${GREETINGS[$RANDOM % ${#GREETINGS[@]}]}
echo $GREETING | cowsay -f ./cowsay/capybara-happy.cow
```

---
更多進階用法請參考 [advanced-usage.md](./advanced-usage.md)
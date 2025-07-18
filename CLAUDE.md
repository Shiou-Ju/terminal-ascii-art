# Terminal ASCII Art - Capybara Collection 開發指引

## 專案概述

這是一個輕鬆的 ASCII art 專案，專為終端愛好者提供可愛的水豚主題工具。

## 開發原則

### 📋 工作流程
- **直接 commit 到 main 分支**：這是個輕鬆專案，暫時全部提交到 main 分支
- **小步快跑**：每個功能完成後立即提交
- **清楚的 commit 訊息**：使用 Conventional Commits 格式

### 🎯 專案目標
- 為三種工具創建水豚主題：cowsay、figlet、asciiart
- 提供多種水豚風格：relaxed、zen、swimming、happy、sleepy
- 簡易安裝和使用流程
- 完整的文件和範例

## 技術實作

### 🛠️ 工具結構

#### cowsay (.cow 檔案)
- 使用 Perl 風格的 .cow 檔案格式
- 支援動態對話框
- 多種表情變化

#### figlet (.flf 檔案)
- FIGlet 字型檔案格式
- 每個字符的 ASCII 設計
- 統一的設計風格

#### asciiart (文字檔案)
- 純 ASCII 圖案庫
- 支援腳本隨機選擇
- 場景和動畫效果

### 📁 目錄結構說明

```
terminal-ascii-art/
├── README.md           # 專案說明和使用指南
├── CLAUDE.md          # 開發指引（本檔案）
├── .claude/           # Claude 設定檔案
├── cowsay/            # cowsay 工具檔案 ✅
├── figlet/            # figlet 字型檔案 ✅
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
├── photos/            # 照片素材 ✅
│   └── originals/                  # Pixabay 免費照片
├── examples/          # 使用範例 ✅
│   ├── basic-usage.md              # 基礎使用範例
│   ├── advanced-usage.md           # 進階技巧
│   ├── zsh-integration.md          # zsh 整合指南
│   └── creative-examples.md        # 創意使用案例
└── docs/              # 文件 ✅
    ├── installation.md             # 詳細安裝指南
    ├── troubleshooting.md          # 故障排除
    ├── compatibility.md            # 相容性說明
    └── contributing.md             # 貢獻指南
```

## 🎨 設計標準

### ASCII Art 設計原則
- **一致性**：所有水豚圖案保持相似風格
- **可讀性**：在各種終端環境下都能正確顯示
- **尺寸適中**：避免過大或過小的圖案
- **表情豐富**：不同情境使用不同表情

### 水豚風格定義
- **relaxed**：悠閒放鬆，眼睛平靜
- **zen**：冥想狀態，眼睛閉合
- **swimming**：游泳姿勢，水花效果
- **happy**：開心表情，眼睛彎曲
- **sleepy**：愛睏狀態，眼睛半閉

## 🔧 開發工具

### 必要依賴
- cowsay（測試 .cow 檔案）
- figlet（測試 .flf 檔案）
- bash/zsh（執行腳本）

### 測試方法
```bash
# 測試 asciiart (已完成)
./scripts/show-capybara.sh relaxed
./scripts/show-capybara.sh zen
./scripts/show-capybara.sh happy
./scripts/show-capybara.sh swimming
./scripts/show-capybara.sh sleepy
./scripts/show-capybara.sh small
./scripts/show-capybara.sh random
./scripts/show-capybara.sh help

# 測試 cowsay (已完成)
cowsay -f ./cowsay/capybara.cow "測試訊息"
cowsay -f ./cowsay/capybara-zen.cow "Finding peace"
cowsay -f ./cowsay/capybara-happy.cow "So happy!"
cowsay -f ./cowsay/capybara-swimming.cow "Just swimming"
cowsay -f ./cowsay/capybara-sleepy.cow "Zzz..."

# 測試 figlet (已完成)
figlet -f ./figlet/capybara.flf "TEST"
figlet -f ./figlet/capybara.flf "CAPY BARA"

# 測試 Braille 動畫 (已完成)
./scripts/show-braille-animation.sh           # 全部顯示
./scripts/show-braille-animation.sh 25        # 單一圖案
./scripts/show-braille-animation.sh 1-10      # 範圍顯示
./scripts/show-braille-animation.sh 25 --fast # 快速模式

# 測試 jp2a 照片轉換 (已完成)
./scripts/show-capybara-photo.sh gallery
./scripts/convert-photo.sh ~/Pictures/test.jpg
```

## 🚀 部署流程

### 安裝腳本
1. 檢查依賴（cowsay、figlet）
2. 複製檔案到正確位置
3. 設定別名到 .zshrc/.bashrc
4. 驗證安裝成功

### 使用者體驗
- 一鍵安裝腳本
- 清楚的錯誤訊息
- 完整的使用範例
- 故障排除指南

## 📸 測試案例

### 基本功能測試
- [x] cowsay 所有風格都能正常顯示
- [x] asciiart 腳本執行無誤
- [x] 6種風格圖案正確顯示
- [x] 隨機選擇功能正常
- [x] 幫助功能完整
- [x] figlet 字型檔案語法正確
- [x] Braille 動畫系統完整運作
- [x] jp2a 照片轉換功能
- [ ] 安裝腳本在 macOS 和 Linux 正常運作

### 相容性測試
- [x] macOS 環境測試通過（iTerm2、Terminal.app）
- [ ] Linux 環境測試
- [ ] 不同字型和顏色設定
- [ ] 不同終端尺寸

## 🎯 GitHub Issues 規劃

### Main Issue (總進度追蹤)
- 追蹤所有子任務進度
- 整體專案狀態
- 重要決策記錄

### 子 Issues
1. ✅ 設計 Capybara ASCII Art 圖案集 (已完成)
2. ✅ 實作 cowsay capybara.cow 檔案 (已完成)
3. ✅ 實作 figlet capybara.flf 字型檔案 (已完成)
4. ✅ 實作 asciiart capybara 圖案庫 (已完成)
5. ✅ 實作 Braille 點字藝術動畫系統 (已完成)
6. 🔄 創建安裝腳本和工具鏈 (待開發)
7. 🔄 完善文件和使用說明 (進行中)

## 🔒 安全考量

### Claude 設定
- 禁止破壞性 git 操作
- 禁止破壞性 gh cli 操作
- 確認所有檔案操作安全

### 檔案安全
- 不包含可執行的惡意代碼
- 所有腳本都經過驗證
- 明確的檔案權限設定

## 🤝 貢獻指引

### 新增水豚風格
1. 設計 ASCII 圖案
2. 為三種工具都創建對應檔案
3. 更新文件和範例
4. 測試在不同環境的顯示效果

### 程式碼風格
- 使用清楚的變數名稱
- 適當的註解說明
- 統一的檔案格式

## 📊 專案現況總結

### 已完成功能 ✅
- **ASCII Art 系統**：10+ 種風格，場景和動畫
- **Cowsay 整合**：5 種表情變化
- **Figlet 字型**：完整字元集
- **Braille 動畫**：41 個高解析度圖案，進階參數支援
- **jp2a 照片轉換**：圖庫和自訂轉換
- **文件系統**：完整的使用範例和技術文件

### 技術亮點 🌟
- **Unicode 支援**：Braille 點字藝術展示
- **Shell 整合**：zsh/bash 深度整合
- **參數系統**：靈活的顯示控制
- **跨平台相容**：macOS/Linux 完整支援

### 待完成項目 📝
- [ ] 自動安裝腳本
- [ ] Linux 發行版測試
- [ ] 國際化支援
- [ ] VS Code 擴充

### 文件完成度 📚
- ✅ README.md - 完整更新
- ✅ examples/ - 4 個詳細範例文件
- ✅ docs/ - 4 個技術文件
- ✅ CLAUDE.md - 開發指引（本檔案）

---

*讓終端變得更可愛，一次一隻水豚！* 🦫

*最後更新：2025-07-18*
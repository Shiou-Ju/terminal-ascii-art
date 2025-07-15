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
├── cowsay/            # cowsay 工具檔案
├── figlet/            # figlet 字型檔案
├── asciiart/          # ASCII art 圖案庫
├── scripts/           # 安裝和工具腳本
└── examples/          # 使用範例和說明
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
# 測試 cowsay
cowsay -f ./cowsay/capybara.cow "測試訊息"

# 測試 figlet
figlet -f ./figlet/capybara.flf "TEST"

# 測試 asciiart
./scripts/show-capybara.sh relaxed
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
- [ ] cowsay 所有風格都能正常顯示
- [ ] figlet 字型檔案語法正確
- [ ] asciiart 腳本執行無誤
- [ ] 安裝腳本在 macOS 和 Linux 正常運作

### 相容性測試
- [ ] 不同終端環境（iTerm2、Terminal.app、VSCode）
- [ ] 不同字型和顏色設定
- [ ] 不同終端尺寸

## 🎯 GitHub Issues 規劃

### Main Issue (總進度追蹤)
- 追蹤所有子任務進度
- 整體專案狀態
- 重要決策記錄

### 子 Issues
1. 設計 Capybara ASCII Art 圖案集
2. 實作 cowsay capybara.cow 檔案
3. 實作 figlet capybara.flf 字型檔案
4. 實作 asciiart capybara 圖案庫
5. 創建安裝腳本和工具鏈
6. 完善文件和使用說明

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

---

*讓終端變得更可愛，一次一隻水豚！* 🦫
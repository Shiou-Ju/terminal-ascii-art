# 🤝 貢獻指南

歡迎為 Terminal ASCII Art Capybara Collection 貢獻！這裡是如何參與的指南。

## 🌟 貢獻方式

### 1. 回報問題
- 發現 bug
- 提出新功能建議
- 改善文件
- 分享使用經驗

### 2. 提交程式碼
- 修復 bug
- 新增功能
- 改善效能
- 增加測試

### 3. 創作內容
- 設計新的 ASCII art
- 創建 cowsay 檔案
- 設計 figlet 字型
- 撰寫使用範例

## 🚀 開始貢獻

### 1. Fork 專案

```bash
# 在 GitHub 上 Fork 專案
# 然後 clone 你的 fork
git clone https://github.com/YOUR_USERNAME/terminal-ascii-art.git
cd terminal-ascii-art
```

### 2. 建立分支

```bash
# 建立新分支
git checkout -b feature/amazing-capybara

# 分支命名慣例：
# feature/功能名稱
# fix/問題描述
# docs/文件項目
# art/圖案名稱
```

### 3. 開發環境設定

```bash
# 安裝依賴
brew install cowsay figlet jp2a  # macOS
# 或
sudo apt install cowsay figlet jp2a  # Ubuntu/Debian

# 設定 git hooks（可選）
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# 執行基本測試
./scripts/test-all.sh
EOF
chmod +x .git/hooks/pre-commit
```

## 🎨 ASCII Art 貢獻指南

### 設計原則

1. **保持一致性**
   - 使用相似的風格
   - 尺寸適中（寬度 < 80 字元）
   - 高度合理（10-20 行）

2. **可讀性優先**
   - 在各種終端都能正確顯示
   - 避免過於複雜的細節
   - 測試不同字型

3. **表情豐富**
   - 展現水豚的不同情緒
   - 保持可愛風格

### ASCII Art 範例

```
標準格式：
    ∩___∩
   /       \
  | ● ● ● ● |
  |    ___   |
  |  \___/   |
   \_______/
     ~~~~~
```

### 提交新圖案

1. 加入到適當的檔案：
   - `asciiart/capybara-gallery.txt` - 基本圖案
   - `asciiart/capybara-scenes.txt` - 場景圖案
   - `asciiart/capybara-animations.txt` - 動畫幀

2. 使用標準格式：
   ```
   ### CAPYBARA_style_name ###
   [ASCII art here]
   ### END ###
   ```

3. 更新腳本支援新風格

## 🐄 Cowsay 檔案創建

### .cow 檔案格式

```perl
# capybara-new.cow
$the_cow = <<"EOC";
        $thoughts
         $thoughts
          $thoughts
            ∩___∩
           /       \\
          | ● ● ● ● |
          |    ___   |
          |  \\___/   |
           \\_______/
             ~~~~~
EOC
```

### 變數說明
- `$thoughts` - 對話連接線
- `$eyes` - 眼睛（使用 -e 參數）
- `$tongue` - 舌頭（使用 -T 參數）

### 測試你的 .cow 檔案

```bash
cowsay -f ./cowsay/capybara-new.cow "Hello!"
```

## 🔤 Figlet 字型開發

### FLF 檔案格式

基本結構：
```
flf2a$ 8 6 15 -1 0
Capybara Font by YOUR_NAME
$$
$$$
@@
  ____  @@
 / ___|  @@
| |      @@
| |___   @@
 \____|  @@
         @@
         @@
         @@
```

### 設計指南
1. 每個字元 8 行高
2. 保持風格一致
3. 測試所有 ASCII 字元

## 📝 程式碼標準

### Shell 腳本規範

```bash
#!/bin/bash
# 檔案描述
# 作者：YOUR_NAME
# 日期：YYYY-MM-DD

# 使用 set 選項
set -euo pipefail

# 常數大寫
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly VERSION="1.0.0"

# 函數使用底線命名
show_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]
...
EOF
}

# 主程式
main() {
    # 程式邏輯
}

# 執行主程式
main "$@"
```

### 註解規範

```bash
# 單行註解說明功能

#
# 多行註解區塊
# 說明複雜邏輯
#

# TODO: 待完成項目
# FIXME: 需要修復的問題
# NOTE: 重要提醒
```

## ✅ 測試要求

### 基本測試

```bash
# 執行所有測試
./scripts/test-all.sh

# 測試特定功能
./scripts/test-cowsay.sh
./scripts/test-figlet.sh
./scripts/test-asciiart.sh
```

### 相容性測試

確保在以下環境測試：
- [ ] macOS (Terminal.app)
- [ ] macOS (iTerm2)
- [ ] Ubuntu/Debian
- [ ] 不同 Shell (bash/zsh)

## 📤 提交 Pull Request

### 1. Commit 訊息格式

使用 Conventional Commits：
```
feat: 新增禪意水豚圖案
fix: 修復 Braille 顯示問題
docs: 更新安裝說明
style: 統一程式碼格式
refactor: 重構顯示邏輯
test: 新增相容性測試
chore: 更新依賴版本
```

### 2. PR 描述模板

```markdown
## 描述
簡要說明這個 PR 的內容

## 改動類型
- [ ] Bug 修復
- [ ] 新功能
- [ ] 文件更新
- [ ] 效能改善
- [ ] 其他

## 測試
- [ ] 已在 macOS 測試
- [ ] 已在 Linux 測試
- [ ] 已更新相關文件
- [ ] 已新增/更新測試

## 截圖（如適用）
[加入截圖展示改動效果]

## 相關 Issue
Closes #123
```

### 3. PR 檢查清單

提交前確認：
- [ ] 程式碼符合專案風格
- [ ] 所有測試通過
- [ ] 更新相關文件
- [ ] commit 訊息清晰
- [ ] 沒有無關檔案

## 🎯 貢獻重點領域

### 目前需要協助

1. **多語言支援**
   - 翻譯文件
   - 國際化訊息

2. **平台支援**
   - Windows (WSL) 測試
   - 其他 Linux 發行版測試

3. **創意內容**
   - 節日主題圖案
   - 互動式動畫
   - 新場景設計

4. **工具整合**
   - VS Code 擴充
   - 其他編輯器支援

## 💬 社群準則

### 行為準則

1. **友善互助**
   - 尊重所有貢獻者
   - 建設性的討論
   - 耐心幫助新手

2. **保持專業**
   - 專注於技術討論
   - 避免人身攻擊
   - 接受不同意見

3. **開放包容**
   - 歡迎所有背景的人
   - 使用包容性語言
   - 重視多元觀點

### 溝通管道

- **GitHub Issues** - Bug 回報和功能請求
- **GitHub Discussions** - 一般討論和問答
- **Pull Requests** - 程式碼審查和討論

## 🏆 貢獻者認可

我們重視每一份貢獻！

- 所有貢獻者會列在 README
- 重要貢獻會在 Release Notes 特別感謝
- 持續貢獻者可獲得 Collaborator 權限

## 📚 資源連結

- [Shell 腳本最佳實踐](https://google.github.io/styleguide/shellguide.html)
- [ASCII Art 教學](http://www.ascii-art.de/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)

## ❓ 需要幫助？

如果有任何問題：

1. 查看現有的 [Issues](https://github.com/Shiou-Ju/terminal-ascii-art/issues)
2. 閱讀 [FAQ](./troubleshooting.md)
3. 在 Discussions 提問
4. 直接在 PR 中詢問

---

*感謝你的貢獻！讓我們一起讓終端世界更可愛！* 🦫

## 📋 快速參考

### Git 工作流程
```bash
# 1. 同步上游
git remote add upstream https://github.com/Shiou-Ju/terminal-ascii-art.git
git fetch upstream
git checkout main
git merge upstream/main

# 2. 建立功能分支
git checkout -b feature/amazing-feature

# 3. 開發並提交
git add .
git commit -m "feat: add amazing feature"

# 4. 推送到你的 fork
git push origin feature/amazing-feature

# 5. 建立 Pull Request
```

### 測試指令
```bash
# 快速測試
make test

# 完整測試
make test-all

# 特定測試
./test/test-asciiart.sh
```
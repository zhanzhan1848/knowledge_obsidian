#!/bin/bash
# Git 同步脚本 - 自动提交并推送知识库更新

set -e

VAULT_PATH="$HOME/knowledge-vault"
cd "$VAULT_PATH"

echo "🔄 Syncing knowledge vault to GitHub..."

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ No changes to commit"
    exit 0
fi

# 添加所有变更
git add .

# 提交
COMMIT_MSG="Auto: Update knowledge base $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"

# 推送
git push origin main

echo "✅ Knowledge vault synced successfully!"

#!/bin/bash
# Git sync script for knowledge vault
# Usage: ./git-sync.sh "commit message"

VAULT_PATH="$HOME/knowledge-vault"
cd "$VAULT_PATH" || exit 1

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git remote add origin https://github.com/zhanzhan1848/knowledge_obsidian.git
fi

# Add all changes
git add -A

# Commit with timestamp or custom message
MESSAGE="${1:-Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')}"
git commit -m "$MESSAGE"

# Push to remote
git pull --rebase origin main 2>/dev/null || true
git push origin main

echo "✅ Git sync completed: $MESSAGE"

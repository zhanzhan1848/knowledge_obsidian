#!/bin/bash
# 知识库初始化脚本 - 读取配置自动创建目录结构

set -e

CONFIG_FILE="$HOME/knowledge-vault/.knowledge-config.json"
VAULT_PATH="$HOME/knowledge-vault"

echo "🔧 Initializing Knowledge Vault..."

# 检查配置文件
if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Config file not found: $CONFIG_FILE"
    exit 1
fi

# 为单个 agent 创建目录
init_agent_directories() {
    local agent_id=$1
    local directories=$(jq -r ".agents[] | select(.id==\"$agent_id\") | .directories" "$CONFIG_FILE")

    if [ "$directories" = "null" ]; then
        echo "⚠️  No directories found for agent: $agent_id"
        return
    fi

    echo "  📁 Creating directories for $agent_id..."
    for dir in $(echo "$directories" | jq -r '.[]'); do
        mkdir -p "$VAULT_PATH/$dir"
        echo "    ✓ $VAULT_PATH/$dir"
    done
}

# 初始化所有启用的 agent
echo ""
echo "📚 Initializing agent directories..."
jq -r '.agents[] | select(.enabled==true) | .id' "$CONFIG_FILE" | while read agent_id; do
    init_agent_directories "$agent_id"
done

echo ""
echo "✅ Knowledge vault initialized successfully!"
echo ""
echo "📋 Next steps:"
echo "  1. Run: ./.scripts/generate-cron.sh <agent_id> to generate cron jobs"
echo "  2. Edit: /root/.openclaw/cron/jobs.json to add cron tasks"
echo "  3. Commit: git add . && git commit -m 'Init: Initialize knowledge vault'"

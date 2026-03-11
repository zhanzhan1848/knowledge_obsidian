#!/bin/bash
# 读取配置自动生成 cron 任务 JSON

set -e

CONFIG_FILE="$HOME/knowledge-vault/.knowledge-config.json"
AGENT_ID=$1

if [ -z "$AGENT_ID" ]; then
    echo "❌ Usage: $0 <agent_id>"
    echo "   Available agents:"
    jq -r '.agents[] | select(.enabled==true) | "  - \(.id) (\(.name))"' "$CONFIG_FILE"
    exit 1
fi

# 检查 agent 是否存在
if ! jq -e ".agents[] | select(.id==\"$AGENT_ID\")" "$CONFIG_FILE" > /dev/null; then
    echo "❌ Agent not found: $AGENT_ID"
    exit 1
fi

# 读取 agent 配置
agent_config=$(jq -r ".agents[] | select(.id==\"$AGENT_ID\")" "$CONFIG_FILE")
name=$(echo "$agent_config" | jq -r '.name')
domain=$(echo "$agent_config" | jq -r '.domain_name')
keywords=$(echo "$agent_config" | jq -r '.search.keywords | join(", ")')
schedule=$(echo "$agent_config" | jq -r '.search.schedule')
papers_dir=$(echo "$agent_config" | jq -r '.directories.papers')

# 生成 cron 任务 payload
payload="执行每日${domain}论文搜索任务。搜索范围：最近24小时内发表在 arXiv 和 ACM Digital Library 上的论文。关键词：${keywords}。对找到的论文进行内容抓取和提炼，创建结构化笔记存入 ~/knowledge-vault/${papers_dir}/。"

# 输出 JSON
cat <<EOF
{
  "name": "${AGENT_ID}-daily-paper-search",
  "schedule": {
    "kind": "cron",
    "expr": "${schedule}",
    "tz": "Asia/Shanghai"
  },
  "sessionTarget": "isolated",
  "wakeMode": "now",
  "payload": {
    "kind": "agentTurn",
    "message": "${payload}",
    "deliver": false,
    "agent": "${AGENT_ID}"
  }
}
EOF

echo ""
echo "✅ Cron job generated for: $AGENT_ID ($name)"
echo ""
echo "📋 To add this job:"
echo "  1. Copy the JSON above"
echo "  2. Edit: /root/.openclaw/cron/jobs.json"
echo "  3. Add to jobs array:"
echo "     \"jobs\": ["
echo "       ...,"
echo "       { /* paste JSON above */ }"
echo "     ]"

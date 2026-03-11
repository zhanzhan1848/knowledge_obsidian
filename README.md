# Openclaw 知识管理系统

基于 Openclaw Agent 系统的自动化知识管理仓库，用于收集、整理和检索计算机图形学相关领域的论文和技术资料。

## 系统架构

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        知识管理流程                                      │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐        │
│  │ 每天22点 │───▶│Web Search│───▶│内容抓取  │───▶│AI提炼    │        │
│  │Cron触发  │    │arXiv/ACM  │    │URL解析   │    │重点/公式 │        │
│  └──────────┘    │SIGGRAPH  │    └──────────┘    │代码/URL  │        │
│                  └──────────┘                    └────┬─────┘        │
│  ┌─────────────────────────────────────────────────────┘              │
│  │                                                                   │
│  ▼                                                                   │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐       │
│  │结构化笔记│───▶│Markdown  │───▶│本地仓库  │───▶│Git推送   │       │
│  │Frontmatter│   │+Wikilink │    │~/knowledge│    │GitHub同步 │       │
│  └──────────┘    └──────────┘    └──────────┘    └──────────┘       │
│       │                                                                  │
│       │     ┌─────────────────────────────────────────────────┐        │
│       └────▶│                     用户查询                     │        │
│             │  ┌───────────────────────────────────────────┐  │        │
│             │  │菜菜路由 → Agent检索 → 知识库匹配 → 方案输出│  │        │
│             │  └───────────────────────────────────────────┘  │        │
│             └─────────────────────────────────────────────────┘        │
└─────────────────────────────────────────────────────────────────────────┘

多端访问:
┌─────────┐    ┌─────────┐    ┌─────────┐
│ 服务器  │    │  桌面端  │    │ 手机端  │
│ CLI     │    │ Git克隆  │    │Obsidian │
└─────────┘    └─────────┘    └─────────┘
    │              │              │
    └────── Git仓库 ─────────────┘
```

## 目录结构

```
knowledge-vault/
├── .knowledge-config.json    # 核心：所有 agent 配置
├── .scripts/                  # 自动化脚本
│   ├── init.sh               # 初始化目录
│   ├── generate-cron.sh      # 生成 cron 任务
│   └── git-sync.sh           # Git 同步
├── .obsidian/                 # Obsidian 配置（手机端）
├── Templates/                 # 笔记模板
│   ├── paper.md              # 论文模板
│   ├── book.md               # 书籍模板
│   └── concept.md            # 概念模板
├── 00-Global/MOC.md          # 知识地图
├── shengcai/                 # 生菜 - 渲染技术
│   ├── 00-MOC/
│   ├── 01-Papers/
│   ├── 02-Concepts/
│   ├── 03-Books/
│   ├── 04-Projects/
│   └── 05-Assets/
├── wawaicai/                 # 娃娃菜 - 几何处理
├── caixin/                   # 菜心 - 流体力学
└── doumiao/                  # 豆苗 - 流体渲染
```

## 知识领域 Agent

| Agent | 领域 | 搜索关键词 | 搜索源 |
|-------|------|-----------|--------|
| 🥬 **生菜** | 渲染技术 | ray tracing, path tracing, PBR, GI | arXiv cs.GR, ACM DL, SIGGRAPH |
| 🥬 **娃娃菜** | 几何处理 | mesh processing, point cloud, subdivision | arXiv cs.GR, ACM DL, SIGGRAPH, Eurographics |
| 🥬 **菜心** | 流体力学 | CFD, navier-stokes, SPH, LBM | arXiv cs.FL, physics.flu-dyn |
| 🌱 **豆苗** | 流体渲染 | fluid rendering, water, smoke, fire | arXiv cs.GR, SIGGRAPH |

## 自动化工作流

### 定时任务（每天 22:00）

1. **Web Search**: 搜索最近 24 小时的新论文
2. **内容抓取**: 获取论文标题、作者、摘要、PDF
3. **AI 提炼**: 提取核心知识
   - ✅ 保留: 核心创新点、数学公式、关键代码、原始 URL
   - ❌ 抛弃: 冗余数据、详细表格、作者背景、致谢
4. **创建笔记**: 使用模板生成结构化 Markdown
5. **Git 同步**: 自动提交并推送到 GitHub

### 检索流程

```
用户查询
    ↓
菜菜 识别领域 → 分发对应 Agent
    ↓
知识库检索
    1. 关键词匹配文件名
    2. grep 全文搜索
    3. 解析 [[wikilink]] 扩展
    ↓
综合知识库 + AI 生成技术方案
```

## 笔记模板

### 论文笔记格式

```markdown
---
type: paper
created: 2026-03-11
tags: [paper, ray-tracing]
domain: rendering
source: https://arxiv.org/abs/xxxx
---

# 论文标题

## 元信息
| 标题 | ... |
| 作者 | ... |
| 链接 | [原文](url) |

## 核心贡献
1. ...
2. ...

## 技术方案
(核心思想)

## 公式
```math
...
```

## 代码片段
```cpp
...
```

## 实验结论
...

## 局限性
...
```

## 多端使用

### 服务器端（Openclaw Agent）
- **路径**: `~/knowledge-vault/`
- **自动化**: Cron 定时搜索 + AI 提炼
- **同步**: Git 自动推送

### 桌面端
```bash
git clone git@github.com:zhanzhan1848/knowledge_obsidian.git ~/knowledge-vault
# 使用任意 Markdown 编辑器编辑
```

### 手机端
1. 安装 **Obsidian Mobile**
2. 克隆仓库或使用 Git 插件
3. 打开关系图查看知识网络

## 添加新知识领域

编辑 `.knowledge-config.json`：

```json
{
  "id": "tomato",
  "name": "番茄",
  "emoji": "🍅",
  "domain": "machine-learning",
  "domain_name": "机器学习",
  "enabled": true,
  "search": {
    "keywords": ["transformer", "neural network"],
    "sources": ["arxiv"],
    "arxiv_categories": ["cs.LG", "cs.AI"]
  },
  "directories": {
    "root": "tomato",
    "papers": "tomato/01-Papers",
    ...
  }
}
```

运行初始化：
```bash
~/.knowledge-vault/.scripts/init.sh
~/.knowledge-vault/.scripts/generate-cron.sh tomato
```

## 配置文件

| 文件 | 说明 |
|------|------|
| `.knowledge-config.json` | 所有 Agent 配置（核心） |
| `.scripts/init.sh` | 初始化目录结构 |
| `.scripts/generate-cron.sh` | 生成 Cron 任务 |
| `.scripts/git-sync.sh` | Git 自动同步 |

## 相关链接

- **GitHub**: https://github.com/zhanzhan1848/knowledge_obsidian
- **Openclaw**: AI Agent 系统
- **Obsidian**: 知识管理工具

## License

MIT

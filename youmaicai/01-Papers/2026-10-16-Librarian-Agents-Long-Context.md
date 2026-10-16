# Librarian Agents: Training LLMs to Curate Long-Context Workspaces

## 元信息
| 标题 | Librarian Agents: Training LLMs to Curate Long-Context Workspaces that Anticipate Future Queries |
|------|----------------------------------------------------------------------------------------------|
| 作者 | Anikait Singh, Teresa Zhang, Yoonho Lee, Roshen Sanjay Nair, Aviral Kumar, Chelsea Finn (Stanford) |
| 链接 | [原文](https://arxiv.org/abs/2610.22273) |
| arXiv | arXiv:2610.22273 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.LG, cs.AI, cs.CL |

## 核心贡献
1. **Anticipatory Directed Curation**：让 agent 学会在推理前**主动重组非结构化语料**，高效服务未来的多种查询
2. **Librarian Agents 框架**：
   - **Builder agent**：把原始文档转换为"分层文件系统 + 引用链接"
   - **Answering agent**：使用 workspace 回答下游查询
3. **形式化为 MDP**：通过 RL 直接优化下游回答准确率
4. **实证优势**：
   - 在 BrowseComp-Plus 上比最强 retrieval/precomputation baseline **+33 个百分点**
   - 在 BRIGHT unseen domains 上 zero-shot **+31 个百分点**

## 方法
### 构建流程
```python
raw_docs → Builder Agent → {files, ref_links} → Workspace
                                                ↓
query → Answering Agent ← (uses Workspace)
```

### MDP 形式化
- **State**：当前文件系统 + 已用引用
- **Action**：写入新合成文件 / 添加引用链接
- **Reward**：下游 answering accuracy

## 实验结果
| 基准 | 提升幅度 |
|------|---------|
| **BrowseComp-Plus** | +33 pct vs 最强检索/precomputation baseline |
| **BRIGHT (unseen)** | +31 pct zero-shot 平均准确率 |

### 关键优势
- **前置成本分摊**：构建一次性，回答多次
- **超越 KG/KG-Aug 方案**：学习式构建优于手工启发式
- **泛化到 unseen domain**：zero-shot 仍取得巨大提升

## 关键洞察
- 现代 agentic harness（如 Claude Code）擅长**导航**已有文件系统，但很少被训练去**构建可复用 workspace**
- 在已有工具（如文件系统、引用链接）外**无需新增能力**，仅改训练目标
- 与 RAG 相比：**precomputation** 形式

## 相关工作
[[Long-Context-LLMs]] [[RAG]] [[Retrieval-Augmented-Generation]] [[Agentic-RAG]] [[Knowledge-Graph]] [[Workspace-Construction]]

## 局限性
- 训练成本：builder agent 需要 RL 训练
- 文件系统组织方式依赖下游 answering agent 的工具
- 跨领域泛化虽强但有领域边界

## 应用建议
- 适合**重复性查询的企业场景**：客服知识库 / 法务文档 / 学术文献库
- 与 RAG 结合：workspace 内含 synth 文件 + ref 链接，retrieval 阶段已有结构
- 可借鉴思路：不只为"现在 query"提供答案，更为"未来 query"构建复利

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*

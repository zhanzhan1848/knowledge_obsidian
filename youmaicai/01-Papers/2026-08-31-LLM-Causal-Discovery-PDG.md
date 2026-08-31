# LLM-Augmented Causal Discovery: Probabilistic Fusion of Edge Existence and Orientation

## 元信息
| 标题 | LLM-Augmented Causal Discovery: Probabilistic Fusion of Edge Existence and Orientation |
|------|------|
| 作者 | Neville K. Kitson, Anthony Constantinou |
| 链接 | [原文](https://arxiv.org/abs/2608.27472) |
| arXiv | arXiv:2608.27472 |
| 会议 | PGM 2026 (Poster) |

## 核心贡献
1. 提出 **Probabilistic Dependency Graphs (PDGs)** 表示：每条边关联 directed/undirected/absent 状态的分布
2. 50/50 融合策略在 26 个基准网络中的 22 个上提升 F1，均值提升 **0.056 (p < 0.001)**
3. 揭示 BNSL 和 LLM 的互补角色：BNSL 高召回边骨架（80% vs 60%），LLM 精确边方向（96% vs 77%）

## 问题背景
- **BNSL**: 从观测数据学习贝叶斯网络结构，但方向识别困难
- **LLM**: 拥有广泛但往往不可靠的因果知识

## 方法: Probabilistic Dependency Graphs (PDG)
```
PDG = {
  每条边 e: P(e=directed | data, LLM) 
          + P(e=undirected | data, LLM)
          + P(e=absent | data, LLM)
}

融合: PDG_BNSL + PDG_LLM → 加权平均 → 最终 PDG
```

## 实验设置
- **26 个基准网络**
- **BNSL 算法**: FGES, Tabu, PC
- **LLM**: Gemini, Claude, GPT
- 多个 prompts 和随机种子

## 核心结果
| 指标 | BNSL 单独 | LLM 单独 | 50/50 融合 |
|------|-----------|----------|------------|
| Edge skeleton F1 | 80% | 60% | - |
| Edge orientation F1 | 77% | 96% | - |
| 整体 F1 | 基线 | 基线 | **+0.056** |

- 22/26 网络通过融合提升 F1
- 融合对两来源各自的短板有明显弥补

## 互补性分析
- **BNSL 贡献**: 高召回边骨架（发现可能存在的边）
- **LLM 贡献**: 精确边方向（判断因果指向）
- 两者天然互补：统计方法擅长发现相关性，语言模型擅长注入结构化知识

## 建议
- **是否推荐使用**: 是
- **适用场景**: 因果发现、知识图谱构建、科学发现
- **研究方向**: PDG 与其他因果方法集成、动态融合权重

---
*关键词*: 因果发现, 贝叶斯网络, LLM, PDG, 因果图
*研究领域*: cs.AI

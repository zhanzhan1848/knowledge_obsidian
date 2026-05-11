---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [spoken-language-model, role-playing, singing, multimodal, expressive]
status: processed
domain: Multimodal Speech
agent: youmaicai
source: https://arxiv.org/abs/2605.06765
---

# VITA-QinYu: Expressive Spoken Language Model for Role-Playing and Singing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VITA-QinYu: Expressive Spoken Language Model for Role-Playing and Singing |
| **作者** | Jiacheng Xu, Heting Gao, Liufei Xie, Zhenchuan Yang, Lijiang Li, Yiting Chen, Bin Zhang, Meng Chen, Chaoyu Fu, Weifeng Zhao, Wenjiang Zhou |
| **发表** | arXiv 2026 (cs.CL) |
| **链接** | [原文](https://arxiv.org/abs/2605.06765) |
| **DOI** | 10.48550/arXiv.2605.06765 |
| **代码** | [GitHub](https://tme-lyra-lab.github.io/VITA-QinYu/) |

---

## 核心贡献

> 首个端到端表达性口语语言模型 (SLM)，同时支持 role-playing 和 singing 生成。采用 hybrid speech-text paradigm 结合 multi-codebook audio tokens 实现丰富的副语言表示。_

1. **首个 E2E 表达性 SLM**: 同时支持 role-playing 和 singing，超出自然对话范围
2. **Hybrid speech-text paradigm**: 扩展 interleaved text-audio modeling，使用 multi-codebook audio tokens，保持模态清晰分离避免干扰
3. **15.8K 小时训练数据**: 涵盖自然对话、role-playing 和 singing 的综合数据生成管道

---

## 技术方案

### 核心架构

- **Multi-codebook audio tokens**: 支持更丰富的副语言表示
- **Hybrid speech-text paradigm**: 保持 text 和 speech 模态的清晰分离
- **End-to-end (E2E)**: 从语音输入到语音输出的端到端训练

### 训练数据

| 类型 | 规模 |
|------|------|
| 自然对话 | 包含在 15.8K 小时中 |
| Role-playing | 包含在 15.8K 小时中 |
| Singing | 包含在 15.8K 小时中 |
| 总计 | 15.8K 小时 |

---

## 实验结论

| 任务 | 性能 | 超越基线 |
|------|------|---------|
| Role-playing benchmark | +7% (pp) | peer SLMs |
| Singing MOS (5-point) | +0.13 | peer models |
| C3 benchmark | +1.38 pp | prior SLMs |
| URO benchmark | +4.98 pp | prior SLMs |

---

## 局限性

- 专注中文语音（论文描述基于中文场景）
- 开源模型和代码，但 demo 可能需要额外配置

---

## 实现建议

- **实现难度**: 高（涉及 E2E 语音模型训练）
- **预期性能**: SOTA 在 role-playing 和 singing 任务
- **适用场景**: 情感语音助手、角色扮演应用、歌声生成

---

## Tags

#spoken-language-model #role-playing #singing #multimodal #expressive #E2E
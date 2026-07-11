# UltraX: Refining Pre-Training Data at Scale with Adaptive Programmatic Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Refining Pre-Training Data at Scale with Adaptive Programmatic Editing |
| **arXiv** | arXiv:2607.08646 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08646 |
| **作者** | Xinlong Zhao, Dongsheng Liu, Hengyu Zhao, Zixuan Fu, Zheng Wang, Jie Cai, Jie Zhou, Qiang Ma, Xuanhe Zhou, Xu Han, Yudong Wang, Zhiyuan Liu (清华) |
| **日期** | 2026-07-10 |

## 核心贡献

1. 针对 **scaling law 收益递减**问题，提出 **UltraX**：大规模预训练数据 refinement framework
2. 扩展编辑函数空间：Insertion + Deletion + Modification = 完整编辑能力
3. 实现 **细粒度 instance-level 编辑**（非粗粒度过滤）

## 问题背景

现有大规模语料 refinement 方法的局限：

| 方法 | 质量 | 效率 | 可靠性 |
|------|------|------|--------|
| Rule-based | 固定启发式，难以处理 instance-level 变化 | 高 | 低 |
| LLM-based | 质量高 | 低（成本高） | 不可靠（大规模处理） |

## 方法：UltraX

### Function-Calling Refinement Framework

```
原始文本 → dataset-adaptive prompt optimization
         → expert LLM 生成高质量 refined 文本
         → Line Alignment Mapping（对齐原始和精炼文本）
         → Dynamic Context Replacement（结构化 program supervision）
         → 精炼文本
```

### 核心组件

1. **Dataset-Adaptive Prompt Optimization**：为每个数据集定制 prompt，引导 expert LLM 生成高质量端到端精炼文本
2. **Line Alignment Mapping**：对齐原始文本和精炼文本的行级对应
3. **Dynamic Context Replacement**：将 original-refined 对转换为结构化 program supervision 格式

### 编辑操作

- **Deletion**：删除低质量部分
- **Modification**：修改不当内容
- **Insertion**：插入缺失的相关信息（新增）

## 关键创新

- 从粗粒度过滤 → 细粒度编辑的范式转变
- function-calling 接口使 LLM 编辑可规模化、可复现
- program supervision 保证编辑过程可验证

## 相关工作

- [[2607.08399]] - Prompt Compression（另一类 LLM 效率优化）
- [[2607.08393]] - Knowing-Using Gap（fine-tuning 泛化问题）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08646 | 2026-07-10*

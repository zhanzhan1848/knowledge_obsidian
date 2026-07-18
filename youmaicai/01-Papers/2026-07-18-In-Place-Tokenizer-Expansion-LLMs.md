# 🥬 LLM 论文分析：In-Place Tokenizer Expansion for Pre-trained LLMs

## 基本信息
- **标题**: In-Place Tokenizer Expansion for Pre-trained LLMs
- **作者**: Jimmy Smith et al. (Meta?)
- **发表**: arXiv, 2026-07-16
- **链接**: [原文](https://arxiv.org/abs/2607.15232)
- **arXiv**: arXiv:2607.15232
- **领域**: cs.CL / cs.LG (LLM Tokenizer / 多语言模型)

## 核心贡献
1. 提出 **tokenizer expansion**：在模型生产商控制 tokenizer 设计时，**原地升级**预训练模型 tokenizer 的配方
2. 在现有 tokenizer 的 BPE merges 基础上继续扩展到多语言语料，使大多数原 token 保持不变
3. 应用到 LFM2-8B-A1B（8B MoE），扩展至 128K tokenizer 产生 LFM2.5-8B-A1B
4. 印度语/越南语编码效率提升 ~2.4-2.6×，泰语高达 4.0×，per-character 解码加速 2.2-3.7×

## 问题背景
- 预训练时固定的 tokenizer 按预训练语料比例分配词汇
- 后期添加的语言被分割成更多 token，增加延迟和能耗
- 云端大模型可负担大词表（embedding 占比小）；端侧小模型词表小，碎片化严重

## 方法：两阶段适应

### 阶段 1：Embedding-Only 训练
- 保留原有 embedding rows 不变
- 新 token rows 初始化为源 sub-token embeddings 的均值

### 阶段 2：Full-Model 继续预训练
- 恢复源 checkpoint 质量

### 关键保证
- 每个新 token 都有对源 token 的精确分解 → embedding 可通过均值初始化
- 大多数源 token 作为单 token 保留 → 原有表示不受破坏

## 实验结果

| 语言 | 原 tokenizer 效率 | 扩展后效率 | 提升倍数 |
|------|-----------------|-----------|---------|
| Hindi | ~2.4× fewer tokens | - | 2.4× |
| Vietnamese | ~2.6× fewer tokens | - | 2.6× |
| Thai | 最高 4.0× fewer tokens | - | 4.0× |

per-character decode speedup: **2.2-3.7×**（跨参考设备）

## 发布内容
- 模型权重
- 扩展后的 tokenizer
- 负面发现报告（塑造配方的失败经验）

## 建议
- **是否推荐使用**: 是（多语言 LLM 部署场景）
- **适用场景**: 端侧多语言模型、 tokenizer 升级

---
*📅 录入日期: 2026-07-18 | 来源: arXiv cs.CL*

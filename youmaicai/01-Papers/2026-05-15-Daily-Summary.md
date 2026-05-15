# Daily Summary - 2026-05-15

## 论文搜索任务报告

### 数据来源
- arXiv RSS: cs.AI, cs.CL, cs.LG
- 搜索时间: 2026-05-15 14:16 UTC

### 发现论文
共发现 **7篇** 相关新论文（cs.CL/cs.AI/cs.LG），已提炼笔记 4 篇。

### 论文列表

| 编号 | 标题 | 领域 | 关键词 |
|------|------|------|--------|
| 1 | Merging Methods for Multilingual Knowledge Editing for LLMs | cs.CL | 知识编辑, 多语言, 模型合并 |
| 2 | Mistletoe: Stealthy Acceleration-Collapse Attacks on Speculative Decoding | cs.CL | 安全, 推理加速, 对抗攻击 |
| 3 | Derivation Prompting: A Logic-Based Method for Improving RAG | cs.CL | RAG, 提示工程, 逻辑推理 |
| 4 | PEML: Parameter-efficient Multi-Task Learning with Optimized Continuous Prompts | cs.CL | 多任务学习, PEFT, LoRA |
| 5 | Physics-R1: An Audited Olympiad Corpus for Visual Physics Reasoning | cs.CL | 视觉推理, 物理, RL |
| 6 | Trajectory-Balance Post-Training for Diffusion Language Models | cs.LG | 扩散模型, 强化学习, 后训练 |
| 7 | VectraYX-Nano: Spanish Cybersecurity Language Model | cs.CL | 领域特定, 多语言, 工具调用 |

### 重要发现

#### 安全领域
- **Mistletoe**: 发现 speculative decoding 推理加速机制的对抗攻击面，可隐密地崩溃加速效果

#### 知识编辑
- **MKE Merging**: 多语言知识编辑中，向量求和+共享协方差是最稳健的合并策略

#### 多任务学习
- **PEML**: 联合优化连续提示和 LoRA 权重，单 adapter 部署即可实现多任务学习

#### RAG 改进
- **Derivation Prompting**: 将逻辑推导树引入 RAG 生成，减少幻觉

### 同步状态
- 笔记保存至: `~/knowledge-vault/youmaicai/01-Papers/`
- Git 同步: 待执行
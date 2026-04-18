# Benchmarking Commonsense Planning under Unspecified Affordance Constraints (DynAfford + ADAPT)

## 基本信息
- **arXiv**: [2604.14902](https://arxiv.org/abs/2604.14902) [cs.AI]
- **作者**: Pei-An Chen et al.
- **发表**: 2026-04-16
- **分类**: cs.AI, cs.CL, cs.CV, cs.RO

## 核心贡献

### DynAfford 基准
动态环境中物体 affordance 变化下的具身智能体规划基准：
- 物体 affordance 随时间变化
- affordance 未在指令中指定
- 评估智能体感知、推理和适应能力

### ADAPT 模块
Plug-and-play 的 affordance 推理模块：
- 感知物体状态
- 推断隐含前提条件
- 相应调整行动

## 关键发现

### ADAPT 的有效性
- 显著提升鲁棒性和任务成功率
- 在 seen 和 unseen 环境中均有效

### VLM 后端比较
| 后端 | 表现 |
|------|------|
| LoRA 微调的 VLM | **优于** GPT-4o |
| GPT-4o (商业 LLM) | 较弱 |

**关键洞察：任务对齐的 affordance grounding 很重要**

## 核心能力

### 1. 感知 (Perception)
感知物体当前状态

### 2. 推理 (Inference)
推断隐含前提条件

### 3. 适应 (Adaptation)
根据变化调整行动

## 局限性
- 模拟环境可能不完全反映真实世界
- VLM 泛化到其他具身任务待验证

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：具身智能、 affordance 推理、VLM 微调
- **创新点**：首个考虑动态 affordance 变化的具身规划基准

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | 具身智能与 Affordance*

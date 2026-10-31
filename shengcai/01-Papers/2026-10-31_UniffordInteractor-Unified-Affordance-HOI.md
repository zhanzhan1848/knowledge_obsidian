---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, SIGGRAPH-Asia-2026, ACM-TOG, HOI, affordance, 3D-MLLM, interaction, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.39745
---

# UniffordInteractor: Reasoning the Unified Affordance for Human and Multi-Object Interaction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | UniffordInteractor: Reasoning the Unified Affordance for Human and Multi-Object Interaction |
| **作者** | Chen Su, Xingqun Qi, Xurui Hu, Bingkun Yang, Muyi Sun, Man Zhang, Zhenan Sun |
| **发表** | **ACM Transactions on Graphics (SIGGRAPH Asia 2026)**, 2026-10-29 (DOI: 10.1145/3842530) |
| **链接** | [原文](https://arxiv.org/abs/2610.39745) |
| **DOI** | 10.1145/3842530 |
| **代码** | - (13 pages, 11 figures) |

---

## 核心贡献

> UniffordInteractor — "先推理后交互"框架：用统一可供性（unified affordance）支撑长时程、多物体的人-物交互生成。

1. **统一可供性推理器 (UAR)** — 微调 3D 多模态大语言模型，做以物体为中心的统一可供性预测，涵盖人-物与**物-物**接触。
2. **层次化交互生成器 (HIG)** — 将交互生成形式化为层次化自回归预测（root → body → hand → objects），以统一可供性为条件。
3. **突破既有局限** — 既有方法只处理单物体/固定物体，且只关注人-物关系接触，忽略物体间接触状态。

---

## 技术方案

### 核心思想

在具身 AI 与沉浸式 AR/VR 中，人-物交互（HOI）的动态建模很关键，但复杂多物体场景下失效：不同实体间的接触状态（尤其物-物接触）未被建模。

UniffordInteractor 把问题拆成两阶段：
1. **推理阶段（Reasoning）** — UAR 用微调 3D MLLM 预测统一可供性。这需要 3D 几何理解（可供性取决于物体形状与场景上下文），因此用 3D 多模态大模型而非纯 2D VLM。
2. **交互阶段（Interacting）** — HIG 以可供性为条件，层次化地（从身体根节点向下到手，再到物体）自回归生成交互。

### 关键技术

| 技术 | 说明 |
|------|------|
| Unified Affordance Reasoner | 微调 3D MLLM，统一可供性预测 |
| Hierarchical Interaction Generator | 层次自回归交互生成 |
| 物-物接触建模 | 突破只建模人-物关系的局限 |
| 3D MLLM 微调 | 可供性依赖几何，需 3D 感知 |
| 长时程生成 | 避免长序列交互漂移 |

---

## 公式

```math
// 层次化自回归（概念式）
p(\mathbf{X}) = \prod_{l \in \mathcal{L}} p\big(\mathbf{X}^{(l)} \mid \mathbf{X}^{(l+1)},\, \mathbf{A}\big)
// \mathcal{L} = {root, body, hand, objects}，A = 统一可供性
```

---

## 代码片段

```python
# 概念伪代码：Reasoning-then-Interacting
affordance = uar.predict(scene_3d, instruction)      # 阶段1: 统一可供性
# 阶段2: 层次自回归生成
x_root   = hig.generate_root(affordance)
x_body   = hig.generate_body(x_root, affordance)
x_hand   = hig.generate_hand(x_body, affordance)
x_object = hig.generate_object(x_hand, affordance)
```

---

## 实验结论

- **基线**: 现有 SOTA 人-物交互生成方法
- **结果**: 在人-物与多物体交互生成上全面超越 SOTA 对应方法

---

## 局限性

- 依赖 3D MLLM 微调，数据与算力成本高
- 摘要未给出具体量化指标
- 可供性推理的泛化到未见物体类型有待验证

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 交互生成的层次化分解思路（root→body→hand→object）与角色动画的层次运动生成有结构相似性，值得交叉参考
- 关联：[[2026-10-31_RealMe-Immersive-Volumetric-Video-Minimal-Captures]]

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 质量 SOTA；推理成本高
- **适用场景**: 具身 AI 仿真、AR/VR 角色交互场景生成
- **优先级**: 中低（偏角色动画/具身智能，非渲染管线核心）

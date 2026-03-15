---
type: paper
created: 2026-03-15
updated: 2026-03-15
tags: [paper, rendering, light-transport, inverse-rendering, NLOS, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.09548
---

# A comprehensive study of time-of-flight non-line-of-sight imaging

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A comprehensive study of time-of-flight non-line-of-sight imaging |
| **作者** | Julio Marco 等 |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.09548) |
| **DOI** | 10.48550/arXiv.2603.09548 |

---

## 核心贡献

> 飞行时间非视距（ToF NLOS）成像技术的综合研究

1. 提供代表性ToF NLOS成像方法的**全面研究和对比**
2. 在**统一的前向模型和硬件设置**下讨论各种方法的异同
3. 评估现有方法在相同硬件条件和光子计数下的性能，揭示共同限制

---

## 技术方案

### 核心思想

ToF NLOS通过反转间接光子的光路来重建隐藏场景，这些光子由可见表面散射并被皮秒分辨率传感器测量。

### 关键技术

| 技术 | 说明 |
|------|------|
| ToF NLOS前向模型 | 统一的测量模型 |
| 逆模型 | 基于假设的简化逆问题 |
| Radon变换 | 与简化模型的关系 |
| 频域迁移 | 相量虚拟视距成像模型 |

---

## 公式

暂无关键数学公式（需进一步阅读PDF）

---

## 代码片段

暂无

---

## 实验结论

- **数据集**: 多个隐藏场景数据集
- **硬件**: 相同的ToF硬件设置
- **结果**: 
  - 现有方法在相同硬件约束下共享类似的空间分辨率、可见性和噪声敏感性限制
  - 方法特定参数导致特定差异

---

## 局限性

- 空间分辨率受限
- 可见性问题
- 对噪声敏感

---

## 相关工作

- [[Light Transport]]
- [[Inverse Rendering]]
- [[Computational Photography]]

---

## 实现建议

- **实现难度**: 高（需要专用硬件）
- **预期性能**: 受硬件限制
- **适用场景**: 
  - 机器人视觉
  - 安防监控
  - 医疗成像

## 渲染相关度

⭐⭐⭐⭐ 高度相关

- 涉及光传输（light transport）和散射（scattering）
- 属于逆渲染（inverse rendering）范畴
- 对理解全局光照和光路追踪有重要意义

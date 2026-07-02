---
type: paper
created: 2026-07-02
updated: 2026-07-02
tags: [light-tracing, neural-rendering, luminaires, path-tracing, normalizing-flow]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.04319
---

# PureLight: Learning Complex Luminaires with Light Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PureLight: Learning Complex Luminaires with Light Tracing |
| **作者** | Pedro Figueirêdo et al. |
| **发表** | arXiv cs.GR, June 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.04319) |
| **DOI** | 10.48550/arXiv.2606.04319 |
| **代码** | 待公开 |

---

## 核心贡献

> 提出神经公式估计复杂灯具的外观，聚焦于具有复杂光传输的挑战性灯具（如被多层镜面层包围的小发射器），这些是传统双向路径追踪难以处理的。

1. 使用光追踪从发射器到出射表面构建路径
2. 将外观估计建模为分布学习问题
3. 使用大 normalizing flow 网络建模出射表面辐射的概率密度函数
4. 将学习到的外观蒸馏到轻量级 MLP 用于高效推理

---

## 技术方案

### 核心思想

复杂灯具（如小型发射器被多层镜面层包围）具有复杂光传输，传统（双向）路径追踪难以处理。

本文方法：
1. 使用光追踪构造从发射器到出射表面的路径
2. 将外观估计表述为分布学习问题
3. 使用大规模 normalizing flow 网络建模出射表面辐射的概率密度函数
4. 恢复出射辐射作为估计 pdf 与 flux 的乘积

### 关键技术

| 技术 | 说明 |
|------|------|
| 光追踪 | 从发射器构建到出射表面的路径 |
| Normalizing Flow | 建模辐射概率密度函数 |
| 知识蒸馏 | 将复杂网络蒸馏到轻量级 MLP |
| 采样网络 | 有效计算来自灯具的直接光照 |
| 混合网络 | 将灯具合成到场景中 |

---

## 实验结论

- **效果**: 可使用低样本数在任意场景中渲染挑战性灯具
- **优势**: 相比纯路径追踪处理复杂光传输更好

---

## 局限性

- 需要预训练和蒸馏过程
- 对极端复杂传输可能仍需更多样本

---

## 相关工作

- [[路径追踪]]
- [[双向路径追踪]]
- [[神经材质]]
- [[灯具渲染]]

---

## 实现建议

- **实现难度**: 中高（需要深度学习与渲染结合）
- **预期性能**: 高效推理，适合生产使用
- **适用场景**: 复杂灯具渲染、电影/游戏光照

---

## 关键词

#光追踪 #神经渲染 #灯具渲染 #路径追踪 #NormalizingFlow #材质估计 #SIGGRAPH2026

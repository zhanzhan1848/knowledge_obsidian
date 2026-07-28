---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [geometry, hair-simulation, finite-elements, mesh-deformation, physically-based]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.22103
---

# Curly Hair Simulation using Curly Finite Elements

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Curly Hair Simulation using Curly Finite Elements |
| **作者** | Zhendong Wang |
| **发表** | arXiv cs.GR, 2026-07-24 |
| **链接** | [原文](https://arxiv.org/abs/2607.22103) |
| **DOI** | 10.48550/arXiv.2607.22103 |
| **代码** | - |

---

## 核心贡献

> 将卷发分解为弯曲基元和解析高频皱纹的有限元方法

1. **Curly Element 分解** - 将每根发丝分解为 rod-base + 解析高频皱纹（平面波或体积螺旋）
2. **曲率能量分裂** - 分离拉伸、屈曲、弯曲贡献
3. **混合碰撞处理** - 粗代理碰撞 + 高频细节解析处理

---

## 技术方案

### 核心思想

卷发模拟难点在于宏观 strand 变形与高频几何细节（波、螺旋）的紧密耦合。本文提出：
- wavy hair：弯曲主导
- spiral hair：扭转主导
- 通过解析函数表示高频皱纹，避免离散化

### 关键技术

| 技术 | 说明 |
|------|------|
| Curly Element | rod-base + 解析皱纹函数 |
| 曲率能量分裂 | 分离不同能量项 |
| 混合碰撞 | coarse proxy + analytical |

---

## 实验结论

- 稳定、高效的卷发模拟
- 视觉保真度高
- 支持多样化场景

---

## 局限性

- 专注于头发模拟
- 需针对其他柔软体扩展

---

## 相关工作

- [[Hair Simulation]]
- [[Finite Element Method]]
- [[Curly Element]]
- [[Mesh Deformation]]

---

## 实现建议

- **实现难度**: 中高
- **依赖**: 物理仿真框架
- **适用场景**: 游戏、电影中的角色头发动画

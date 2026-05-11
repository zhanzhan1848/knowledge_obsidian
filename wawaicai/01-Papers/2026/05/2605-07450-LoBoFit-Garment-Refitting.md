---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, mesh-deformation, garment-simulation, bone-mapping, blending-weights]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.07450
---

# LoBoFit: Flexible Garment Refitting via Local Bone Mapping Blending

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Flexible Garment Refitting via Local Bone Mapping Blending |
| **作者** | Meng Zhang et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.07450) |

---

## 核心贡献

> 提出 LoBoFit，一种基于局部 Bone 映射混合表示的鲁棒服装重适配方法

1. LoBoMap Blending 表示：将服装几何表达为局部 Bone 坐标框架中映射的线性混合
2. 姿态鲁棒初始化 + 良好条件的参数化
3. 局部残差优化保持细节和碰撞处理

---

## 技术方案

### 核心思想

问题：全局坐标中直接变形将顶点非局部耦合，导致优化景观复杂且病态

解决：引入局部 Bone 映射混合表示
- 局部 Bone 映射提供姿态鲁棒初始化
- 混合权重平滑优化景观
- 局部残差优化处理碰撞和细节

### 关键技术

| 技术 | 说明 |
|------|------|
| Local Bone Mapping | 局部坐标框架表达 |
| 线性混合 | 姿态鲁棒初始化 |
| 局部残差优化 | 细节保持 |

---

## 实验结论

- **适用性**: 高分辨率单层/多层服装
- **鲁棒性**: 大形状和拓扑差异
- **质量**: 细节褶皱和合身风格保持

---

## 局限性

- 需要预定义的 Bone 结构
- 对极端变形可能需要更多迭代

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 虚拟试衣、角色动画、电影制作

---

## 相关工作

- [[Mesh Deformation]]
- [[Garment Simulation]]
- [[Skinned Animation]]

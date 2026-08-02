---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [3DGS, articulated-objects, structure-aware, ECCV2026, reconstruction]
status: unread
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.26889
---

# StructureGS: Structure-Aware Gaussian Splatting for Articulated Object Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | StructureGS: Structure-Aware Gaussian Splatting for Articulated Object Reconstruction |
| **作者** | Gahye Lee 等 |
| **发表** | ECCV 2026（已接收） |
| **链接** | [原文](https://arxiv.org/abs/2607.26889) |
| **DOI** | 10.48550/arXiv.2607.26889 |
| **代码** | 待补充 |

---

## 核心贡献

> 将结构感知指导融入 3D Gaussian Splatting，解决关节物体重建中几何、外观和运动参数的纠缠问题

1. 提出 StructureGS——关节物体重建的 3DGS 框架，集成结构感知指导
2. 利用有向包围盒（OBB）强制两个关键结构属性：
   - **空间一致性**：约束每个部件几何在指定区域内紧凑且空间一致
   - **结构连通性**：强制相邻部件间的物理合理接触关系
3. 通过结构感知损失函数在优化过程中注入显式结构约束
4. 在关节物体重建上达到 SOTA，产生高质量几何定义明确的部件几何

---

## 技术方案

### 核心问题

关节物体重建中，几何、外观和运动参数相互纠缠。现有方法主要依赖光度监督，通常难以解耦这些相互依赖的组件，导致部件分解差、边界模糊和几何伪影。

### 解决方案

**有向包围盒（OBB）指导的优化**：
- 每个部件的空间区域用 OBB 表示
- 空间一致性损失：约束高斯分布在部件 OBB 内
- 结构连通性损失：强制相邻部件间的接触关系

### 关键技术

| 技术 | 说明 |
|------|------|
| Structure-Aware Loss | 结构感知损失函数 |
| Oriented Bounding Box | 有向包围盒 |
| 空间一致性约束 | compact & coherent geometry |
| 结构连通性约束 | physically plausible contacts |

---

## 实验结论

- ECCV 2026 接收
- 在关节物体重建上达到 SOTA
- 产生高质量结果，部件几何定义明确
- 有效解决边界模糊和几何伪影

---

## 局限性

- 依赖 OBB 初始化
- 需要预知关节结构

---

## 实现建议

- **实现难度**: 中（损失函数设计是关键）
- **预期性能**: SOTA 关节物体重建
- **适用场景**: 机器人操作、物体理解、动画制作
- **优先级**: ⭐⭐⭐ (3DGS 几何质量提升)

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[NeRF]]
- [[Articulated Object Reconstruction]]
- [[ECCV 2026]]

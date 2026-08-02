---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, gaussian-splatting, 3D-reconstruction, geometry]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.26889
---

# Structure-aware Gaussian Splatting for Articulated Object Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Structure-aware Gaussian Splatting for Articulated Object Reconstruction |
| **作者** | Gahye Lee et al. |
| **发表** | arXiv cs.GR, ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.26889) |
| **DOI** | 10.48550/arXiv.2607.26889 |
| **代码** | 待查 |

---

## 核心贡献

> 将结构感知引导集成到3D Gaussian Splatting中，通过定向边界框约束实现高质量关节物体重建

1. **空间一致性约束**：将每部分几何约束在指定区域内保持紧凑
2. **结构连接性约束**：强制相邻部分之间的物理接触关系
3. **关节物体重建 SOTA**：产生定义清晰的部分几何

---

## 技术方案

### 核心思想

现有方法依赖光度监督，难以解耦几何、外观和运动参数，导致：
- 部件分解差
- 边界模糊
- 几何伪影

本文 **StructureGS** 框架：
- 利用部件的定向边界框 (oriented bounding boxes)
- 通过结构感知损失注入显式结构约束
- 显式建模部件间的物理接触关系

### 关键技术

| 技术 | 说明 |
|------|------|
| Oriented Bounding Boxes | 部件的空间约束框 |
| Spatial Coherence Loss | 空间一致性损失 |
| Structural Connectivity Loss | 结构连接性损失 |
| Gaussian Splatting | 3DGS 表示 |

---

## 实验结论

- **数据集**: 多种关节物体数据集
- **结果**: 在关节物体重建上达到 SOTA
- **质量**: 高质量结果，定义清晰的部分几何

---

## 实现建议

- **实现难度**: 中等
- **相关技术**: 3D Gaussian Splatting, geometry reconstruction
- **参考**: Gaussian Splatting 库

---

## 相关笔记

- [[3D Gaussian Splatting]]
- [[Articulated Object Reconstruction]]
- [[Point Cloud Reconstruction]]

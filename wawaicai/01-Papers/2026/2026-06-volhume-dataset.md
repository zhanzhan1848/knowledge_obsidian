---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, human-mesh, dataset, 4D-scanning, volumetric-capture, cs.GR]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.23062
---

# VolHuMe: A High-Resolution Large Scale Dataset of Volumetric Human Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VolHuMe: A High-Resolution Large Scale Dataset of Volumetric Human Meshes |
| **作者** | Niccolò Bisagno et al. |
| **发表** | arXiv cs.GR (2026-06-22) |
| **链接** | [原文](https://arxiv.org/abs/2606.23062) |
| **DOI** | 10.48550/arXiv.2606.23062 |

---

## 核心贡献

> 提出高质量4D人体扫描数据集，使用64台RGB和32台深度相机的先进体素工作室捕获104个受试者

1. **高分辨率4D人体扫描**：使用64 RGB + 32 深度相机的体素工作室
2. **丰富Ground Truth**：SMPL-X、高分辨率Mesh、多视角RGB/深度图像、骨架Mesh、点云、服装分割、精细手部和面部几何
3. **近距离高分辨率设置**：比全身图像方法保留更多细节
4. **评估基准**：对SOTA 3D/4D人体重建方法进行基准测试

---

## 数据集详情

| 属性 | 值 |
|------|-----|
| 受试者数量 | 104 |
| RGB相机 | 64 |
| 深度相机 | 32 |
| Ground Truth | SMPL-X, 高分辨率Mesh, 点云, 服装分割, 手部/面部几何 |
| 几何保真度 | 高（近距离捕获） |
| 纹理分辨率 | 高 |

---

## 适用任务

- 3D人体重建
- 4D动态捕捉
- 人体网格生成
- 点云处理
- 服装变形模拟

---

## 实验结论

- 暴露了当前评估测试平台的局限性
- 为人体几何和纹理研究提供高质量基准
- 比现有数据集几何保真度和纹理分辨率更高

---

## 实现建议

- **实现难度**: N/A (数据集)
- **适用场景**: 人体重建训练/评测、网格处理算法验证
- **参考库**: SMPL-X, Open3D, MeshLib

---

## 相关工作

- [[SMPL-X]]
- [[3D Human Reconstruction]]
- [[4D Capture Datasets]]

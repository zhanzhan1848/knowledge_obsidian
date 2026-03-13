---
type: paper
created: 2026-03-13
updated: 2026-03-13
tags: [paper, point-cloud, neural-reconstruction, vegetation, satellite]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.10996
---

# TreeON: Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps |
| **作者** | Angeliki Grammatikaki et al. |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.10996) |
| **PDF** | https://arxiv.org/pdf/2603.10996 |
| **代码** | https://angelikigram.github.io/treeON/ |

---

## 核心贡献

> 首个从单张正射影像和 DSM 重建详细 3D 树点云的神经框架，无需物种标签、程序规则或地面真值。

1. **几何监督 + 阴影/轮廓损失**：新的训练监督策略，结合几何监督和可微阴影、轮廓损失
2. **合成数据集**：从程序化建模树木生成点云合成数据集，解决地面真值缺乏问题
3. **强泛化能力**：对真实世界数据泛化良好，生成视觉美观且结构合理的树点云

---

## 技术方案

### 核心思想

传统树木重建方法需要物种标签、程序规则、地面重建数据或地面激光扫描。TreeON 仅使用单张正射影像（orthophoto）和数字表面模型（DSM），通过神经网络学习点云表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何监督 | 利用 DSM 高度信息进行几何约束 |
| 可微阴影损失 | 通过阴影分析推断 3D 结构 |
| 可微轮廓损失 | 从正射影像轮廓推断树冠形态 |
| 程序化合成数据 | 使用程序化建模生成训练数据 |

---

## 公式

```math
# 损失函数
L_total = L_geometric + λ_1 · L_shadow + λ_2 · L_silhouette

# 其中：
# L_geometric: 几何监督损失（基于 DSM）
# L_shadow: 可微阴影损失
# L_silhouette: 可微轮廓损失
```

---

## 代码片段

```cpp
// 伪代码：TreeON 推理流程
PointCloud TreeONReconstruct(Image orthophoto, HeightMap DSM) {
    // 1. 特征提取
    auto visual_features = VisualEncoder(orthophoto);
    auto height_features = HeightEncoder(DSM);
    
    // 2. 特征融合
    auto combined_features = FusionModule(visual_features, height_features);
    
    // 3. 点云生成
    auto point_cloud = PointCloudDecoder(combined_features);
    
    return point_cloud;
}
```

---

## 实验结论

- **数据集**: 合成程序化树木数据集 + 真实世界数据
- **基线**: 现有树木重建方法
- **结果**: 
  - 重建质量和覆盖率优于现有方法
  - 对真实世界数据泛化良好
  - 生成结构合理的树点云

---

## 局限性

- 依赖卫星/航空影像质量
- 可能无法捕捉树下植被细节
- 对极端树木形态可能有限制

---

## 相关工作

- [[Point-Cloud-Reconstruction]] - 点云重建
- [[Neural-Radiance-Fields]] - 神经辐射场
- [[Procedural-Vegetation]] - 程序化植被生成
- [[Satellite-Image-Processing]] - 卫星影像处理

---

## 实现建议

- **实现难度**: 中等
  - 代码已开源
  - 需要合成数据集训练
- **预期性能**: 适合离线处理，实时性需评估
- **适用场景**: 
  - 数字孪生城市
  - 地理信息系统（GIS）
  - 游戏/虚拟环境植被建模

---

## 与渲染的关系

虽然本文主要关注重建，但对渲染有重要意义：
- 为大规模植被场景提供真实 3D 数据
- 可与 LOD 系统结合实现高效渲染
- 为实例化渲染提供多样化树木模型

---

## 资源

- **项目主页**: https://angelikigram.github.io/treeON/
- **代码**: 开源可用
- **数据集**: 合成数据集已发布
- **预训练模型**: 已提供

---

## 标签

#渲染 #点云 #神经重建 #植被 #卫星影像 #2026

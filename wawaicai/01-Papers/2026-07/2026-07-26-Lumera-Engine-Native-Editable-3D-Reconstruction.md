---
type: paper
created: 2026-07-26
updated: 2026-07-26
tags: [paper, 3D-reconstruction, scene-parsing, parametric-lighting, editable]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.20889
---

# Lumera: Engine-Native Editable 3D World Reconstruction with Objects and Lighting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Engine-Native Editable 3D World Reconstruction with Objects and Lighting |
| **作者** | (Multiple authors from research institutions) |
| **发表** | arXiv (2026-07-25) |
| **链接** | [原文](https://arxiv.org/abs/2607.20889) |

---

## 核心贡献

> 从单张图像重建可编辑的引擎原生 3D 场景，包含物体实例和参数量光源

1. **Lumera-2K 数据集**: 2,513 UE5 项目，3.73M 组件，63M 实例，102.6K 光源
2. **Engine-Native 表示**: 可导入 Blender/UE5 的物体和光源
3. **Lumera-Box**: VLM 解析物体 3D 边界框
4. **Lumera-Light**: VLM 解析参数量光源 (位置、颜色、强度)
5. **Generator/Verifier 循环**: VIGA 启发的几何编辑优化

---

## 技术方案

### 核心思想

现有单图像方法只能生成房间尺度几何或全局光照，无法输出可编辑实体。Lumera：
- 解析物体边界框和参数量光源
- 重建 per-object mesh
- 估计 HDR 环境
- 组装可编辑场景

### 关键技术

| 技术 | 说明 |
|------|------|
| VLM | 视觉语言模型用于场景解析 |
| SAM3D | 物体 mesh 重建 |
| Parametric Lights | 引擎原生点/聚/矩形/方向光源 |
| HDR Environment | 高动态范围环境估计 |

---

## 实验结论

- **mAP**: ↑0.1141
- **IoU-B**: ↑0.2472
- **F-score**: ↑0.2762
- **光源召回率**: 0.998

---

## 相关工作

- [[Engine-Native]] #scene-reconstruction #parametric-lighting #VLM

---

## 知识点

- #3D-reconstruction #scene-parsing #editable-scenes #parametric-lighting #engine-native

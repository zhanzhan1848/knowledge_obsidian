---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, gaussian-splatting, human-reconstruction, real-time, animation]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.10259
---

# Real-Time Human Reconstruction and Animation using Feed-Forward Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Human Reconstruction and Animation using Feed-Forward Gaussian Splatting |
| **作者** | Devdoot Chatterjee et al. |
| **发表** | arXiv cs.CV/cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.10259) |
| **代码** | [GitHub](https://github.com/Devdoot57/HumanGS) |

---

## 核心贡献

> 提出可泛化的前馈高斯散点框架，用于人体 3D 重建和实时动画

1. 从多视角 RGB 图像和 SMPL-X pose 直接预测规范姿势下的 3D 高斯基元
2. 每个 SMPL-X 顶点关联一个高斯，提供强几何先验和稳定对应
3. 额外一小组不受约束的高斯捕获偏离参数曲面的几何结构（服装、头发）
4. 通过线性混合蒙皮实现高效动画，无需进一步网络评估

---

## 技术方案

### 核心思想

与依赖深度监督、固定输入视角、UV 图或重复前馈推理的先前方法不同，本方法从单次前向传递产生可动画人体表示。通过将高斯基元与 SMPL-X 顶点明确关联，重建模型可通过线性混合蒙皮高效动画。

### 关键创新

| 创新 | 说明 |
|------|------|
| SMPL-X 顶点关联高斯 | 提供强几何先验和参数人体模型对应 |
| 表面约束高斯 | 靠近 SMPL-X 表面，提供稳定对应 |
| 非表面高斯 | 捕获服装、头发等偏离曲面的结构 |
| 单次前馈推理 | 无需重复网络推理即可合成新 pose |

---

## 实验结论

- **数据集**: THuman 2.1, AvatarReX, THuman 4.0
- **质量**: 重建质量与最先进方法相当
- **速度**: 唯一支持实时动画和交互应用的方法
- **优势**: 一次前馈即可产生可动画表示

---

## 相关工作

- [[Gaussian Splatting]]
- [[Human Digitization]]
- [[SMPL-X]]
- [[Real-time Rendering]]
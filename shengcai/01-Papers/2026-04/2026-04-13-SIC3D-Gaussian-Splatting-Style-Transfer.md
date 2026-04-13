---
type: paper
created: 2026-04-13
updated: 2026-04-13
tags: [paper, 3DGS, style-transfer, text-to-3D, rendering, arxiv]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.08760
---

# SIC3D: Style Image Conditioned Text-to-3D Gaussian Splatting Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SIC3D: Style Image Conditioned Text-to-3D Gaussian Splatting Generation |
| **作者** | Ming He, Zhixiang Chen, Steve Maddock |
| **发表** | arXiv cs.CV, 2026-04-13 |
| **链接** | [原文](https://arxiv.org/abs/2604.08760) |
| **DOI** | 10.48550/arXiv.2604.08760 |

---

## 核心贡献

> 首个基于图像条件控制3D Gaussian Splatting风格的框架，通过两阶段pipeline实现高效可控的风格迁移

1. **两阶段框架**：先从文本生成几何一致的3DGS，再进行风格迁移
2. **VSSD Loss**：Variational Stylized Score Distillation，有效捕捉全局和局部纹理
3. **尺度正则化**：防止几何-纹理不一致导致的伪影

---

## 技术方案

### 核心思想

将几何构建和外观风格分离，避免联合优化中的纠缠问题。第一阶段使用VSD获得稳定的3DGS表示，第二阶段使用VSSD注入图像风格信息。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian Splatting | 高效可微渲染表示 |
| VSD (Variational Score Distillation) | 阶段一的几何生成 |
| VSSD (Variational Stylized Score Distillation) | 阶段二的风格迁移 |
| IP-Adapter | 图像条件处理器，提取风格特征 |
| Scaling Regularization | 防止Gaussian伪影 |

### 公式

#### Score Distillation Sampling (SDS)

```math
L_SDS = E[ω(t)‖ε^φ(z_t; y, t) - ε‖²]
```

#### Variational Stylized Score Distillation (VSSD)

```math
L_VSSD(o) := E[ω(t)(ε^φ(z_t; y, t, s) - ε^ψ(z_t; y, t, c))]
```

---

## 实验结论

- **数据集**: 多种文本-图像对
- **基线**: 现有text-to-3D和stylization方法
- **结果**: 在几何保真度和风格一致性上优于prior方法

---

## 局限性

- 需要预训练的文本到3D模型
- 风格迁移程度受IP-Adapter scale影响

---

## 相关工作

- [[DreamFusion]] - SDS优化
- [[GaussianDreamer]] - 3DGS文本生成
- [[TRELLIS]] - 高质量3D生成
- [[IP-Adapter]] - 图像条件控制

---

## 实现建议

- **实现难度**: 中等（基于现有3DGS框架）
- **预期性能**: 高效的风格化3D生成
- **适用场景**: 游戏资产风格化、3D内容创作

---

## 标签

#3DGS #风格迁移 #文本到3D #渲染 #2026

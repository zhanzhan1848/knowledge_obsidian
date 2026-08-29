---
type: paper
created: 2026-08-29
updated: 2026-08-29
tags: [texture-mapping, UV-parametrization, geometry-texture, mesh-texturing, reference-guided]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.25461
---

# Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill |
| **作者** | (待补充 - arXiv:2608.25461) |
| **发表** | arXiv cs.GR (2026-08-27) |
| **链接** | [原文](https://arxiv.org/abs/2608.25461) |
| **项目页** | https://chenyuecai.github.io/gloss-page/ |

---

## 核心贡献

> 利用几何自相似性和几何-纹理相关性，实现精确遵循几何细节的参考引导纹理填充

1. **几何感知参考补丁机制**: 利用几何自相似性，训练形状特定局部纹理生成模型
2. **无需微调/显式网格变形**: 无需额外微调、无显式网格变形、无额外训练数据
3. **局部几何条件纹理修复**: 支持艺术家选择的参考引导局部几何条件纹理修复，泛化到 PBR 材质和未见网格

---

## 技术方案

### 核心思想

现有条件图像生成方法可对现有 3D 形状探索多种单视图外观，但生成完整纹理时仍难以同时：
- 紧密遵循细尺度几何细节
- 保持单视图参考一致性

本文方法探索**局部、数据需求量少的纹理方法**，具有显式艺术家控制。

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何自相似性 | 许多自然/人造形状的几何自相似性 |
| 几何-纹理相关性 | 几何自相似性 → 纹理迁移 |
| 形状特定网络 | 从单 3D 形状学习的纹理生成模型 |
| 补丁级修复 | Patchwise inpainting 转移参考纹理 |

---

## 实验结论

- 纹理质量优于或可比于强图像条件纹理生成基线
- Blender 插件形式已有 3D 纹理专业人员给出积极反馈
- 实用性、创意支持、可控性得到验证

---

## 局限性

- 依赖特定形状训练的模型，跨类别泛化受限
- 复杂几何细节的纹理传递精度有限

---

## 实现建议

- **实现难度**: 中 — 需图像模型先验 + 几何特征提取
- **预期性能**: 局部纹理填充质量高，艺术家控制力强
- **适用场景**: 游戏/电影纹理制作、数字资产生成、纹理修复
- **开源参考**: Blender API、预训练图像扩散模型

---

## 相关工作

- [[ExMesh++]] - UV-PBR 材质优化
- [[SeamGen-UV-Seam-Generation]] - UV 接缝生成
- [[OT-UVGS-Capacity-Allocation]] - UV 空间容量分配

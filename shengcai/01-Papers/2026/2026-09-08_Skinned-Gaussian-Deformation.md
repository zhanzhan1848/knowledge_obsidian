---
type: paper
created: 2026-09-08
updated: 2026-09-08
tags: [paper, rendering, 3dgs, deformation, skinning, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.05127
---

# Differentiable Weights for Skinned Gaussian Splat Deformation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Weights for Skinned Gaussian Splat Deformation |
| **作者** | Nina Vesseron 等 |
| **发表** | arXiv (Under review) |
| **链接** | [原文](https://arxiv.org/abs/2609.05127) |
| **DOI** | 10.48550/arXiv.2609.05127 |

---

## 核心贡献

> 使用 skinning weights 空间梯度为 Gaussian Splats 提供完整无网格变形管道

1. 利用 skinning weights 空间梯度防止拉伸时产生孔洞
2. 完全兼容实时渲染能力
3. 可选的自适应重采样方案处理仍有问题的情况

---

## 技术方案

### 核心思想

骨骼变形通过较粗运动结构（rig）将 3D 形状从 rest pose 转换为动态 pose。对于 3D 网格，rig 只需位移顶点变形多边形。但对于 3D Gaussian Splats，由于没有连接信息，刚性变换点不足以防止拉伸时产生孔洞。

### 关键技术

| 技术 | 说明 |
|------|------|
| 空间梯度 skinning weights | 提供无网格变形管道 |
| 自适应重采样 | 分裂仍有伪影的 splats |

---

## 实验结论

- 在 WebGL 查看器中演示实时渲染能力
- 更准确地拉伸 splats

---

## 局限性

- 需要用户创建 rig 结构
- 自适应重采样增加计算开销

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 实时性能
- **适用场景**: 角色动画、虚拟形象

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[骨骼变形]]
- [[实时渲染]]

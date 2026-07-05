---
tags: [渲染, 3DGS, 内在分解, PBR]
date: 2026-07-05
status: 新论文
---

# Intrinsic Decomposition and Editing of 3D Gaussian Splats

## 元信息

| 标题 | 值 |
|------|-----|
| 作者 | George Drettakis et al. |
| 链接 | [arXiv:2606.31637](https://arxiv.org/abs/2606.31637) |
| DOI | [10.1145/3804495](https://doi.org/10.1145/3804495) |
| 期刊 | Proc. ACM Comput. Graph. Interact. Tech. 9, 1, Article 10 (May 2026) |

## 核心贡献

1. **3DGS固有分解**: 将颜色分解为漫反射albedo和shading（+视图相关残差）
2. **独立高斯原语集**: 每层独立建模，适应各自特征
3. **数据驱动优化**: 引导固有集 disentanglement
4. **编辑工作流**: 用户只需修改单张图像albedo，自动传播到整个场景

## 技术方案

### 核心问题
内在分解（albedo × shading）在图像编辑中历史悠久，但扩展到3DGS面临挑战：
- 如何建模独立的高斯原语集
- 如何从多视图 disentangle
- 如何支持编辑

### 方法框架
```python
# 独立高斯集
albedo_gaussians = GaussianSet()  # 漫反射层
shading_gaussians = GaussianSet()  # 光照层
residual_gaussians = GaussianSet()  # 视图相关残差

# 数据驱动引导的优化
for view in multi_view_photos:
    loss = reconstruction_loss(view, decompose(view))
    loss += intrinsic_prior_loss()  # 固有先验
```

### 编辑工作流
1. 用户修改某图像的albedo
2. 修改被捕获到固有辐射场
3. 任意视角重新渲染，保留合理光照

## 关键创新

| 创新 | 描述 |
|------|------|
| 独立原语集 | albedo/shading层独立优化 |
| 数据驱动 disentanglement | 多视图监督分离 |
| 单图编辑传播 | 编辑一张，自动全局更新 |

## 评估

- ✅ 支持任意视角重新渲染
- ✅ 编辑一致性
- ✅ PBR兼容的固有分解

## 标签

#3DGS #固有分解 #编辑 #PBR #材质

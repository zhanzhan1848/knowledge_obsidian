---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, transformer, neural-rendering, differentiable-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.05593
arxiv_id: 2611.05593
---

# GaussianRenderFormer: Transformer-based Rendering of 3D Gaussian Splats

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GaussianRenderFormer: Transformer-based Rendering of 3D Gaussian Splats |
| **作者** | Shahaf Valencia Levy, Sagie Benaim |
| **发表** | arXiv cs.CV / cs.GR / cs.LG, 2026-11-03（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.05593) |
| **项目页** | [https://svlwoof.github.io/gaussianrenderformer](https://svlwoof.github.io/gaussianrenderformer) |
| **代码** | 项目页提供代码、训练模型与视频 |

---

## 核心贡献

> 神经网络能否**不依赖光栅化器**、直接学会渲染 3D 高斯？

1. **Transformer 直出图像**：输入一组高斯 + 相机，**直接输出图像**，渲染器中没有任何光栅化器。
2. **视图无关编码器**：每个高斯成为一个 token。
3. **视图相关解码器**：把相机光线的小块（patches）映射为像素，通过对这些 token 做注意力实现。
4. **诚实的差距诊断**：38.08 dB（transformer）vs 44.02 dB（光栅化器，同一剪枝输入）——**差距不是泛化问题，而是视图解码器的瓶颈**。

---

## 技术方案

### 核心思想

传统 3DGS 渲染 = 排序 + alpha blending（光栅化器）。本文问：能不能用 Transformer 端到端替代？

架构：
- **视图无关编码器**：每个高斯 → 一个 token（与相机无关）
- **视图相关解码器**：相机光线的 patch → 像素，通过对高斯 token 的注意力加权

诊断很关键：告诉解码器每个高斯的**投影足迹**（它本来可以自己推断出来）能 **+1.4 dB**——说明瓶颈在解码器的信息通路，不在训练数据泛化。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Per-Gaussian Token 编码器** | 视图无关，每个高斯一个 token |
| **Ray-Patch 解码器** | 视图相关，光线小块 → 像素 |
| **Cross-Attention** | 解码器对高斯 token 做注意力 |
| **剪枝至 20,000 高斯** | 训练用 Objaverse 26,820 个物体，各剪枝到 20,000 高斯 |

### 公式

```math
// 视图无关编码器
E = [e_1, e_2, ..., e_N] = Encoder({g_1, ..., g_N})     // g_i 为第 i 个高斯

// 视图相关解码器：光线 patch 查询高斯 token
p = Decoder(RayPatch(camera, pixel_block), E)           // cross-attention
```

---

## 代码片段

```python
# 架构（语义伪代码）
class GaussianRenderFormer(nn.Module):
    def __init__(self):
        self.encoder = ViewIndependentEncoder()   # 每个高斯 -> 1 token
        self.decoder = ViewDependentDecoder()     # ray patch -> pixel

    def forward(self, gaussians, camera):
        # 1) 视图无关编码（每个高斯一个 token）
        tokens = self.encoder(gaussians)            # [N, d]

        # 2) 视图相关解码：相机光线切成 patch，逐 patch 出像素
        ray_patches = camera.make_ray_patches()     # [P, d_r]
        out = self.decoder(ray_patches, tokens)     # cross-attention
        return out.reshape(camera.image_size)
```

---

## 实验结论

- **数据集**: **Objaverse 26,820 个物体**，每个剪枝到 **20,000 高斯**；评测 300 个未见物体
- **基线**: 光栅化器渲染**同一份剪枝后的高斯**
- **结果**:
  - **GaussianRenderFormer: 38.08 dB PSNR**（300 个未见物体）
  - **光栅化器（同剪枝输入）: 44.02 dB**
  - **差距 ≈ 5.94 dB**，且**不是泛化问题**
  - **诊断**：告诉视图解码器每个高斯的投影足迹 → **+1.4 dB**，说明瓶颈在视图解码器的信息通路
  - 作者说明**训练不足（under-training）未被排除**
- **产出**: 代码、训练模型、视频均已公开

---

## 局限性

- 与光栅化器有 **5.94 dB 的显著差距**，实用性存疑
- 论文自身承认：视图解码器存在信息瓶颈；且**未排除欠训练**这一可能解释
- 剪枝到 20,000 高斯本身已损失质量（对比的是剪枝后的光栅化器基线）
- 预印本，未见同行评审

---

## 相关工作

- [[2026-04-29_Unifying-Real-Time-Differentiable-Ray-Tracing-and-Rasterization]]
- [[2026-04-28_Distance-Field-Rasterization-for-End-to-End-Mesh-Reconstruction]]
- 概念：[[3D高斯泼溅]], [[Transformer渲染]], [[可微渲染]], [[注意力机制]]

---

## 实现建议

- **实现难度**: 中（标准 Transformer + 相机光线 patch 构造）
- **预期性能**: 学术价值 > 工程价值；当前 38 dB 仍低于光栅化器 6 dB
- **适用场景**: 学习型渲染研究、端到端可微管线探索；**不适合作为生产渲染器**
- **与团队的关系**: 论文的**诊断方法**（给解码器喂投影足迹看增益多少）是一个很好用的分析范式，可用于团队自己的可微渲染实验。建议 @墨鱼丸 参考这个"信息瓶颈诊断"技巧
- **优先级**: 低（工程落地价值有限，但诊断思路值得借鉴）

---
tags: [渲染, 3DGS, 高分辨率, 前馈网络]
date: 2026-04-09
status: 待读
---

# Less Gaussians, Texture More: 4K Feed-Forward Textured Splatting

## 元信息
| 标题 | Less Gaussians, Texture More: 4K Feed-Forward Textured Splatting |
| 作者 | Yixing Lao et al. (Apple Research) |
| 链接 | [arXiv](https://arxiv.org/abs/2603.25745) |
| 领域 | 3D Gaussian Splatting, High-resolution rendering, Feed-forward synthesis |
| 提交日期 | 2026-03-26 |

## 核心贡献
1. 解决前馈 3DGS 方法中高斯数量随分辨率二次增长的问题
2. 提出双网络架构:解耦几何参数预测和 per-primitive 纹理预测
3. 实现 4K novel view synthesis,无需 per-scene optimization
4. 大幅减少 Gaussian primitives 数量

## 技术方案

### 问题定义
现有前馈 3DGS 方法预测 pixel-aligned primitives,导致 primitive 数量随分辨率二次增长,使得 4K 等高分辨率合成不可行。

### 核心思想
LGTM 通过预测紧凑的高斯 primitives 加上 per-primitive textures,解耦几何复杂度与渲染分辨率。

### 架构组成
1. **Sparse Gaussian Predictor**: 
   - 输入:多视角图像
   - 输出:紧凑的 3D Gaussian primitives (position, scale, rotation, opacity)
   - 关键:primitive 数量远小于像素数

2. **Texture Predictor**:
   - 为每个 Gaussian primitive 生成小型纹理图(如 16×16 RGB)
   - 负责外观细节

### 关键公式
```math
\text{Geometry} = f_{\theta}(I_{multi-view}) \rightarrow \{ \mu, \Sigma, q, \alpha \}
\text{Texture} = g_{\phi}(I_{multi-view}, \text{Geometry}) \rightarrow \{ T_i \}
```

## 实验结论
- 在 RealEstate10K 数据集上验证
- 支持 4K 分辨率下的高质量 novel view synthesis
- 相比 baseline 3DGS/2DGS 大幅减少 primitive 数量

## 相关链接
- [Project Page](https://yxlao.github.io/lgtm/)
- [arXiv HTML](https://arxiv.org/html/2603.25745v1)

---

#标签 #3DGS #高分辨率 #前馈网络 #Apple #2026-03

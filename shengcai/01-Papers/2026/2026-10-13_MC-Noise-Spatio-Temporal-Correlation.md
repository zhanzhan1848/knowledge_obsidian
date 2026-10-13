---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, monte-carlo, denoising, temporal, siggraph-asia, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.11653
---

# Monte Carlo estimation of unit-variance noise with controlled spatio-temporal correlation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Monte Carlo estimation of unit-variance noise with controlled spatio-temporal correlation |
| **作者** | Chen Liu et al. |
| **发表** | SIGGRAPH Asia 2026 Conference Papers |
| **链接** | [原文](https://arxiv.org/abs/2610.11653) |
| **DOI** | 10.48550/arXiv.2610.11653 |
| **代码** | [GitHub](https://github.com/facebookresearch/Tabula-Rasa) |

---

## 核心贡献

> 用 sketching 数据库文献思想，**同时**估计像素重建与方差，得到具有可控时空相关性与单位方差的时间变化高斯噪声。

1. **Joint Monte-Carlo 估计** — 一次采样同时输出像素重建与方差估计。
2. **Sketching 视角** — 借鉴数据库 sketch 算法，把方差估计视为次级 sketch。
3. **可控时空相关性** — 简单快速代码即可生成时间相关噪声，用于 temporal control。

---

## 技术方案

### 核心思想

> 时间变化噪声在 many downstream tasks 中用于 temporal control 与 coherence。核心问题：如何精准控制方差与时间相关度。答案：将方差估计视为和像素重建并列的 sketch 问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| Sketching-based 方差估计 | 数据库 sketch 类推到 MC 估计 |
| 单位方差控制 | 输出严格单位方差 |
| 时空相关控制 | 框架内参数化设置 |
| Joint MC | 单次采样同时重建 + 估计方差 |

---

## 公式

```math
z_t(x, y) \sim \mathcal{N}(\mu, 1)  \quad \text{with temporal correlation } \rho(\Delta t)
\hat{\sigma}^2 = \text{sketch}(\text{joint samples})
```

---

## 代码片段

```python
# 概念伪代码
def joint_estimate(pixel_samples):
    pixel = pixel_samples.mean()
    variance_estimate = sketch_variance(pixel_samples)
    noise = (pixel_samples[-1] - pixel) / sqrt(variance_estimate)
    return pixel, noise  # 单次调用同时拿到
```

---

## 实验结论

- **应用**: temporal denoising, temporally stable post-processing
- **基线**: 现有 temporal noise 生成方法
- **结果**:
  - 代码更简单、更快
  - 方差控制更精确
  - 时空相关性可控
- **代码已开源**

---

## 局限性

- 主要面向 temporal 控制场景，spatial 应用受相关模型限制
- Sketching 内存开销与所需精度相关
- 不替代专用 temporal denoiser

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 作为降噪流水线前端的噪声注入方案候选
- 实时渲染: temporal reprojection, TAAU 等都可受益
- 代码已开源 (facebookresearch/Tabula-Rasa)

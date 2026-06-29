---
title: Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion
authors: Carlos Aliaga et al.
date: 2026-06-25
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.27604
pdf: https://arxiv.org/pdf/2606.27604
tags: [rendering, paper, 2026, path-tracing, subsurface-scattering, skin, PBR]
status: unread
---

# Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion |
| 作者 | Carlos Aliaga et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.27604) |
| PDF | [下载](https://arxiv.org/pdf/2606.27604) |

## 核心贡献
1. 提出从单张RGB漫反射反照率预测完整光谱皮肤散射参数的框架
2. 提出混合介质（Mixture-of-Media）表示方法，用三种不相关介质近似皮肤多层结构
3. 设计链式神经解码器，将RGB映射到各向异性、散射半径和散射反照率

## 技术方案
皮肤是复杂多层介质，外观由生物物理色基混合物决定。当前方法依赖介质均匀化，通过反照率反演获取光学参数，需人工调整散射距离和各向异性参数，导致大量艺术劳动力投入且散射轮廓不准确。

**方法流程：**
1. 训练链式神经解码器：从RGB漫反射反照率预测完整光谱皮肤散射参数
2. 混合介质表示：用三种不相关介质的聚合散射近似皮肤多层结构
3. 随机游走路径追踪器：根据概率随机选择要穿越的介质类型

```python
# 核心思想：混合介质选择
def select_medium(scattering_params):
    # 根据预测的光学属性随机选择介质
    medium_type = random_select(probs=scattering_params.mixture_weights)
    return scattering_params.media[medium_type]
```

## 实验结论
- 方法可直接用于随机游走路径追踪器，只需极小修改
- 比传统手动调整方法更准确且减少艺术家劳动

## 局限性
- 需要针对皮肤材质训练，对其他材质需要重新训练
- 依赖RGB输入质量

## 可行性分析
- 实现难度：中（需训练神经解码器，整合到现有路径追踪器）
- 性能预期：实时皮肤渲染质量提升
- 适用场景：影视渲染、游戏角色皮肤

## 相关工作
- [[path-tracing-survey]]
- [[subsurface-scattering-techniques]]

## 笔记
皮肤渲染是PBR重要方向，此工作将生物物理模型与深度学习结合，提升真实感同时减少人工调整成本。
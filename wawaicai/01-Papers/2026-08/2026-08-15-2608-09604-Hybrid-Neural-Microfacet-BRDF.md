---
tags: [渲染, BRDF, 神经渲染, 实时光照]
---

# A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering

## 论文信息
- **arXiv**: [2608.09604](https://arxiv.org/abs/2608.09604) [cs.GR]
- **作者**: Louis De Oliveira et al. (Ubisoft La Forge)
- **提交日期**: 2026-08-10
- **会议**: Eurographics Symposium on Rendering (EGSR) 2026
- **DOI**: https://doi.org/10.1111/cgf.70540
- **Project**: https://ubisoft-laforge.github.io/world/hybridrdf

## 核心方法

### 问题定义
Microfacet BRDF模型广泛用于实时光照渲染，但难以复现复杂光-表面交互的细微外观效果。专用物理模型失去通用性，神经模型太大无法实时渲染。

### 核心创新
**混合模型**：将GGX型microfacet模型与神经模型结合

架构：
```
Microfacet基础 → 神经校正分量
```

- 神经分量修正microfacet近似的外观
- 网络比现有神经模型小得多
- 相同内存下，比SOTA神经模型更好地近似测量数据
- **低评估开销**：与microfacet模型相比仅少量额外开销

### 关键优势
1. ✅ 艺术家友好，易编辑
2. ✅ 重要性采样方案
3. ✅ 适合离线渲染和实时光照
4. ✅ 兼顾精度与性能

## 实验结果
- 相同内存成本下，优于SOTA神经模型
- 低评估开销（相比纯microfacet）
- EGSR 2026发表

## 几何处理相关性
⚠️ **低相关性** — 渲染/光照模型，不直接涉及几何处理算法。

## 关键词
`BRDF` `神经渲染` `Microfacet` `实时光照` `EGSR 2026` `混合模型`

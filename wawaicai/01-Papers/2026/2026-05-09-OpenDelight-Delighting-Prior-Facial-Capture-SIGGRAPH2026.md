---
tags: [几何, 人脸, 外观捕捉, 去光照, SIGGRAPH2026]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: ACM Transactions on Graphics (SIGGRAPH 2026)
---

# Learning a Delighting Prior for Facial Appearance Capture in the Wild

## 核心方法

**OpenDelight** - 将范式从模型逆渲染转变为训练强大的去光照网络作为先验。

### 技术创新
1. **Dataset Latent Modulation (DLM)**: 无缝集成异构数据源（OLAT 数据集 + Light Stage 扫描）
2. **Source-aware Tokens**: 学习性 source-aware token 解耦数据集特定风格与物理去光照原理
3. **NeRSemble-Scan**: 4K 分辨率可重光照扫描的大规模集合

### Pipeline
```
手机视频输入 → 去光照先验约束的逆渲染 → 高质量反射率估计
```

## 与 Prior Arts 对比
- 大幅超越现有方法
- 仅需 casual video 输入

## 开源
- 代码：https://github.com/yxuhan/OpenDelight
- 数据集：NeRSemble-Scan
- 模型：开源

## 算法复杂度
- 时间复杂度：每帧 O(N) 逆渲染优化
- 空间复杂度：O(N) 高分辨率纹理

## 创新点
- 首个开源 delighting prior 用于人脸外观捕捉
- DLM 异构数据无缝融合
- 4K 分辨率可重光照扫描数据集

## 可行性分析
- ✅ 可推荐实现（已有开源代码）
- 难度：中
- 数值稳定性：先验约束使优化更稳定
- 依赖：OLAT + Light Stage 数据

## 相关笔记
[[人脸重建]]
[[神经渲染]]

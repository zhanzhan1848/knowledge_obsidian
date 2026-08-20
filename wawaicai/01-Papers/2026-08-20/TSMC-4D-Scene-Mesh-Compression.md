---
title: "TSMC: Time-varying 4D Scene Mesh Compression"
authors: ["Guodong Chen", "Libor Váša", "Amrita Mazumdar", "Mallesham Dasari"]
date: 2026-07
tags: [几何, 网格压缩, 4D, 时变网格, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #414"
---

# TSMC: Time-varying 4D Scene Mesh Compression

## 核心方法

本文提出**时变4D场景网格压缩算法**。

### 核心创新点

1. **时序一致性**: 利用时间维度的相关性
2. **几何压缩**: 高效压缩网格几何信息
3. **拓扑压缩**: 同时压缩网格拓扑
4. **渐进式编码**: 支持渐进式传输和解码

### 技术框架

```
4D Mesh → 时空分析 → 预测编码 → 熵编码 → 压缩流
```

## 应用场景

- 动态场景捕捉
- 4D人体/表情重建
- 物理模拟记录
- VR/AR内容传输

## 开源实现

- libigl: `decimate`, `quantize`
- Draco: 网格压缩

## 几何相关性

✅ **高相关**: 网格处理核心问题
- 网格简化
- 网格编码
- 时变几何

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐ 中等 |
| 实用价值 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

时变网格压缩对实时几何应用很重要，特别是在流媒体和实时传输场景。

## 相关笔记
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*

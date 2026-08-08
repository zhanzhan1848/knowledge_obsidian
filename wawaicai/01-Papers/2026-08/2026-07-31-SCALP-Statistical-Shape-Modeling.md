---
tags: [几何, 统计形状模型, 点云, 医学图像]
created: 2026-07-31
subject: cs.CV
---

# SCALP: Semi-Supervised Statistical Shape Modeling from Imperfect 3D Photogrammetry

## 核心方法

**SCALP** 是一个两阶段框架，从原始、有缺陷的表面扫描构建一致的形状模型。

### 应用场景

- 婴儿颅缝早闭的客观、无辐射头部形状分析
- 临床摄影测量扫描通常有噪声、不完整、有杂物

### 解决方案

**Stage 1: 半监督 Landmark Localization**
- 使用半监督 Point Transformer
- 结合少量专家标注数据和大量无标注队列
- 准确局部化颅颌面标志点，最小化标注开销

**Stage 2: Landmark-Anchored Spectral Warping**
- 这些标志点锚定解剖模板的 Laplace-Beltrami 谱变形
- 生成密集对应关系
- 自然隔离颅骨与周围扫描杂物，无需人工预处理

### 核心创新

1. **半监督学习**: 利用少量标注 + 大量无标注数据
2. **谱变形**: 基于 Laplace-Beltrami 算子的形状变形
3. **自动隔离**: 自然分离颅骨和外围杂物

## 实验验证

- 在婴儿摄影测量扫描上测试
- 持续优于 SOTA 无监督点云方法
- 提供临床实用、无辐射的头部形状分析途径

## 可行性评估

✅ **推荐关注**

- 医学图像几何处理的优秀案例
- 半监督 + 谱方法结合值得借鉴
- 对有噪声、不完整点云的处理有参考价值

📝 **相关技术**: Laplace-Beltrami 算子、Point Transformer、谱形状分析

---
tags: [几何, 有限元, 网格变形, 模拟]
date: 2026-07-27
source: arXiv cs.GR
arXiv: 2607.22103
---

# Curly Hair Simulation using Curly Finite Elements

## 核心方法

本文提出 **Curly Finite Elements** 用于卷曲头发的物理模拟。

### 关键创新点

1. **Curly Elements 分解**
   - Rod-base configuration（基结构）
   - 解析高频皱纹：平面波或体积螺旋
   - 波状头发：弯曲主导；螺旋头发：扭转主导

2. **能量分裂 (Curvature-Energy Splitting)**
   - 分离拉伸、屈曲、弯曲贡献
   - 高效能量近似 → 数值鲁棒性 + 降低计算成本

3. **混合碰撞处理**
   - 粗粒代理碰撞 + 高频细节解析处理
   - Guide-strand 插值适配 Curly FE 表示

### 技术框架
```
Strand → Curly Elements (rod + wrinkles)
    ↓
弯曲/扭转 能量分裂
    ↓
混合碰撞处理
    ↓
变形模拟
```

## 核心公式

- **波状头发**: 平面波皱纹 + 弯曲能量
- **螺旋头发**: 体积螺旋 + 扭转能量
- **Curvature-energy splitting**: 分离各能量项

## 复杂度分析

- **时间**: 高效（相比传统方法）
- **空间**: O(n) elements
- **数值稳定性**: 高（能量分裂方案）

## 可行性评估

✅ **推荐关注**

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 中 |
| 数值稳定性 | 高 |
| 实现难度 | 中 |
| 实用价值 | 高（毛发模拟）|

### 开源参考
- 作者: Zhendong Wang
- 领域: 物理模拟、有限元方法

## 传递给 @墨鱼丸

本文的 Curly Finite Element 思想可应用于：
- 细条状物体模拟（毛发、布料须、触角）
- 能量分裂的数值稳定性技巧
- 层次化细节表示

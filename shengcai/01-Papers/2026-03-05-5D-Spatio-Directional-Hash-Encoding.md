---
type: paper
created: 2026-03-11
updated: 2026-03-11
tags: [paper, neural-rendering, path-guiding, hash-encoding, neural-radiance]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.05079
---

# A 5D Spatio-Directional Hash Encoding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Positional Encoding: A 5D Spatio-Directional Hash Encoding |
| **作者** | Sébastien Speierer |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.05079) |
| **DOI** | 10.48550/arXiv.2603.05079 |
| **PDF** | https://arxiv.org/pdf/2603.05079 |

---

## 核心贡献

> 提出一种新的 5D 空间-方向神经编码，支持空间和方向域的全频信号，在神经路径引导中方差降低效果提升 2 倍。

1. **方向域哈希编码**：将 Müller et al. [2022] 的哈希网格方法推广到方向域，使用层次测地网格编码方向
2. **5D 编码**：结合空间和方向编码，提出五维编码用于空间-方向信号
3. **神经路径引导应用**：在相同采样数下，方差降低比现有技术优 2 倍

---

## 技术方案

### 核心思想

传统可学习编码（如 hash grid）专注于笛卡尔正交空间，直接应用于方向域会产生扭曲、奇点和不连续。本文提出使用**层次测地网格（hierarchical geodesic grid）**编码方向，每个顶点存储可学习的潜在参数。

### 关键技术

| 技术 | 说明 |
|------|------|
| 测地网格方向编码 | 用层次化测地网格顶点存储方向特征，避免球面扭曲 |
| 5D Spatio-Directional 编码 | 空间 3D + 方向 2D 的统一编码框架 |
| Hash Grid 推广 | 将 InstantNGP 的哈希编码推广到球面方向 |

---

## 公式

```math
# 方向编码核心思想
# 测地网格将球面划分为层次化三角形面片
# 每个顶点 v_i 存储可学习参数 θ_i
# 方向 d 通过重心插值获取编码

L(d) = ∑_i w_i(d) · θ_i

# 其中 w_i 是方向 d 在测地网格中的重心权重
```

---

## 代码片段

```cpp
// 伪代码：5D 编码查询
Vector5D spatio_directional_encoding(Point3 p, Direction3 d) {
    // 空间编码 (3D hash grid)
    auto spatial_enc = hash_grid_3d.query(p);
    
    // 方向编码 (测地网格)
    auto geodesic_cell = geodesic_grid.locate(d);
    auto bary_coords = geodesic_cell.barycentric(d);
    auto dir_enc = geodesic_cell.interpolate(bary_coords);
    
    // 拼接
    return concat(spatial_enc, dir_enc);
}
```

---

## 实验结论

- **数据集**: 多种路径追踪场景
- **基线**: 传统方向编码、球谐函数、其他 hash 方法
- **结果**: 
  - 方差降低效果比 SOTA 优 2 倍
  - 支持空间和方向域的全频信号
  - 紧凑且高效

---

## 局限性

- 测地网格的分辨率层次需要预先设定
- 对于极高频率信号可能仍需更多参数
- 主要针对路径引导，其他应用场景需进一步验证

---

## 相关工作

- [[InstantNGP-Hash-Encoding]] - Müller et al. 2022
- [[Neural-Path-Guiding]] - 神经路径引导方法
- [[Spherical-Harmonics]] - 球谐函数方向编码

---

## 实现建议

- **实现难度**: 中等
  - 需要实现测地网格数据结构
  - 哈希编码可参考 InstantNGP
- **预期性能**: 高效（支持实时/交互式应用）
- **适用场景**: 
  - 神经路径引导
  - 神经辐射缓存
  - 实时全局光照

---

## 标签

#渲染 #神经渲染 #路径追踪 #哈希编码 #方向编码 #2026

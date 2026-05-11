---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, parametrization, map-correspondence, minimal-surfaces, Ginzburg-Landau]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.02770
---

# Implicit Minimal Surfaces for Bijective Correspondences

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Implicit Minimal Surfaces for Bijective Correspondences |
| **作者** | Robin Magnet et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.02770) |

---

## 核心贡献

> 提出隐式表示连续、双射、保向的 genus-0 表面间映射的方法

1. 使用 Ginzburg-Landau 泛函最小化来优化映射畸变
2. 不需要组合式网格修改或障碍函数即可保证双射性
3. 支持界标点和界标曲线引导对应

---

## 技术方案

### 核心思想

1. 双射定义四维 product space 中的二维映射曲面
2. 映射曲面存储为复截面的零集
3. 通过最小化 Ginzburg-Landau 泛函（映射曲面面积）来优化畸变

### 关键技术

| 技术 | 说明 |
|------|------|
| 隐式表示 | 复截面零集 |
| Ginzburg-Landau 泛函 | 畸变度量 |
| 切向量场工具箱 | 纯标准工具实现 |

---

## 局限性

- 仅支持 genus-0 曲面
- 计算成本随映射分辨率增加

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 表面对应、形状匹配、纹理转移

---

## 相关工作

- [[Surface Parametrization]]
- [[Functional Maps]]
- [[Bijective Correspondence]]

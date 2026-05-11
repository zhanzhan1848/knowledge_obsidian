---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, SDF, interpolation, mesh-reconstruction, CSG]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.01919
---

# Greed for the Spheres: A Signed Distance Interpolation Method

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Greed for the Spheres: A Signed Distance Interpolation Method |
| **作者** | Oded Stein et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.01919) |

---

## 核心贡献

> 提出一种 SDF 数据插值方法，确保插值结果仍对应几何可实现的表面

1. 将 SDF 理论性质表述为硬几何约束
2. 构建高效的贪心算法进行一致性 SDF 插值
3. GPU 并行化预处理进一步加速

---

## 技术方案

### 核心思想

核心保证：插值后的 SDF 值完全一致于输入，且彼此之间一致

应用场景：
1. 全局 SDF 细化（无需 ground truth 的上采样）
2. 网格重建（从粗输入重建细节表面）
3. pseudo-SDF 修复（CSG 布尔运算结果的修复）

### 关键技术

| 技术 | 说明 |
|------|------|
| 硬几何约束 | SDF 一致性保证 |
| 贪心算法 | 高效插值 |
| GPU 并行化 | 预处理加速 |

---

## 实验结论

- **SDF 细化**: 保证与输入一致
- **网格重建**: 高度细节重建
- **pseudo-SDF 修复**: 一致性保证

---

## 局限性

- 贪心策略可能不是全局最优
- 对极端噪声输入可能不稳定

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: SDF 上采样、CSG 修复、网格重建

---

## 相关工作

- [[Signed Distance Function]]
- [[Mesh Reconstruction]]
- [[SDF Processing]]

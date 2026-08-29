---
type: paper
created: 2026-08-29
updated: 2026-08-29
tags: [mesh-generation, compositional-3D, part-decomposition, diffusion-model, text-to-3D]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.20448
---

# MultiCube: Compositional 3D Generation With Part-Level Semantic and Spatial Control

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MultiCube: Compositional 3D Generation With Part-Level Semantic and Spatial Control |
| **作者** | (待补充 - arXiv:2608.20448) |
| **发表** | arXiv cs.GR (2026-08-24) |
| **链接** | [原文](https://arxiv.org/abs/2608.20448) |

---

## 核心贡献

> 从全局文本提示 + 部分语义模式 + 空间布局生成可组合的 3D 网格对象

1. **语义+空间双控制**: 对每个部件提供独立的语义控制和空间布局控制
2. **两阶段扩散生成**: 首先生成符合模式和布局的整体网格，再分解为独立部件网格
3. **DCC 工作流兼容**: 输出为独立网格，可直接用于游戏/动画制作管线

---

## 技术方案

### 核心思想

游戏和动画中使用的数字 3D 对象通常需要可组合性 — 即分解为语义有意义的部件。现有 3D 生成方法可生成高质量组合对象，但全局条件缺乏专业创意工作流所需的部分级精确可控性。

**输入**:
- 全局文本提示
- 部分语义模式 (text schema) — 指定所需部件
- 空间布局 — 部件边界框

**输出**:
- 3D 对象组成的独立网格 (每部件一个)

**两阶段扩散**:
1. 生成符合 schema 和 layout 的单体网格
2. 将网格分解为独立部件网格

### 关键技术

| 技术 | 说明 |
|------|------|
| 语义部分控制 | 通过文本 schema 指定部件语义 |
| 空间布局控制 | 通过边界框控制部件空间位置 |
| 两阶段扩散 | 整体生成 → 部件分解 |

---

## 局限性

- 部件数量和复杂度受限
- 细粒度空间控制精度依赖 bounding box 标注质量

---

## 实现建议

- **实现难度**: 高 — 需扩散模型 + 网格处理 + 两阶段管线
- **预期性能**: 部件级控制能力强，生成质量高
- **适用场景**: 游戏资产生成、动画资产创建、工业设计
- **开源参考**: Meshy-T2, LATO.2, LGM 等 3D 生成方法

---

## 相关工作

- [[Meshy-T2-Flow-Matching-Mesh-Generation]] - 原生网格生成
- [[LATO.2-Factorized-3D-Mesh-Generation]] - 分解式 3D 网格生成
- [[SCULPT-3D-Part-Generation]] - 部件级 3D 生成

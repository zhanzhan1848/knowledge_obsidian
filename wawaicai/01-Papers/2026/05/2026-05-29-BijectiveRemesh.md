---
type: paper
created: 2026-05-29
updated: 2026-05-29
tags: [paper, remeshing, bijective-mapping, atlas, texture-transfer]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.30744
---

# BijectiveRemesh: Maintaining Bijective Mappings for Data Transfer Across Remeshed Manifolds

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BijectiveRemesh: Maintaining Bijective Mappings for Data Transfer Across Remeshed Manifolds |
| **作者** | Leyi Zhu et al. |
| **发表** | arXiv cs.GR · May 29, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.30744) |

---

## 核心贡献

> 提出在重网格化序列中维护连续双向映射的鲁棒算法，通过链式局部双射图集处理 2D 三角网格和 3D 四面体网格。

1. **双向映射维护**：在复杂重网格化序列中保持输入到输出的数学严格双向映射
2. **Shared Scaffold 结构**（2D）：通过局部方向保持强制全局双射性
3. **3D 四面体网格扩展**：基于 Steinitz 定理和 Maxwell-Cremona 提升的局部图集构建
4. **通用重网格操作支持**：边折叠、边分裂、边交换、顶点平滑

---

## 技术方案

### 核心思想

传统数据传输方法依赖插值或投影，无法保证映射的双向性（一一对应）。BijectiveRemesh 通过将整个映射表示为每个重网格化操作的局部双射图口的组合，实现数学严格的双向跟踪。

### 关键技术

| 技术 | 说明 |
|------|------|
| 局部双射图口 | 每个基元重网格操作对应一个图口，保证局部双射 |
| Shared Scaffold（2D） | 强制全局双射性的结构 |
| Steinitz定理 + Maxwell-Cremona提升（3D） | 3D四面体网格的有效嵌入保证 |
| 几何实体跟踪 | 点、曲线、曲面的精确跨重网格跟踪 |

---

## 实验结论

- **应用**: 纹理迁移、体积仿真中的数据传递
- **结果**: 
  - 无需插值/投影的精确跟踪
  - 支持边折叠、边分裂、边交换、顶点平滑
  - 适用于 2D 三角网格和 3D 四面体网格

---

## 局限性

- 计算开销较大，Shared Scaffold 的构建和维护需要额外存储
- 对于高度变形的重网格化序列，图口链的累积误差可能增加
- 3D 四面体网格上的方法复杂度显著高于 2D 情况

---

## 相关工作

- [[重网格化]]
- [[UV映射]]
- [[纹理迁移]]
- [[参数化]]

---

## 实现建议

- **实现难度**: 高（需构建和维护图口结构）
- **预期性能**: 精度高但计算开销较大
- **适用场景**: 纹理传递、体积仿真数据迁移、多分辨率网格数据传输

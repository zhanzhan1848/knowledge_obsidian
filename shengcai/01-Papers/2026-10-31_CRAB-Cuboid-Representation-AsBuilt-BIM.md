---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, SIGGRAPH-Asia-2026, BIM, cuboid-representation, point-cloud, flow-matching, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.29257
---

# CRAB: Cuboid-based Representation for As-built BIM from Point Clouds

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CRAB: Cuboid-based Representation for As-built BIM from Point Clouds |
| **作者** | Haoran Xiong, Jing Wang, Shanshan Pan, Zihao Yan, Minglun Gong, Hui Huang |
| **发表** | **SIGGRAPH Asia 2026**, 2026-10-21 |
| **链接** | [原文](https://arxiv.org/abs/2610.29257) |
| **DOI** | - |
| **代码** | 项目页 https://vcc.tech/research/2026/CRAB |

---

## 核心贡献

> CRAB — BIM 就绪的长方体重建框架：把墙、门、窗、梁、柱编码为带 IFC 兼容语义与参数的紧凑建筑长方体，连接点云与可编辑 BIM。

1. **BIM-ready 长方体表示** — 超越 2D 平面图或平面抽象，提供语义化、体量化、参数化、可编辑的构件级 BIM。
2. **ProposalNet + AssemblyNet 两段式** — ProposalNet 预测粗构件长方体；AssemblyNet（关系感知的 Flow Matching 模型）精化几何、预测结构关系，支持自动结构修正与人工引导编辑。
3. **扩展 Structured3D 标注** — 补充构件级长方体标注，并构造长方体程序化场景，缓解监督稀缺。

---

## 技术方案

### 核心思想

扫描转 BIM（scan-to-BIM）需要恢复墙厚、开口几何与构件级 BIM 结构。既有方法要么靠手工规则/启发式优化/人工修正，要么学习式方法无法恢复厚度与开口信息。

CRAB 的表示选择很关键：**长方体**介于平面（太弱）与完整网格（太重/难参数化）之间，能表达墙厚、梁柱截面这类参数化几何，同时天然带 IFC 语义。

### 关键技术

| 技术 | 说明 |
|------|------|
| 构件级长方体编码 | 墙/门/窗/梁/柱，IFC 兼容语义与参数 |
| ProposalNet | 预测粗构件长方体 |
| AssemblyNet (Flow Matching) | 关系感知，精化几何 + 预测结构关系 |
| 自动结构修正 | 基于关系预测做物理合理性修复 |
| 人工引导编辑 | 支持交互式修改 |
| Structured3D 扩展 | 构件级长方体标注 + 程序化场景 |

---

## 公式

```math
// Flow Matching 精化（概念式）
\mathbf{x}_t = (1-t)\,\mathbf{x}_0 + t\,\mathbf{x}_1
\mathbf{v}_\theta(\mathbf{x}_t, t, c) \approx \frac{\mathbf{x}_1 - \mathbf{x}_0}{1-t}
// c = 结构关系条件
```

---

## 代码片段

```python
# 概念伪代码：CRAB 两段式重建
cuboids = proposal_net(point_cloud)                    # 粗构件
relations = assembly_net.predict_relations(cuboids)   # 结构关系
for c, r in zip(cuboids, relations):
    c.refine()                                        # Flow Matching 几何精化
    c.semantic = ifc_map(r)                           # IFC 语义映射
model = assemble(cuboids, relations)                  # 自动结构修正
```

---

## 实验结论

- **数据集**: 扩展后的 Structured3D + 长方体程序化场景
- **基线**: 平面图方法、平面类方法
- **结果**:
  - 构件完整性、几何精度、泛化性全面超越平面图与平面类方法
  - 内墙厚度估计平均误差 **2.80 cm**
  - **79.50%** 的匹配墙体误差在 3 cm 以内

---

## 局限性

- 长方体表示无法表达非棱柱形构件（弧形墙、异形梁）
- 依赖 IFC 语义映射体系，跨地区标准适配待做
- 摘要未给出点云→BIM 的端到端耗时

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **参数化几何 + 关系推理**的组合思路（几何精化与语义解耦）可迁移到程序化建模与资产生成
- 关联：[[2026-10-31_HairDeck-Set-Diffusion-Hair-Cards]]、[[2026-10-31_GALA-Geometry-Aware-Language-Model-Object-Arrangement]]

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 墙厚 MAE 2.80 cm，79.5% 在 3 cm 内
- **适用场景**: 建筑数字化、竣工 BIM 自动生成、既有建筑改造
- **优先级**: 中低（偏应用几何，跨域但方法论有参考价值）

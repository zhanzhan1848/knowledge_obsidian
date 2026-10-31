---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, hair-cards, set-diffusion, animation-asset, spring-bone, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.40599
---

# HairDeck: Animation-Ready Stylized Hair Cards from a Single Image

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HairDeck: Animation-Ready Stylized Hair Cards from a Single Image |
| **作者** | Yuze He, Yixiang Wei, Wang Zhao, Chuhao Chen, Yanning Zhou, Yong-Jin Liu |
| **发表** | arXiv preprint (cs.CV / cs.GR), 2026-10-29 (27 pages, 23 figures) |
| **链接** | [原文](https://arxiv.org/abs/2610.40599) |
| **DOI** | - |
| **代码** | 项目页 https://hyzcluster.github.io/HairDeck |

---

## 核心贡献

> HairDeck — 从单张图像生成可直接动画的风格化发卡（hair cards）：把发卡视为**无序原语集合**，用集合扩散 Transformer 一次性去噪所有发卡。

1. **集合扩散 Transformer** — 每张发卡作为单个 token，所有发卡一起去噪，取代 CHARM 的自回归长控制点序列解码。
2. **同时生成弹簧骨链** — 从单图生成发卡 + 驱动它们的 spring-bone 链，产出可直接导出的可动画资产。
3. **大幅性能提升** — Chamfer 距离降低 **44%**，发卡朝向误差降低 **超过一半**，运行速度 **33×**。

---

## 技术方案

### 核心思想

游戏/虚拟形象的风格化头发由 **hair cards** 构建——艺术家摆放的丝带状几何，由 spring bones 驱动动画。

既有方法的问题：
- 图像方法产出写实头发或单一融合网格
- CHARM（唯一的风格化发卡生成器）把发型自回归解码为**长控制点序列**

HairDeck 的关键观察：**发卡发型是一个无序的、由艺术家定义原语构成的集合**。既然无序，就该用集合生成而非序列生成：
- 每张发卡 = 一个 token
- 集合扩散 Transformer 同时去噪所有发卡（set diffusion，无需排列顺序）
- 附带生成 spring-bone 链

### 关键技术

| 技术 | 说明 |
|------|------|
| Set Diffusion Transformer | 无序集合生成，避免自回归长度瓶颈 |
| 发卡作为单 token | 每卡一个 token，长序列问题消失 |
| Spring-bone 链生成 | 同时产出动画驱动数据 |
| 单图输入 | 无需多视角扫描 |
| 下游格式导出 | 可直接用于生产管线 |

---

## 公式

```math
// 集合扩散去噪（概念式）
\hat{\mathcal{C}} = \arg\min_{\mathcal{C}} \; \mathbb{E}_{t,\epsilon}\Big[ \big\| \epsilon - \epsilon_\theta(\mathcal{C}_t, t, I) \big\|^2 \Big]
// \mathcal{C} = {c_1, ..., c_K} 发卡集合，顺序无关
```

---

## 代码片段

```python
# 概念伪代码：HairDeck
cards = set_diffusion_transformer.sample(cond=input_image, num_cards=K)
chains = springbone_head(cards)                 # 生成弹簧骨链
asset = HairAsset(cards, chains)
export_to_pipeline(asset)                      # 导出下游格式
```

---

## 实验结论

- **数据集**: CHARM 官方测试集 + 单图生成评测
- **基线**: CHARM、图像到 3D 管线、基于发丝（strand-based）方法
- **结果**:
  - Chamfer 距离降低 **44%**
  - 发卡朝向误差降低 **超过一半**
  - 运行速度 **33× 提升**
  - 单图输入下超越 CHARM、图像到 3D 管线与发丝方法

---

## 局限性

- 只针对风格化发卡，不适用于写实发丝
- 依赖单图，遮挡区域的发卡为生成推测
- 摘要未给出 spring-bone 链的质量评估指标

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **"无序集合 → 集合扩散"** 是一次优雅的问题重构，值得在其他"原语集合生成"任务上复用（如植被布置、家具布局）
- 关联：[[2026-10-31_Greenscapes-Vegetation-City-Placement-Optimization]]、[[2026-10-31_GALA-Geometry-Aware-Language-Model-Object-Arrangement]]

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 质量大幅提升 + 33× 加速
- **适用场景**: 游戏角色资产生成、虚拟形象定制
- **优先级**: 中

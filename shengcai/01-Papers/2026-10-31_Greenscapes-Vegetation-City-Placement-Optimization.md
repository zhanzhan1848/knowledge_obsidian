---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, urban-scene, vegetation, VLM, CMA-ES, optimization, rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.40007
---

# Greenscapes: Optimized Vegetation Configurations in Cities

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Greenscapes: Optimized Vegetation Configurations in Cities |
| **作者** | Patryk Bartkowiak, Marcin Marlewski, Paweł Wójcik, Jae Joong Lee, Dominik L. Michels, Bedrich Benes, Sören Pirk, Wojciech Pałubicki |
| **发表** | arXiv preprint (cs.GR / cs.CV), 2026-10-29 (18 pages, 15 figures, 5 tables) |
| **链接** | [原文](https://arxiv.org/abs/2610.40007) |
| **DOI** | - |
| **代码** | https://github.com/greenscapes-project/greenscapes · 项目页 https://greenscapes-project.github.io/ |

---

## 核心贡献

> Greenscapes — 城市植被配置优化：VLM 生成俯视植被布局 → 转为 3D 场景 → CMA-ES 优化尺度与资产替换，兼顾遮阴/声学等功能指标与美学感知。

1. **VLM 生成俯视布局** — 以地块为输入，用受控视觉语言模型生成俯视植被渲染图，放置大树、小树、灌木。
2. **2D → 3D 转换** — 检测单株植物并选取合适的 3D 资产。
3. **确定性可行性修复 + CMA-ES 优化** — VLM 生成的位置固定不动，优化逐实例尺度变换与离散资产替换。
4. **功能 + 美学双目标** — 用高效遮阴与基于路径的声学暴露代理模型评估功能，同时每步渲染场景视图计算视角相关感知描述子以保证美学。

---

## 技术方案

### 核心思想

城市植被有明确功能（平衡遮阴与天空暴露、改善微气候、碳吸收、声学屏蔽），同时景观美学（规整/现代/自然）影响市民福祉。

Greenscapes 的两阶段设计很务实：
- **阶段A（生成）** — VLM 负责"布局合理性"这类语义判断（哪里该有树），生成俯视图
- **阶段B（优化）** — CMA-ES 负责连续/离散参数搜索（尺度、资产替换），用代理模型评估快速目标函数

关键是 **VLM 只负责它擅长的**（语义布局），优化器负责**它擅长的**（参数搜索），两者解耦。

### 关键技术

| 技术 | 说明 |
|------|------|
| 条件化 VLM 俯视渲染 | 生成植被布局的语义先验 |
| 单株检测 + 资产选择 | 俯视图 → 3D 场景 |
| 确定性可行性修复 | 保证生成位置物理可行 |
| CMA-ES 混合优化 | 连续尺度 + 离散资产替换 |
| 遮阴代理模型 | 高效评估遮阴/天空暴露 |
| 路径声学代理模型 | 基于路径的声学暴露评估 |
| 视角相关感知描述子 | 每步渲染保证美学质量 |

---

## 公式

```math
// CMA-ES 混合变量优化目标（概念式）
\mathcal{J}(\boldsymbol{s}, \boldsymbol{a}) =
    \underbrace{\hat{S}_{\text{shade}}(\boldsymbol{s}) + \hat{E}_{\text{acoustic}}(\boldsymbol{s})}_{\text{功能代理}}
  + \lambda \cdot \underbrace{\hat{P}(\text{render}(\boldsymbol{s},\boldsymbol{a}))}_{\text{美学感知}}
// \boldsymbol{s} = 逐实例尺度，\boldsymbol{a} = 离散资产选择
```

---

## 代码片段

```python
# 概念伪代码：Greenscapes 优化循环
layout = vlm.generate_topdown_vegetation(lots)          # 俯视布局
plants = detect_plants(layout); placements = select_assets(plants)
placements = deterministic_feasibility_repair(placements)
def objective(theta):
    s, a = split_scale_asset(theta)
    scene = apply(placements, s, a)
    return shade_surrogate(scene) + acoustic_surrogate(scene) + \
           lam * perceptual_descriptor(render_views(scene))
best = cma_es.optimize(objective, x0=initial_theta)
```

---

## 实验结论

- **数据**: 多城市地块数据（多源场景数据）
- **基线**: 手工布局、无优化基线
- **结果**:
  - 生成同时满足功能（遮阴、声学）与美学（景观风格）的植被布局
  - 18 页论文含 15 图 5 表，量化评估较完整
  - 代码与项目页公开

---

## 局限性

- 依赖代理模型（遮阴/声学）精度，代理偏差会传导
- VLM 俯视布局在密集城市街区可能产生不可行方案
- 离散资产替换使优化空间组合爆炸

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **"生成模型给布局 + 优化器给参数"** 的分工是通用范式，可直接复用到室内布局、道具摆放等场景
- 关联：[[2026-10-31_HairDeck-Set-Diffusion-Hair-Cards]]、[[2026-10-31_GALA-Geometry-Aware-Language-Model-Object-Arrangement]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 功能+美学双达标；优化收敛依赖代理模型
- **适用场景**: 城市规划工具、游戏城市植被配置、场景美术辅助
- **优先级**: 中低（应用导向，但方法论模式通用）

# A Framework for Diagnosing Inertial Lift Generation in Wall-Bounded Flows
**arXiv:** [2603.29605](https://arxiv.org/abs/2603.29605) | **分类:** physics.flu-dyn
**作者:** Masafumi Hayashi, Kazuyasu Sugiyama
**日期:** 2026-03-31 | **版本:** v1

---

## 研究背景与问题
- **现象:** 近壁流动中物体受到法向升力（惯性升力），广泛存在于许多流体系统中
- **问题:** 缺乏从流场内部结构诊断稳态惯性升力的理论框架
- **应用:** 偏心旋转圆柱间的流动

## 理论框架

### 基础: 广义互惠定理 (Generalised Reciprocal Theorem)
- 适用于有限雷诺数流动
- 将升力表达为**体积积分**形式
- 可识别主要贡献项及其空间来源

### 升力分解
$$\mathbf{F}_{\text{lift}} = \underbrace{\text{vortex-force contribution}}_{\text{惯性项}} + \underbrace{\text{viscous stress contribution}}_{\text{粘性项（变粘度）}}$$

- **涡力项** — 主导整个参数范围
- **粘性应力项** — 与非均匀粘度场相关（对剪切变稀流体尤其重要）

## 算例配置

### 几何: 偏心旋转圆柱
- 内圆柱: 旋转 + 公转运动
- 外圆柱: 静止
- 偏心度可调

### 工况
| 参数 | 变化范围 |
|------|---------|
| 偏心度 | 低 → 高 |
| 流体 | 牛顿流体 / 剪切变稀流体 |

## 关键物理发现

### 牛顿流体中的升力反转
- 随偏心度增加: 负相对涡量在窄间隙区增强
- 负局部涡力贡献增强 → **导致升力反转**

### 剪切变稀流体中的升力反转
- 剪切变稀行为增强 → 内圆柱附近负相对涡量放大
- 正局部涡力贡献增强 → **导致升力反转**

## 诊断框架的价值
- 可识别各物理机制对升力的贡献区域
- 为壁面流动中惯性升力的物理解释提供有力工具
- 适用于工程中微流控、颗粒分离等场景

## 技术标签
#LiftForce #WallBoundedFlow #FiniteRe #NonNewtonian #VortexForce #GeneralizedReciprocalTheorem #CFD #ArX:2603.29605

## 原文链接
- Abstract: https://arxiv.org/abs/2603.29605
- PDF: https://arxiv.org/pdf/2603.29605

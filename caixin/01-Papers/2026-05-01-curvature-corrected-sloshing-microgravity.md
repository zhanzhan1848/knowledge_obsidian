# Curvature-Corrected Sloshing Spectra for Cylindrical Tanks in Microgravity

## 论文信息
- **arXiv**: [2605.00168](https://arxiv.org/abs/2605.00168)
- **分类**: physics.flu-dyn
- **提交日期**: 2026-05-01
- **关键词**: microgravity sloshing, cylindrical tank, curved meniscus, capillary-gravity waves, reduced-order model

## 研究背景
微重力下部分填充的圆柱罐由弯曲平衡液面（而非平坦自由面）界定。Bond 数 Bo ~ O(1) 或更小时，平界面晃荡频率不再准确——这直接影响航天器推进剂管理。

## 方法
- **半解析边界算子公式** (semi-analytical boundary-operator formulation)
- 保留圆柱贝塞尔结构，精确恢复平界面极限
- 分解为:
  - 体 Dirichlet-Neumann 算子
  - 线性化曲率算子

## 核心发现

### 曲率效应
- Bo ≲ 1 时，平衡曲率耦合径向模式，改变低阶谱
- **凹液面** → 降低基频
- **凸液面** → 升高基频（常降低高阶分支）

### 润湿/非润湿非对称性
主要来源：**Dirichlet-Neumann 算子**（而非毛细项），即**动能效应**主导

### 模型建议
弯曲液面应作为**leading-order 模型**（而非二阶修正）来处理圆柱微重力晃荡。

## 工程应用
- 航天器推进剂管理 (propellant management devices)
- 临界频率预测用于结构设计

## 创新点
将曲率效应显式分离，物理根源透明；首次精确处理微重力圆柱罐晃荡问题中的液面曲率修正。

## 评注
⭐⭐⭐ 高影响力 — 航天工程直接应用，半解析方法便于集成到降阶模型，对深空任务的液体晃动控制有实用价值。
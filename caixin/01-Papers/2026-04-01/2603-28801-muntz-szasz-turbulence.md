# Sparse Müntz–Szász Recovery for Boundary-Anchored Velocity Profiles
**arXiv:** [2603.28801](https://arxiv.org/abs/2603.28801) | **分类:** physics.flu-dyn, nlin.CD, physics.comp-ph
**作者:** D Yang Eng
**日期:** 2026-03-21 | **版本:** v1

---

## 研究目标
- **核心问题:** 从短边界锚定速度增量剖面（$N \approx 40$ 样本点）估计有效局部标度指数
- **方法论定位:** 有限尺度、方向性粗糙度诊断工具（非点态 Hölder 指数估计）
- **对比:** 传统分形分析需要长记录数据

## 核心方法

### 稀疏凸松弛框架
- **$\ell_1$ 正则化回归** 在混合 Müntz–Szász / Jacobi 字典中求解
- 从速度增量剖面稀疏表示中提取标度指数 $\hat{\alpha}$

### 字典设计
- **Müntz–Szász 序列:** 用于捕获幂律行为
- **Jacobi 多项式:** 用于正交基展开

## 基准验证

### Johns Hopkins Turbulence Database (JHTDB)
- ** isotropic 数据集测试
- 内部子采样基准（$N=200$ vs $N=40$）:
  - **$F_1 \approx 0.93$**（9 次无权重运行平均）
- 平衡合成控制:
  - **平衡准确率 0.928**（$N=40$）

### 跨雷诺数性能
- $Re_\lambda \approx 433$–$1300$
- 固定窗口锐利分数保持在 **30%–50%** 量级
- **发现:** 无明显雷诺数趋势

## 与湍流结构的关联

### 涡量条件分析
- 高涡量 → 更小的粗糙度指数 $\hat{\alpha}$（一致关联）
- $\hat{\alpha}$ 与耗散的相关性弱
- **涡量对齐对比度 $\Pi_\alpha$:**
  - 均值 **0.093**（bootstrap 95% CI: $[0.028, 0.158]$）
  - 在真实涡量轴上强于伪轴
  - 低阶四极子分量可统计检测

### 尺度传递扫描
- 在最小和最大测试半径均显示正 $\Pi_\alpha$
- 支持**有限范围持续性**假设（不强声明为非定域定理）

## 方法论定位
- 作为有限尺度几何诊断工具，与能量可观测量互补
- 擅长解析方向结构和近各向异性组织

## 技术标签
#Turbulence #SparseRecovery #MuntzSzasz #VelocityGradient #RoughnessExponent #JHTDB #TurbulenceDiagnostics #CFD #ArX:2603.28801

## 原文链接
- Abstract: https://arxiv.org/abs/2603.28801
- PDF: https://arxiv.org/pdf/2603.28801

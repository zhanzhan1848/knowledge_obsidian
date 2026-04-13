# Revisit Eddy Viscosity in Pressure-Driven Wall Turbulence at High Reynolds Number

**arXiv:** [2604.09454](https://arxiv.org/abs/2604.09454)
**Subject:** physics.flu-dyn, physics.comp-ph
**Date:** 2026-04-10
**Author:** Ao Xu

---

## 核心创新点

- **研究目标：** 重新审视高Reynolds数下压力驱动壁湍流的涡粘度分布
- **三种典型构型：**
  1. 平面封闭槽道流 (plane closed-channel flow)
  2. 自由表面开槽道流 (open-channel flow with free-slip surface)
  3. 圆管流 (pipe flow)
- **DNS数据库范围：** $Re_τ = 2000–12000$

## 核心方法

- 通过Boussinesq关系从单点统计量推断涡粘度
- **关键发现：** 外区涡粘度呈构型依赖性——单一全深度表达式无法普遍准确

## 模型构建

基于浴粘度 = 速度尺度 × 长度尺度的物理解释：
- 将对数律扩展到外区
- 采用基于应力的速度尺度
- 引入外区修正函数（捕获对外坐标的剩余依赖）
- 嵌入Cess-type框架 + van Driest近壁阻尼

## 数值方法

- **DNS直接数值模拟**（无模型方程）
- 雷诺数范围：$Re_τ = 2000–12000$
- 评估指标：涡粘度剖面、对数律指示函数、摩擦阻力

## 关键结论

- 提出的模型对**开槽道流**有显著改善
- 对封闭槽道流和圆管流与经典Cess模型相当
- **外边界条件**对外区涡粘度和平均流预测有重要影响

## 关键公式

- Boussinesq关系：$-\langle u'v'\rangle = ν_t \frac{dU}{dy}$
- Cess型框架：$ν_t = κ y u_τ (1 - e^{...})$
- van Driest阻尼：近壁区域涡粘度抑制

## 🔗 URL
- PDF: https://arxiv.org/pdf/2604.09454
- HTML: https://arxiv.org/html/2604.09454v1

## 标签
#turbulence #RANS #eddy-viscosity #DNS #wall-turbulence #log-law #Reynolds-number

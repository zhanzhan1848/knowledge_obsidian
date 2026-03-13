# On the Deformation of a Shear Thinning Viscoelastic Drop in a Steady Electric Field

**arXiv**: [2603.11580](https://arxiv.org/abs/2603.11580)  
**作者**: Sarika Shivaji Bangar, Gaurav Tomar  
**机构**: Indian Institute of Science, Bangalore  
**提交日期**: 2026-03-12  
**分类**: physics.flu-dyn

## 摘要
研究线性 Phan-Thien-Tanner (LPTT) 液滴在均匀电场下的变形和破碎动力学。使用开源求解器 Basilisk 进行数值模拟。

## 核心创新
- LPTT 粘弹性液滴电场变形系统研究
- 六个特征区域的 $(\sigma_r, \epsilon_r)$ 参数空间分析
- Basilisk 开源求解器应用

## 本构模型
**线性 Phan-Thien-Tanner (LPTT) 模型**:
$$\boldsymbol{\tau} + \lambda \frac{\partial \boldsymbol{\tau}}{\partial t} = \eta_p (\nabla \mathbf{u} + \nabla \mathbf{u}^T)$$

## 参数空间分区
六个特征区域：$PR_A^+$, $PR_B^+$, $PR_A^-$, $PR_B^-$, $OB^+$, $OB^-$

### 区域特性
| 区域 | 行为 | 弹性效应 |
|------|------|----------|
| $PR_A^-$ | 接近牛顿行为 | 弱 |
| $PR_B^-$ | 接近牛顿行为 | 弱 |
| $OB^+$ | 接近牛顿行为 | 弱 |
| $PR_A^+$ | 长球/多叶/破碎 | 增加 De 减小变形 |
| $PR_B^+$ | 长球/锥形端 | 非单调 De 依赖 |
| $OB^-$ | 扁球/破碎 | 非单调 De 依赖 |

## 关键参数
- **Deborah 数 (De)**: 弹性效应
- **电毛细管数 (Ca_E)**: 电场强度
- **电导率比 ($\sigma_r$)**: 相对电导率
- **介电常数比 ($\epsilon_r$)**: 相对介电常数

## 数值方法
- **求解器**: Basilisk (开源)
- **方法**: VOF + 电场耦合

## 相关概念
- [[粘弹性流体]]
- [[电流体动力学]]
- [[液滴变形]]
- [[Basilisk]]

## 应用场景
- 微流控
- 喷墨打印
- 复杂流体电控操作

---
*检索日期: 2026-03-13*

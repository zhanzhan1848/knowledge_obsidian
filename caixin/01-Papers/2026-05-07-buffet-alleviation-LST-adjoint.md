# Buffet Alleviation via Linear Stability Adjoint

**arXiv**: [2605.04884](https://arxiv.org/abs/2605.04884)  
**日期**: 2026-05-07  
**Subjects**: Fluid Dynamics (physics.flu-dyn)

---

## 核心贡献

发展**耦合伴随方法**高效计算来流稳定性(LST)特征值对大量形状设计变量的灵敏度。

---

## 研究背景

- **问题**: 跨声速buffet(自持激波和剪切层振荡)限制了现代运输机的巡航包线
- **现有方法局限**: Δα=0.1°准则等经验准则过于保守或不安全
- **LST瓶颈**: 特征值对多设计变量的灵敏度计算成本高

---

## 创新方法

### 伴随公式
- 重用定常CFD adjoint在**顶层和底层**分解特征问题
- 避免了对每个设计变量独立求解特征问题的巨额开销

### 验证基准
1. 圆柱涡激振动(canonical cylinder vortex-shedding)
2. OAT15A超临界翼型: M=0.73, Re=3.2×10⁶
   - LST预测 vs 已有特征谱
   - vs URANS线性增长阶段

### 优化结果
- 单点buffet约束阻力最小化: **22.4%阻力降低**
- 三维NASA CRM翼型: M=0.85, Re=5×10⁶
- 恢复buffet onset于 α ≈ 4.0°

---

## 数值方法

| 组件 | 方法 |
|------|------|
| 稳态求解 | CFD adjoint |
| 特征分析 | Linear Stability Analysis (LST) |
| 时间推进 | URANS |
| 优化 | 梯度基伴随优化 |

---

## 关键公式

**特征值灵敏度**:
$$\frac{\partial \lambda}{\partial \mathbf{d}} = \text{via adjoint reusage}$$

** buffet onset约束**: LST增长率 ≤ 0

---

## 核心发现

1. **伴随复用策略**: 定常CFD adjoint可被特征问题重用，实现 O(1) 每次灵敏度评估
2. **LST预测验证**: 与文献特征谱和URANS线性增长阶段一致
3. **三维扩展**: 初步验证为三维buffet约束机翼优化奠定基础

---

## 与以往工作的区别

| 方面 | 传统方法 | 本文 |
|------|---------|------|
| 灵敏度计算 | 每次设计变量独立求解 | adjoint复用，单次求解 |
| buffet约束 | 经验准则 | 第一性原理LST |
| 设计空间 | 少量变量 | 大规模设计变量 |

---

## 潜在应用

- 超临界翼型优化设计
- 跨声速气动外形优化
- buffet onset预测

---

## 备注

- 提交: 13页(正文) + 4页(附录) + 3图
- 可为@墨鱼丸提供气动优化算法参考

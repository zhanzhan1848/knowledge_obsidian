# Shakhov-Based BGK Model for Polyatomic Molecules

## 论文信息

- **ID**: [arXiv:2604.01377](https://arxiv.org/abs/2604.01377)
- **作者**: Marcel Pfeiffer, Franziska Tuttas
- **发表**: 2026-04-01
- **分类**: physics.flu-dyn, physics.comp-ph
- **开源**: PICLas

---

## 研究背景

DSMC (Direct Simulation Monte Carlo) 方法计算量大，需要更高效的 Boltzmann 方程求解器。

Shakhov BGK (SBGK) 是 DSMC 的确定性替代方案。

---

## 创新点

### 针对多原子分子和混合物

1. **内自由度非平衡**: 考虑分子内部自由度的非平衡效应
2. **混合物支持**: 原子和分子混合物
3. **Prandtl 数调节**: 推导出可调 Prandtl 数模型参数
4. **输运系数**: 使用碰撞积分一阶近似确定粘度和热导率

### 守恒性质

- 质量守恒
- 动量守恒  
- 能量守恒

---

## 验证算例

| 算例 | 类型 | 对比方法 |
|---|---|---|
| 超声 Couette 流 | 平面流动 | DSMC, ESBGK |
| 70° 钝头锥绕流 | 高超声速 | DSMC, ESBGK |

---

## 关键结果

> SBGK 模型比 ESBGK 更精确地捕捉 70° 钝头锥前的激波结构

---

## 方法对比

| 特性 | DSMC | ESBGK | SBGK |
|---|---|---|---|
| 计算成本 | 高 | 低 | 低 |
| 激波捕捉 | 精确 | 一般 | **精确** |
| 多原子分子 | 支持 | 支持 | **支持** |
| Prandtl 数控制 | 统计涨落 | 固定 | **可调** |

---

## 代码实现

- **PICLas**: 开源粒子代码
- 链接: https://piclas.org/

---

## 📊 可行性分析：[SBGK 替代 DSMC]

## 控制方程
- Shakhov 碰撞模型
- 多原子气体 Boltzmann 方程

## 数值方法
- 离散化：有限体积/粒子方法
- 求解器：确定性 BGK 碰撞算子

## 计算成本
- 远低于 DSMC
- 与 ESBGK 相当

## 推荐结论
✅ 推荐实现（尤其是高超声速多原子气体流动）

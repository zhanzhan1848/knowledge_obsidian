# 2606.28021 — Multiscale Cavitation Sub-Grid Modeling via Population Balances as Linear Stochastic Process

## 基础信息
- **arXiv**: https://arxiv.org/abs/2606.28021
- **作者**: Fynn Aschmoneit
- **分类**: 空化模型 / 亚网格 / 多尺度
- **日期**: 2026-06-26

## 核心创新

### 问题
空化多尺度建模：气泡尺寸分布跨多个数量级，网格尺度无法解析所有气泡。

### 方法
将气泡尺寸分布的**人口平衡方程**重新表述为**半径空间中的双曲输运方程**：

1. 从积分 Rayleigh-Plesset 方程出发
2. 人口平衡 → 半径依赖的数密度双曲方程
3. **方法-of-characteristics 解** → 投影到离散直方图基
4. 得到**列随机马尔可夫链**（每半径仓的气泡计数）

### 关键分解
转移矩阵分解为：
- **预计算只依赖网格几何的部分**
- **局部压力依赖的位移部分**

→ 与周围流场耦合简化为每网格单元一个**无量纲向量**

### 结果
在单代表性尺度极限下恢复经典均匀混合空化闭合。

## 物理模型
```
Rayleigh-Plesset 方程 → 积分形式
↓ 人口平衡
dN/dr (半径空间的数密度)
↓ 方法-of-characteristics
列随机马尔可夫链
```

## 创新点
1. 将空化人口平衡转化为线性随机过程
2. 转移矩阵几何/压力部分分离 → 预计算可能
3. 亚网格空化闭合的新框架

## 与传统方法对比
- 经典方法：经验闭合关系式
- 本方法：从第一性原理推导，物理一致性好

## 标签
#cavitation #population-balance #subgrid #Rayleigh-Plesset #multiscale

---

*由 [[鲜毛肚]] 整理 | 2026-06-30*
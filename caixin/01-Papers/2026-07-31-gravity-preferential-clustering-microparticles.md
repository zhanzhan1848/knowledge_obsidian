---
title: "Role of gravity on preferential clustering of microparticles in unsteady wake flows"
authors: []
date: 2026-07-30
tags: [particle-turbulence, preferential-clustering, DNS, vortex-shedding, gravity, void-structure]
categories: [physics.flu-dyn]
arxiv_id: 2607.27459
doi: 10.48550/arXiv.2607.27459
---

# 核心创新点

## 研究背景与动机
- 粒子-湍流相互作用中的优先聚集（preferential clustering）
- 重力对非稳态尾流流动中微粒聚集的影响
- 钝体绕流（cylinder）作为典型研究案例

## 核心贡献

### 1. 直接数值模拟（DNS）
- 圆柱绕流的粒子载荷流动
- 无界垂直通道流
- **雷诺数**：Re = 100 和 200

### 2. 参数研究
| 参数 | 范围 |
|------|------|
| 粒子 Stokes 数 | 变化 |
| 粒子载荷 | 变化 |
| Froude 数 | 变化 |

### 3. 关键发现

#### 无载荷流动
- 经典涡街（vortex shedding）模式
- 雷诺数依赖的尾流宽度、尾流恢复、速度亏损演化

#### 粒子载荷非稳态尾流
- **非均匀粒子分布** → 形成相干空穴（voids）和聚集簇（clusters）
- 形状与背景流动动力学直接相关

#### 重力效应
1. **滑移速度增加**
2. **削弱涡旋诱导粒子聚集**
3. **促进粒子穿越涡旋**
4. **空穴形状转变**：
   - 单个叶状结构（leaf-like）→ 蛇形空穴区（snake-like）→ 几乎垂直空穴结构

#### 上游区域（柱前）
- 惯性粒子形成弓形冲击波结构（bow-shock-like）
- 范围随 Stokes 数和有限 Froude 条件增加

### 4. 无量纲控制参数
$$\frac{St}{Fr^2}$$
- 控制空穴形状演化
- 控制归一化空穴面积
- 控制 Voronoi 单元面积概率分布

## 分析方法

### Voronoi 分析 + Q 值
- 量化重力和惯性对粒子分布的影响
- Q 值：局部涡度/应变率比

### 空穴结构量化
- 形状分类：叶状 → 蛇形 → 垂直
- 面积归一化
- 概率分布

## 物理机制

### 粒子-涡旋相互作用
```
重力 → 增加滑移速度 → 改变粒子轨迹
     → 减弱涡旋捕获 → 粒子穿越涡旋
     → 空穴结构演变
```

### 控制参数意义
- **St**：粒子惯性
- **Fr**：重力/惯性比
- **St/Fr²**：复合效应

## 数值方法评估

| 方面 | 评估 |
|------|------|
| 方法 | DNS（直接数值模拟）|
| 粒子追踪 |  Lagrangian 追踪 |
| 网格要求 | 足够精细捕获涡旋结构 |
| 计算成本 | 中等（Re=100-200） |

## 主要结论
- 重力和惯性联合控制钝体尾流中的优先聚集
- St/Fr² 是控制空穴演化的关键无量纲参数
- 重力促进粒子穿越涡旋，导致从叶状到垂直空穴结构的转变

## 关键引用
```
@article{arXiv2607.27459,
  title={Role of gravity on preferential clustering of microparticles in unsteady wake flows},
  journal={arXiv:2607.27459},
  year={2026}
}
```

---

*来源：[arXiv:2607.27459](https://arxiv.org/abs/2607.27459)*

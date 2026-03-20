# SIREN Residual Error as a Regularity Diagnostic for Navier-Stokes Equations

> 📅 arXiv: 2026-03-20  
> 🆔 arXiv:2603.18061  
> 👤 作者: Jason Burton  
> 📂 分类: physics.flu-dyn, math.AP

## 摘要

引入一种使用正弦表示网络 (SIRENs) 逼近误差检测三维 Navier-Stokes 方程解正则性损失的方法。SIREN 使用 sin() 激活，产生 C∞ 输出，无法表示非光滑特征。

## 核心创新

### 1. 正则性诊断原理
- 经典谱逼近理论: SIREN 误差界为 $O(N^{-s})$
- $s$ = 局部 Sobolev 正则性
- 在奇点处 ($s \to 0$): 误差为 $O(1)$
- 通过 Gibbs 现象局部化

### 2. 场分解策略
$$\mathbf{u} = \mathbf{u}_{\text{analytical}} + \mathbf{u}_{\text{residual}}$$

- **解析基线**: 对流-扩散方程解 (计算便宜)
- **学习残差**: 压力修正 (SIREN 学习)

### 3. 网络规模
- 紧凑 SIREN: **4,867 参数**
- 比传统 PINN 小几个数量级

## 验证结果

### 3D Taylor-Green 涡

| 粘度 ν | 误差集中度 |
|--------|-----------|
| 0.01 | 4.9x |
| 0.001 | - |
| 0.0001 | 13.6x |

- 误差局部化到**驻点**
- 几何形状与 Chen & Hou (2025) 证明的 3D Euler 奇点匹配

### 轴对称方程

- 重现爆破特征
- 不同分辨率下 $T^*$ 收敛
- 识别**临界粘度**: $\nu_c = 0.00582$
  - 正则化转变点

## 数学背景

### Sobolev 正则性
$$H^s(\Omega) = \{u \in L^2 : D^\alpha u \in L^2, |\alpha| \leq s\}$$

### Gibbs 现象
在间断附近，Fourier 级数/Galerkin 逼近出现振荡和过冲。

## 与 N-S 千禧年问题的关联

- Navier-Stokes 方程的正则性是 Clay 千禧年问题之一
- 此方法提供数值诊断工具
- 可用于检测潜在的爆破点

## 技术优势

1. **计算效率**: 小网络 + 解析分解
2. **物理可解释**: 误差直接关联正则性
3. **奇点定位**: Gibbs 现象提供空间定位
4. **通用性**: 可应用于其他 PDE

## 应用前景

- DNS 网格适应性指导
- 奇点预警系统
- 湍流小尺度结构分析
- PDE 正则性理论研究

## 参考文献

- Chen & Hou (2025) - 3D Euler 奇点证明
- Sitzmann et al. (2020) - SIREN 原始论文
- Leray (1934) - N-S 弱解理论

## MSC 分类

- 35Q30 (Navier-Stokes 方程)
- 65M99 (数值方法)

## 链接

- **arXiv**: https://arxiv.org/abs/2603.18061
- **PDF**: https://arxiv.org/pdf/2603.18061
- **DOI**: https://doi.org/10.48550/arXiv.2603.18061

---

## 相关笔记

- [[数值方法/神经网络/PINN]]
- [[数值方法/SIREN]]
- [[湍流理论/N-S正则性]]
- [[2026-03-20-arXiv-fluid-dyn]]

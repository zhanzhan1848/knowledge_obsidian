# Multiscale Retinal Flow on a Spherical Cap of Varying Aperture

**arXiv**: [2609.11492](https://arxiv.org/abs/2609.11492)  
**Authors**: Chang Lin, Zilong Song, Bob Eisenberg, Shixin Xu, Huaxiong Huang  
**Category**: physics.flu-dyn, physics.bio-ph  
**Published**: 2026-09-10

## 创新点

### 核心问题
视网膜血流建模对于理解视网膜微循环至关重要，但跨多尺度的血管与周围组织耦合计算成本很高。现有解析解只在平面上推导，而视网膜是有前开口的弯曲表面。

### 关键创新
1. **球冠组织域解析解**：将平坦圆盘解析解扩展到可变开度的球冠组织域
2. **立体投影 + 解耦变换**：推导出弯曲流形上耦合 Darcy 方程的解析解
3. **保持有效电阻 formulation**：继承平面圆盘 formulation 的计算效率优势
4. **多尺度耦合**：耦合1D小动脉/小静脉流动 + 3D毛细血管-组织系统
5. **孔径效应分析**：孔径主要通过改变构建的血管结构本身来影响视网膜血流

## 控制方程
- **Darcy 方程**：毛细血管床和组织间质的流动
- **1D 血管流**：小动脉和小静脉
- **多孔介质流动**：有效电阻 formulation

## 数学工具
- 立体投影（stereographic projection）
- 解耦变换（decoupling transformation）
- 球面调和函数（spherical harmonics）

## 应用
- 视网膜微循环建模
- 视网膜病理生理学研究
- 疾病模拟（糖尿病视网膜病变等）

## 相关方法
- [[多孔介质流动]]
- [[Darcy 方程]]
- [[生物流体力学]]

## 标签
#视网膜血流 #生物流体力学 #多孔介质 #Darcy方程 #解析解 #医学CFD

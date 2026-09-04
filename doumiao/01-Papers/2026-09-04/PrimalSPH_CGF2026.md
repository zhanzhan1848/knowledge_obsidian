# Primal SPH Solver for Strongly耦合 Multiphase Simulations with High Density Ratios

## 论文信息
- **发表**: Computer Graphics Forum (CGF), 2026
- **期刊**: Eurographics / Pacific Graphics 2026
- **DOI**: 10.1111/cgf.70559
- **作者**: Jan Bender, Stefan Rhys Jeske, Timna Böttcher, Fabian Löschner (RWTH Aachen University)
- **发表日期**: 2026-08-12
- **会议**: SCA 2026 / Eurographics Workshop on Physics-Based Animation

## 核心创新

### 问题
- 现有 SPH 求解器难以处理**高密度比多相流**（如空气-水密度比 1:1000）
- 弱耦合方法在界面处不稳定
- 强耦合求解器计算成本高

### 方法：Primal SPH Solver
- **原始（Primal）SPH 公式**：将约束直接融入原始变量
- **强耦合（Strongly Coupled）**：联合求解所有相位的质量和动量方程
- **高密度比支持**：通过稳定性约束处理大密度差异

### 关键贡献
1. 原始变量 SPH 框架下的多相流求解器
2. 适合高密度比（high density ratios）
3. 强耦合数值稳定性
4. 基于 SPlisHSPlasH 库实现

## 技术细节

### 物理模型
- 多相流界面追踪
- 表面张力建模（参考 Versatile surface tension and adhesion for SPH fluids, ACM ToG 2013）
- 体积力（压力、重力）

### 数值方法
- SPH 离散化
- 强耦合迭代求解
- 时间步长控制保证稳定性

### 与现有方法对比
| 方法 | 密度比支持 | 耦合强度 | 稳定性 |
|------|-----------|---------|--------|
| 传统 SPH | 低(~100:1) | 弱 | 中 |
| DFSPH | 中(~500:1) | 强 | 较好 |
| **Primal SPH** | **高(~1000:1)** | **强** | **优** |

## 评估维度

### 渲染方法
- 类型：粒子渲染 / SPH 模拟
- 技术：强耦合多相 SPH

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐ (CGF 2026)
- 风格化支持：是（可控制表面张力参数）

### 性能预期
- 帧率：实时（小型场景）到准实时
- GPU 需求：中高（GPU 加速 SPH）
- 内存占用：中等（粒子存储）

### 创新程度
- ✅ **重要贡献**：首个支持超高密度比强耦合 SPH 求解器

## 实现建议
- 着色器复杂度：中（SPH 粒子着色）
- 管线要求：GPU 并行 SPH 管线
- 推荐度：✅ 强烈推荐（多相流体模拟标准求解器）

## 相关资源
- SPlisHSPlasH 库: https://github.com/InteractiveComputerGraphics/SPlisHSPlasH
- RWTH 页面: https://www.informatik.rwth-aachen.de/go/id/lolj/file/1040610

## 标签
#SPH #多相流 #高密度比 #强耦合 #流体模拟 #表面张力 #计算机动画 #CGF

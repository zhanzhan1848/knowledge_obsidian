# Effect of Microscale Turbulent Structures Dynamics on Forced Convection in Turbulent Porous Media Flow

## Metadata
- **arXiv**: [2608.19342](https://arxiv.org/abs/2608.19342)
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **Authors**: Andrey Kuznetsov
- **Date**: Wed, 19 Aug 2026
- **PDF**: [arxiv.org/pdf/2608.19342](https://arxiv.org/pdf/2608.19342)

## 核心创新点

### 研究空白
多孔介质湍流中**微尺度流动结构**（小于孔隙尺度）对湍流热传递的影响**尚未被研究**。

### 研究目标
确定微涡旋对湍流多孔介质流动中对流热传递的影响。

### 方法
- **LES (大涡模拟)** at **Re = 300**
- 均匀多孔介质
- 障碍物形状：**方形**和**圆形**截面
- 孔隙度：**0.50** 和 **0.87**

## 核心发现

### 1. 微涡旋行为依赖性
对流热传递特性取决于微涡旋是否**附着**或**脱离**障碍物表面。

### 2. 频谱相关性
- Nusselt 数与涡旋脱落引起的压力不稳定性之间存在**频谱相关性**

### 3. 二次流动不稳定性
- 障碍物间收缩通道附近形成周期性高压区域
- 导致局部逆压梯度
- 影响流动速度和对流热传递

### 4. 几何优化
了解影响对流热传递的主导模态，有助于找到多孔介质的**最优几何形状**

## 数值方法

### 🥢 可行性分析：多孔介质湍流 LES

## 控制方程
- 过滤后的 N-S 方程（LES）
- 能量方程（热传递）
- 多孔介质模型：Darcy-Forchheimer 或孔隙尺度代理

## 数值方法
- **离散化**：有限体积法（FVM）
- **湍流模型**：Smagorinsky-Lilly 或动态模型
- **网格**：多尺度网格，粗用于大涡旋，细用于近壁/孔隙尺度
- **LES 过滤**：典型网格尺度 ~ 孔隙特征尺度

## 计算成本
- Re=300：中等 Re，3D DNS/LES 可行
- 网格需求：孔隙尺度解析，~10⁶ ~ 10⁷ cells
- 并行性：域名分解

## 推荐结论
✅ 推荐实现（多孔介质热交换设备设计参考）

## 物理洞察
- 孔隙尺度涡旋与热传递强耦合
- 微观结构优化是传热强化的关键

## 相关研究
- 关联：[[Porous-media-turbulence]] · [[LES]] · [[Turbulent-heat-transfer]]
- 标签: #porous-media #turbulence #LES #heat-transfer #microscale-vortices

---
*💡 由 菜心 自动抓取于 2026-08-22*

# SnapPINN: Pressure and Energy Dissipation Reconstruction from Sparse Noisy Velocity Snapshot

- **arXiv**: [2608.26711](https://arxiv.org/abs/2608.26711)
- **Published**: 2026-08-27
- **Categories**: physics.flu-dyn, physics.comp-ph
- **Authors**: Robin Barta, Christian Bauer, Gholamhossein Bagheri

## 问题

从实验速度测量重建压力和湍流量，**无时间分辨数据**时非常困难。低 seeding 密度、有限分辨率、测量噪声进一步阻碍精确重建。

## 方法：两阶段 SnapPINN

### 架构
- **Sine 激活函数**
- **解耦** velocity 和 pressure 子网络

### Stage 1: Velocity Network
- 从粒子数据拟合 3D 速度
- 施加**不可压缩约束**（$\nabla \cdot \mathbf{u} = 0$）
- 作为物理一致平滑算子，正则化速度梯度

### Stage 2: Pressure Network
- 冻结 velocity network
- 使用**压力 Poisson 方程**训练：
$$ \nabla^2 p = -\nabla \cdot (\mathbf{u} \cdot \nabla \mathbf{u}) $$
- 利用预训练速度梯度

## 数据集

**DNS 湍流管道流** (turbulent pipe flow)，测试极端稀疏条件：
- 噪声水平：显著位置噪声
- 线性化速度场
- 低 seeding 密度：**0.07%** 的完整 DNS 网格点

## 性能

| 量 | 误差 |
|----|------|
| 体积速度 | **< 0.5%** |
| 能量耗散率 $\epsilon$ | **< 50%**（对梯度敏感量） |
| $Re_\tau$ | **4-24%**（极端稀疏噪声条件下） |

### 可靠性地图
建立实际实验条件下的可靠性图：无 ground truth 时判断重建可靠性。

## 评估

✅ **推荐实现** — SnapPINN 在极端实验条件下的鲁棒性突出，适合实验流体力学应用。

## 创新点

1. **无时间分辨**：单快照即可
2. **极端稀疏**：0.07% 网格点
3. **含噪声**：无需去噪预处理
4. **两阶段解耦**：避免 velocity-pressure 耦合不稳定

## 相关链接
- PDF: https://arxiv.org/pdf/2608.26711v1

---
*分类: #PINN #压力重建 #湍流 #实验CFD #稀疏数据 #DNS #管道流*

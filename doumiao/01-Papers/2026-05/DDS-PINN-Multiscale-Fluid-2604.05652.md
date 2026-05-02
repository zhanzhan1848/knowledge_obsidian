# DDS-PINN: Multiscale Physics-Informed Neural Network for Complex Fluid Flows

> **元数据**
> - **论文标题**: Multiscale Physics-Informed Neural Network for Complex Fluid Flows with Long-Range Dependencies
> - **arXiv ID**: 2604.05652
> - **作者**: Prashant Kumar, Rajesh Ranjan (IIT Kanpur)
> - **发表时间**: 2026-04
> - **类别**: Scientific Machine Learning / Fluid Dynamics
> - **标签**: #PINN #Deep-Learning #Fluid-Simulation #Multiscale #Turbulence
> - **研究领域**: 计算流体力学 (CFD)

---

## 核心创新点

1. **Domain-Decomposed PINN (DDS-PINN)** - 区域分解物理信息网络
2. **局部网络 + 全局损失统一** - 捕获全局依赖同时保持局部精度
3. **无需数据驱动** - data-free Navier-Stokes 模拟
4. **稀疏监督** - 仅 500 个随机监督点 (<0.3% 域) 达到 $\mathcal{O}(10^{-4})$ 收敛

---

## 方法论

### 挑战
- **多尺度性**: 高雷诺数下空间-时间尺度谱宽
- **长程依赖**: 边界条件到远处区域的信息传播
- **光谱偏差**: 神经网络倾向低频，忽略高频特征

### DDS-PINN 解决方案

1. **局部网络分解** - 将全局域分解为局部区域
2. **统一全局损失** - 保持区域间物理一致性
3. **全局依赖 + 局部精度** - 同时满足

---

## 基准测试

| 问题 | 雷诺数 | 结果 |
|------|--------|------|
| 平板边界层 | Re=100 | 与CFD相当，无需数据 |
| 后向台阶 (层流) | Re=100 | 预测边界层厚度、分离、再附着长度 |
| 后向台阶 (湍流) | Re=10,000 | 500点(<0.3%)收敛至 $\mathcal{O}(10^{-4})$ |

---

## 与流体渲染的关联

本文主要关注**流体模拟**（计算流体力学），而非直接的可视化渲染，但涉及：

| 技术 | 渲染应用 |
|------|---------|
| 多尺度建模 | 体积渲染密度场 |
| PINN代理模型 | 烟雾/火焰快速预测 |
| 长程依赖 | 全局光照传输 |
| data-free训练 | 稀疏数据下的流体动画 |

---

## 来源

- **arXiv**: https://arxiv.org/abs/2604.05652
- **HTML**: https://arxiv.org/html/2604.05652v1
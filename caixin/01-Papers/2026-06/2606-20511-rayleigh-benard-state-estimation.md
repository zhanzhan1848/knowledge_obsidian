# State estimation of Rayleigh-Bénard convection with reduced-order models

## 论文信息
- **arXiv ID**: 2606.20511
- **作者**: Enrique Flores-Montoya, André F. C. da Silva, André V. G. Cavalieri
- **机构**: Instituto Tecnológico de Aeronáutica (ITA), Brazil
- **领域**: physics.flu-dyn
- **发表日期**: 2026-06-19

## 核心创新点
1. 结合 Galerkin ROM 与 Extended Kalman Filter (EKF) 的状态估计框架
2. 使用线性化 Boussinesq 方程的可控性格式构建 ROM
3. 提出基于 Kalman gain 的贪婪传感器布置策略

## 控制方程
- Boussinesq 方程 (线性化形式)
- 状态空间: ROM 模态振幅

## 数值方法
- **ROM 构建**: Controllability modes from linearized Boussinesq equations
- **滤波方法**: Extended Kalman Filter (EKF)
- **数据同化**: DNS 生成合成测量值

## 关键结果
- 速度重建误差 < 14%，温度误差 < 9%
- 仅需粗粒度 PIV 类速度测量即可重建完整状态
- Kalman gain 矩阵可揭示传感器类型层次结构

## 技术标签
#状态估计 #数据同化 #Reduced-Order-Model #Kalman-Filter #Rayleigh-Bénard

## 链接
- arXiv: https://arxiv.org/abs/2606.20511

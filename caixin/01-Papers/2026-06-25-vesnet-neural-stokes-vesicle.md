# VesNet: Neural network accelerated solver for simulating Stokesian vesicle suspensions

**arXiv:** [2606.25569](https://arxiv.org/abs/2606.25569)
**Authors:** G. Kabacaoğlu, G. Biros (UT Austin, Durham University)
**Date:** 2026-06-24
**Categories:** Neural Network, Stokes Flow, Vesicle Suspension, Boundary Integral Equation, GPU Acceleration

---

## 核心创新点

1. **问题**: 可变形颗粒悬浮液在 Stokes 流 regime 的模拟计算代价高 (非线性流固耦合、演化界面、多尺度水动力学)
2. **方法**: **混合 NN + 算法框架** (非纯神经网络代理)
   - IVNet (Iterated V-shape Net): 近似 vesicle 自相互作用算子
   - 保留传统算法模块: 边界重参数化 + N-body 远场水动力相互作用
3. **性能**: 
   - **100×** 加速 (vs MATLAB 多线程 CPU BIE 求解器)
   - **5×** 加速 (vs GPU 实现 BIE 求解器)
4. **物理嵌入**: 平移、旋转、缩放不变性直接嵌入训练数据和架构

---

## 物理背景

### Vesicle (囊泡)
- 可变形但不可拉伸的膜
- 包含牛顿流体
- 抵抗弯曲和压缩
- 红血球 (RBC) 的数字孪生模型

### Stokes 流 regime
- 低雷诺数, 粘性力主导
- 长程多体水动力相互作用
- 近接触时的短程润滑力

---

## 数值方法

### 边界积分方程方法 (BIEM)
- 核心: Stokes 方程基本解的卷积
- 求解大线性系统 (每时间步)
- 高精度但计算昂贵

### VesNet 架构
1. **IVNet**: 近似自相互作用算子 (多尺度特性)
2. **润滑力网络**: 处理近接触奇异性
3. **N-body 远场**: 谱算子计算
4. **弹性力**: 面积/长度守恒约束

---

## GPU 加速

- 全 GPU 实现: 求解器 + 网络推理
- 单步时间 (2000 vesicles, Poiseuille flow):
  - 时间步: $\Delta t = 10^{-5}$
  - 每步耗时: 1.4s (NVIDIA GH200)
  - 总模拟: 4000 步

---

## 验证

1. **单囊泡相图恢复**: 相变行为正确
2. **双囊泡相互作用**: 动力学准确
3. **大规模模拟**: 2000+ 囊泡, Taylor-Green & Poiseuille 流动
4. **对比基准**: 传统 BIE 求解器 (MATLAB CPU, GPU)

---

## 代码/数据

- **开源**: https://github.com/bioflume/Ves2Dpy
- **语言**: Python (推测)
- **GPU**: CUDA (推测)

---

## 标签

#neural-network #Stokes-flow #vesicle #boundary-integral #GPU #SPH-alternative #multiphase #fluid-structure #CFD
# PINN for Bhatnagar-Gross-Krook Normal Shocks

## 论文信息
- **arXiv**: [2605.29211](https://arxiv.org/abs/2605.29211)
- **作者**: Ehsan Roohi et al.
- **日期**: 2026-05-28
- **分类**: physics.flu-dyn
- **URL**: https://arxiv.org/pdf/2605.29211

## 核心创新点

### 研究背景
- 神经动力学冲击求解器中，闭包级精度不能由准确的密度、速度和温度剖面保证
- 相关可观测量是分布函数的速度加权投影

### 研究问题
对于一维 Bhatnagar-Gross-Krook (BGK) 冲击波研究可观测性问题

### 方法：Positive Macro-Micro PINN
- 分布表示为局部麦克斯韦分布乘以有界指数修正
- 使用独立离散速度方法 (DVM) 作为验证基准

### 关键发现
1. **热通量和法向应力联合锚定**: 稳定主要非平衡层
2. **残差-only / macro-only / single-moment 变体**: 以不同方式失败
3. **稳态 Mach-2 法向冲击**: flux-locked compact model 恢复了 ρ, u_x, T, q_x, σ_xx, m_xxx^cl
4. **R_xx^cl 误差**: 量级为 O(1)，由符号变化、尾部加权抵消控制

### 冲击局部闭包校正
- 减少 R_xx^cl 相对误差至 1.12×10⁻¹
- 保留较低矩

## 物理方程
- BGK 碰撞模型
- 法向冲击波结构
- 非平衡分布函数

## 数值方法
- Physics-Informed Neural Networks (PINN)
- 离散速度方法 (DVM)
- 正定宏-微观耦合

## 应用场景
- 高超声速流动
- 冲击波模拟
- 非平衡气体动力学

## 关键词
`PINN` `BGK` `冲击波` `神经动力学` `非平衡` `DVM`

## 相关工作
- Physics-Informed Neural Networks
- Bhatnagar-Gross-Krook Model
- Neural Gas Kinetic Theory
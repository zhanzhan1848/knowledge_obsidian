# Generating synthetic evolution of turbulent flames with an experimental data-based spatiotemporal diffusion model

## 论文信息
- **arXiv**: [2607.13193](https://arxiv.org/abs/2607.13193)
- **作者**: Amrit Tarur et al.
- **领域**: 火焰模拟 / 生成模型
- **发表时间**: 2026-07-14
- **主题**: 湍流火焰合成 / 扩散模型 / 实验数据驱动

## 核心创新

### 研究问题
如何在数据稀缺环境下生成符合物理规律的湍流火焰演化轨迹？

### 解决思路
1. **条件扩散模型** - 基于实验数据的生成模型
2. **x-prediction flow matching 框架** - 预测条件分布
3. **像素级时空 Transformer** - 生成完整时空数据块
4. **实验数据**:
   - OH-PLIF (OH 平面激光诱导荧光) 场
   - 多组分 PIV (粒子图像测速) 场
   - 附壁/脱离火焰状态

### 关键技术
- **去噪过渡速度模型** - 时变线性组合附壁/脱离去噪速度
- **过渡合成外推** - 火焰吹熄和再附着
- **时空一致性保持** - 大尺度特征保留

## 渲染方法
- **类型**: 火焰模拟 / 数据生成
- **技术**: 
  - 扩散模型 (Diffusion Model)
  - Flow Matching
  - 时空 Transformer

## 视觉质量
- 逼真度: ⭐⭐⭐⭐ (大尺度特征保持良好)
- 局限性: 高时间频率和小空间尺度有偏差

## 性能预期
- 推理: 单次生成完整时空数据块
- 训练数据: 稀缺的实验数据环境

## 适用场景
- 燃烧器设计优化
- 火焰动力学数据探索
- CFD 补充/验证
- 火焰控制策略研究

## 创新点
1. 首个结合实验数据和扩散模型的湍流火焰生成方法
2. 可控的火焰过渡方向和时间尺度
3. 保留样本间变异性的同时实现过渡合成

## 相关链接
- arXiv: https://arxiv.org/abs/2607.13193
- PDF: https://arxiv.org/pdf/2607.13193

## 标签
#fire-simulation #diffusion-model #flame-rendering #turbulence #generative-model

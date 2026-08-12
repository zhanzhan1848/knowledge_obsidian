# Generating synthetic evolution of turbulent flames with an experimental data-based spatiotemporal diffusion model

## 论文信息
- **arXiv**: https://doi.org/10.48550/arXiv.2607.13193
- **发表**: arXiv physics.flu-dyn, 2026-07-14
- **作者**: Amrit Tarur et al.
- **主题**: 湍流火焰生成的时空扩散模型

## 核心创新

### 研究背景
实验数据集日益丰富，为燃烧和流体动力学模型开发提供新途径。实验数据驱动的机器学习优势：
- 直接约束模型到复杂物理信息
- 弥补 CFD 计算的不足

### 方法：条件扩散模型 + x-prediction Flow Matching

#### 1. 数据条件
- **OH-PLIF 场**: OH 平面激光诱导荧光场
- **PIV 场**: 多组分粒子图像测速场
- **燃烧器配置**: 附壁和脱离火焰状态

#### 2. 框架组成
- **x-prediction Flow Matching**: 生成框架
- **Pixel-based Spatiotemporal Transformer**: 生成完整时空 slab
- **条件生成**: 基于火焰状态的生成

### 技术成果

#### 火焰特征保持
- 保持关键火焰特征
- 跨时空统计一致性
- 大尺度保持良好
- 高频时间和小区间尺度有偏差

#### 过渡合成任务
- 条件扩散模型合成火焰过渡 (liftoff, reattachment)
- 使用时变线性组合的降噪过渡速度
- 支持：
  - 过渡方向控制
  - 时间尺度控制
  - 样本间变异性保持

## 渲染方法
- **类型**: 科学可视化 / 神经渲染
- **技术**: 扩散模型 + Flow Matching
- **应用**: 湍流火焰生成

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (数据驱动)
- **统计一致性**: 高
- **小尺度精度**: 有限

## 性能预期
- **生成速度**: 取决于模型规模
- **外推能力**: 可合成未见过渡

## 实现建议
- **复杂度**: 高 (扩散模型)
- **管线要求**: 实验数据 + 神经网络
- **推荐度**: ✅ (实验数据驱动)

## 应用场景
- 燃烧研究
- 火焰可视化
- 数据稀缺环境探索
- CFD 验证

## 技术路线
```
实验数据 (OH-PLIF + PIV)
        ↓
条件扩散模型 + Flow Matching
        ↓
时空连贯火焰生成
        ↓
火焰过渡控制 (liftoff/reattachment)
```

## 与流体渲染关联
- 直接应用于火焰视觉效果生成
- 火焰体积渲染的数据驱动方法
- 实验数据约束确保物理准确性

---

tags: #flame #diffusion-model #flow-matching #combustion #turbulent-flame #scientific-visualization

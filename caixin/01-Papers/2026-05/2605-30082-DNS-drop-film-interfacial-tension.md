# DNS of Drop-Film Interaction: Role of Interfacial Tension

## 论文信息
- **arXiv**: [2605.30082](https://arxiv.org/abs/2605.30082)
- **作者**: (FS3D team)
- **日期**: 2026-05-28
- **分类**: physics.flu-dyn
- **URL**: https://arxiv.org/pdf/2605.30082

## 核心创新点

### 研究背景
- 实验研究中界面张力的变化已有报道
- 需要隔离几何和流体材料参数来评估界面张力的影响

### 方法：Free Surface 3D (FS3D)
- 直接数值模拟 (DNS)
- 使用 FS3D 进行液滴-液膜相互作用研究

### 验证研究
1. **网格无关性研究**: 比较飞溅复合 crown height 确定验证所需分辨率
2. **定性验证**: FS3D 正确捕获变化粘度比的撞击形态
3. **定量验证**: 水滴撞击油膜的 crown heights 数值与实验数据良好匹配

### 界面张力研究结果
- **复合 crown height**: 轻微变化
- **扩展直径**: 轻微变化
- **内部 crown 组成**: 显著差异

### 硬件优化
- **目标**: AMD Instinct MI300A APU (HLRS)
- **方法**: OpenMP porting + Umpire memory pools
- **性能提升**: 4x speedup vs CPU-only
- **强扩展**: 达 4 APUs
- **弱扩展**: 达 512 APUs → 4096³ cells

## 数值方法
- **直接数值模拟 (DNS)**
- **VOF** (Volume of Fluid) 类型方法
- **FS3D**: Free Surface 3D solver

### 物理场景
- 不互溶流体
- 液滴撞击液膜
- 界面张力效应
- Crown/splash formation

## 关键词
`DNS` `直接数值模拟` `界面张力` `液滴` `VOF` `FS3D` `多相流`

## 应用场景
- 喷雾形成
- 燃油喷射
- 液滴动力学

## 相关工作
- Free Surface 3D (FS3D)
- Volume of Fluid methods
- Direct Numerical Simulation
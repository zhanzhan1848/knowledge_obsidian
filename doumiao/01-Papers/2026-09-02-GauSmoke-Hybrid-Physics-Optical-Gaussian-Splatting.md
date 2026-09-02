# GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

## 论文信息
- **会议**: SIGGRAPH 2026
- **DOI**: 10.1145/3799902.3811148
- **作者**: Zhang, W.; Cai, Y; Huang, L; Ye, D; Guo, J; Ren, B
- **分类**: 烟雾渲染 / 体积渲染 / 3D Gaussian Splatting
- **发表时间**: 2026-07

## 核心创新

### 问题背景
烟雾等流体现象在自然环境和视觉特效中普遍存在，表现出比刚体或可变形固体更复杂的形状和运动。传统图形和 CFD 管线使用数值模拟生成流体运动。

### 解决方案
- **物理感知方法**: 从稀疏视角视频重建动态流体
- **混合方法**: 结合体积渲染与物理引导的 Gaussian 优化
- **一致性约束**: 强制密度和运动一致性

## 技术方法

### 1. 体积渲染 (Volumetric Rendering)
- 用于从稀疏视角重建 3D 烟雾

### 2. 物理引导 Gaussian 优化 (Physics-Guided Gaussian Optimization)
- 将物理一致性融入 Gaussian 优化过程
- 减少不真实的伪影

### 3. 密度-运动一致性 (Density-Motion Consistency)
- 强制约束烟雾密度和运动的物理一致性
- 提高重建稳定性

## 技术要点

| 技术 | 描述 |
|------|------|
| 稀疏视角重建 | 仅需少量视角 |
| 体积渲染 | 体素化烟雾表示 |
| 物理引导优化 | 融入物理约束 |
| 高斯溅射 | 3D Gaussian Splatting |

## 性能指标

| 指标 | 结果 |
|------|------|
| 视觉保真度 | 高 |
| 物理保真度 | 高 |
| 重建稳定性 | 准确、稳定 |
| 3D 重建质量 | 高 |

## 关键词
- Real-Time (实时)
- Rendering (渲染)
- Simulation (模拟)

## 应用场景

1. **电影视觉特效**: 快速烟雾重建
2. **科学可视化**: 流体运动分析
3. **游戏开发**: 实时烟雾效果
4. **虚拟现实**: 沉浸式烟雾体验

## 学术贡献

1. 提出首个结合物理约束的烟雾 Gaussian 重建方法
2. 解决稀疏视角下烟雾重建的病态问题
3. 实现高视觉和物理保真度

## 相关工作比较

| 方法 | 稀疏视角 | 物理约束 | 体积渲染 |
|------|----------|----------|----------|
| 传统方法 | ❌ | ❌ | ✅ |
| NeRF 方法 | 部分 | ❌ | ✅ |
| GauSmoke | ✅ | ✅ | ✅ |

## 与知识库相关工作的联系

本文与以下论文相关:
- **FluidGaussian** (2603.21356): 同样使用 Gaussian 进行流体建模
- **Gaussian Fluids** (2405.18133): Gaussian 空间表示的流体求解器
- **LagrangianSplats** (2605.09299): 无散度高斯传输

## 可行性分析 🩸

## 渲染方法
- 类型: **体积渲染**
- 技术: 3D Gaussian Splatting + 物理引导优化

## 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化支持: 待定

## 性能预期
- 帧率: 待测试 (关键词标注 Real-Time)
- GPU 需求: 中高
- 内存占用: 中等

## 实现建议
- 着色器复杂度: 中
- 管线要求: 3DGS 扩展 + 物理约束
- 推荐度: ✅ 推荐

---

## 元数据
- **标签**: #smoke-rendering #volume-rendering #gaussian-splatting #physics-constraints #siggraph2026
- **创建时间**: 2026-09-02
- **来源**: SIGGRAPH 2026 Technical Paper

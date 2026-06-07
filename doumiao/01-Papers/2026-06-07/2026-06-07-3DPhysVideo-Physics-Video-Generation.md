# 3DPhysVideo: Physics-Based Video Generation from Single Image

## 论文信息
- **arXiv ID**: 2605.16795
- **发表时间**: 2026-05-16
- **URL**: https://arxiv.org/abs/2605.16795

## 核心贡献

### 研究问题
视频生成模型常产生视觉伪影，违反物理动力学 grounding。

### 技术挑战
1. 流体动力学建模 (Fluid Dynamics)
2. 多物体交互 (Multi-object Interactions)
3. 照片级真实感 (Photorealism)

### 解决方案: 3DPhysVideo
无需训练的流水线，从单张图像生成物理真实视频。

### 两阶段方法
```
阶段1: 3D场景重建
    └─ 图像 → 视频模型 → 360度完整几何
           └─ 引导点云渲染

阶段2: 物理模拟视频生成
    └─ 物理求解器 → 模拟点云
           └─ 引导同一I2V模型 → 最终视频
```

### 关键技术: Consistency-Guided Flow SDE
将I2V flow模型预测速度分解为：
- 去噪偏差 (Denoising Bias)
- 一致性偏差 (Consistency Bias)

## 渲染方法
- **类型**: 体积 / 粒子
- **技术**: 
  - 3D场景重建
  - 基于物理的渲染
  - 物理模拟

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 是

## 性能预期
- **帧率**: 单消费级GPU可运行
- **GPU需求**: 中等
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 物理求解 + 视频生成
- **推荐度**: ✅✅✅

##评估指标
- GPT-based Scores
- VideoPhy Benchmark
- 人类评估

## 应用场景
- 单图像到物理视频
- 流体交互场景
- 多物体物理模拟
- AI视频生成
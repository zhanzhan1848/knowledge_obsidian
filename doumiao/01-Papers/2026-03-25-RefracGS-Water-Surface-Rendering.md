# RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing

**arXiv ID**: [2603.21695](https://arxiv.org/abs/2603.21695)
**发表日期**: 2026-03-23
**领域**: 水面渲染、折射、3D Gaussian Splatting
**相关性**: ⭐⭐⭐⭐⭐ 高度相关

## 📋 基本信息

**作者**:
- Yiming Shao
- Qiyu Dai
- Chong Gao
- Guanbin Li
- Yeqiang Wang
- He Sun
- Qiong Zeng
- Baoquan Chen
- Wenzheng Chen

**机构**: 未知（待查）

**项目主页**: https://yimgshao.github.io/refracgs/

## 🎯 核心问题

通过非平面折射表面（如水面）进行新视角合成（NVS）存在根本性挑战：
- 严重的空间变化光学扭曲
- 现有 NeRF/3DGS 假设光线直线传播，在折射条件下失效
- 导致显著的渲染伪影

## 💡 创新点

### 1. 双表示解耦框架
- **折射表面**: 使用神经高度场（neural height field）建模波浪几何
- **水下场景**: 使用 3D Gaussian 场表示

### 2. 折射感知高斯光线追踪
- 基于 Snell 定律准确计算非线性光线轨迹
- 高效渲染水下 Gaussian 场
- 将损失梯度反向传播到参数化折射表面

### 3. 端到端联合优化
- 同时优化折射表面和水下场景
- 确保高保真 NVS 和视图一致的表面恢复

## 🔧 技术细节

### 渲染方法
- **类型**: 表面渲染 + 体积渲染混合
- **技术**: 3D Gaussian Splatting + 折射光线追踪

### 关键公式
```
Snell's Law: n₁ sin(θ₁) = n₂ sin(θ₂)
```

### 性能指标
- **帧率**: 200 FPS（实时渲染）
- **训练加速**: 15x 相比先前方法
- **视觉质量**: 优于先前折射方法

## 📊 可行性分析

### 渲染方法
- **类型**: 表面 + 体积混合
- **技术**: 神经高度场 + 3D Gaussian Ray Tracing

### 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是（可通过高度场调制）

### 性能预期
- **帧率**: 200 FPS
- **GPU 需求**: 中等（需要支持光线追踪）
- **内存占用**: 中等

### 实现建议
- **着色器复杂度**: 高（折射计算）
- **管线要求**: 需要可微分渲染器
- **推荐度**: ✅ 强烈推荐

## 🎨 适用场景

- ✅ 水下场景渲染
- ✅ 波浪水面合成
- ✅ 水族馆/海洋可视化
- ✅ 实时水面效果
- ⚠️ 大规模海洋场景（需优化）

## 🔗 相关工作

- [[3D Gaussian Splatting]]
- [[NeRF]]
- [[折射渲染]]
- [[水面模拟]]

## 📚 引用

```bibtex
@article{shao2026refracgs,
  title={Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing},
  author={Shao, Yiming and Dai, Qiyu and Gao, Chong and Li, Guanbin and Wang, Yeqiang and Sun, He and Zeng, Qiong and Chen, Baoquan and Chen, Wenzheng},
  journal={arXiv preprint arXiv:2603.21695},
  year={2026}
}
```

## 📌 待深入研究

- [ ] 折射表面的神经高度场网络架构
- [ ] 光线追踪的加速结构
- [ ] 与流体模拟的集成可能性
- [ ] 多层折射（油/水界面）扩展

---
**收集时间**: 2026-03-25 14:20 UTC
**收集来源**: arXiv cs.GR 每日搜索
**标签**: #fluid-rendering #water-surface #refraction #3DGS #real-time

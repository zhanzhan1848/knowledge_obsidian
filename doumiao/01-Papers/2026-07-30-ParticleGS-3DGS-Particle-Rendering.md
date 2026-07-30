# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering

**日期**: 2026-07-30
**arXiv**: [2607.22956](https://arxiv.org/abs/2607.22956)
**作者**: Bo Jiang et al.
**会议**: SC26 (The International Conference for High Performance Computing, Networking, Storage and Analysis)
**领域**: 粒子渲染 / 体积渲染 / 3D Gaussian Splatting

---

## 核心创新点

### 问题
- 大规模粒子模拟产生数亿个粒子
- 存储、传输和交互可视化压力大
- 现有有损压缩器（如 SZ3）在数据空间操作，无法保证下游可视化保真度

### 解决方案：ParticleGS
基于 3D Gaussian Splatting (3DGS) 的可视化感知压缩框架，直接优化渲染图像质量

### 技术要点

1. **多阶段多轨道训练管道** (Multi-stage, Multi-orbit Training Pipeline)
   - 处理大规模粒子数据

2. **VizMapper 网络**
   - 轻量级网络
   - 从单一训练模型适配用户指定的可视化参数
   - 推理时动态调整

3. **空间块训练** (Spatial Block Training)
   - KD-tree 分解
   - 全局微调

---

## 性能指标

| 指标 | 数值 |
|------|------|
| 测试数据 | 281M 粒子 HACC 宇宙模拟 |
| 压缩比 | 65x |
| PSNR | 30.03 dB |
| 对比 SZ3 | 提升 5-8 dB (相同压缩比) |
| 渲染速度 | 662 FPS (单 GPU) |
| 相对 ParaView 加速 | >2,300x |

### 泛化能力
- 无需调优即可泛化到其他 HACC 区域
- 可泛化到 dark-matter-only FIRE-2 模拟

---

## 渲染方法

- **类型**: 粒子渲染 + 3D Gaussian Splatting
- **技术**: 
  - 3DGS 表示
  - 可视化感知压缩
  - 多轨道训练

---

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐ (科学可视化场景)
- **风格化支持**: 否 (专注于科学可视化)

---

## 性能预期

- **帧率**: 662 FPS (远超实时)
- **GPU 需求**: 单 GPU
- **内存占用**: 相比原始数据降低 65x

---

## 实现建议

- **着色器复杂度**: 中
- **管线要求**: 3DGS 标准管线
- **推荐度**: ✅ 强烈推荐

### 适用场景
1. 科学可视化
2. 宇宙模拟粒子渲染
3. 大规模粒子数据压缩与交互

### 优势
- 高压缩比下保持视觉质量
- 实时渲染速度
- 无需针对新数据重新训练
- 可视化参数可调

### 局限
- 针对科学粒子数据设计
- 需要粒子模拟数据作为输入

---

## 相关工作

- SZ3 (传统有损压缩)
- 3D Gaussian Splatting (3DGS)
- ParaView (科学可视化)

---

## 代码资源

- 期待开源代码发布 (arXiv PDF 中应包含链接)

---

## 标签

#粒子渲染 #体积渲染 #3DGS #科学可视化 #压缩 #SC26 #2026

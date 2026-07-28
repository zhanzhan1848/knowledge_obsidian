# arXiv cs.GR 流体相关论文 (2026-07-28)

> 日期: 2026-07-28
> 来源: arXiv cs.GR 最近提交
> 关键词: fluid rendering, particle system, volume rendering

---

## ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering

**arXiv**: https://arxiv.org/abs/2607.22956
**作者**: Bo Jiang et al.
**会议**: SC26

### 核心创新
- 大规模粒子模拟数据(数亿粒子)压缩与渲染
- 基于3D Gaussian Splatting (3DGS)的可视化感知压缩框架
- 65x压缩比下达到30.03 dB PSNR，比SZ3高5-8 dB
- 单GPU 662 FPS渲染速度，比ParaView快2300x+

### 技术细节
- **多阶段多轨道训练管道**
- **VizMapper**: 轻量网络，推理时适配用户指定的可视化参数
- **空间块训练**: KD-tree分解 + 全局微调
- **应用**: HACC宇宙学模拟(2.81亿粒子)、FIRE-2暗物质模拟

### 渲染方法
- 类型: 粒子渲染
- 技术: 3D Gaussian Splatting

### 视觉质量
- 逼真度: ⭐⭐⭐⭐ (科学可视化)
- 压缩质量: 30.03 dB PSNR @ 65x

### 性能预期
- 压缩比: 65x
- 渲染帧率: 662 FPS (单GPU)
- 速度提升: 2300x+ vs ParaView

### 推荐度: ✅ (大规模粒子数据可视化)

---

## Real-Time Global Illumination via Sparse Radiance Probes

**arXiv**: https://arxiv.org/abs/2607.20384
**作者**: Rouli Freeman
**日期**: 2026-07-22

### 核心创新
- 将Radiance Cascades适应到精确实时3D漫反射全局光照
- 使用稀疏hashmap存储世界空间探头
- **Ray Splitting**: 从可见表面追踪光线，计算级联贡献

### 技术细节
- **方法**: Split Radiance Cascades
- **类型**: 全局光照
- **特点**: 单帧和时域累积上下文均支持

### 渲染方法
- 类型: 体积光照
- 技术: Radiance Probes + Ray Tracing

### 推荐度: ✅ (实时GI)

---

## Curly Hair Simulation using Curly Finite Elements

**arXiv**: https://arxiv.org/abs/2607.22103
**作者**: Zhendong Wang et al.
**日期**: 2026-07-24

### 核心创新
- 紧耦合宏观发丝变形与高频几何细节(波浪、螺旋)
- 将发丝分解为curly elements (rod-base + 解析高频皱纹)
- 曲率能量分裂方案: 拉伸、屈曲、弯曲分离
- 混合碰撞处理 + guide-strand插值

### 技术细节
- **方法**: Curly Finite Elements
- **类型**: 粒子/丝线模拟
- **应用**: 卷发模拟

### 渲染方法
- 类型: 粒子渲染
- 技术: 有限元 + 粒子碰撞

### 推荐度: ⚠️ (毛发模拟，非流体但相关)

---

## 相关链接
- arXiv cs.GR: https://arxiv.org/list/cs.GR/recent

---
*整理: 鸭血 (Doumiao) | 计算机图形学流体渲染专家*

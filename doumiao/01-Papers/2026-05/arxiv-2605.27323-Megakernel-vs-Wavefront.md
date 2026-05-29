# Megakernel vs Wavefront GPU Path Tracing

## 论文信息
- **arXiv**: [2605.27323](https://arxiv.org/abs/2605.27323)
- **日期**: 2026-05-26
- **作者**: Rafael Padilla et al.
- **主题**: GPU 路径追踪性能分析

---

## 核心贡献

### 1. 算法比较
对比两种光线追踪算法:
- **前向路径追踪 (PT)**: 每线程追踪单条路径到完成 → Megakernel 方式
- **波前路径追踪 (WPT)**: 维护状态缓冲，在专用核之间分配路径段

### 2. 性能结果
- **WPT 比 PT 快约 16%**
- 归因于**更好的缓存局部性**

### 3. 分析
- 使用 NVIDIA Nsight Graphics 追踪分析
- 通信和内存延迟是限制因素
- 同步开销显著
- GPU 各单元未达最大吞吐量

### 4. 优化方向
- 算法改进建议
- 实际应用前景

---

## 技术细节

### PT vs WPT 架构
```
PT (Megakernel):
  每个线程 → 单条完整路径 → 阻塞等待

WPT (Wavefront):
  状态缓冲 → 专用 kernel 调用 → 路径段并行追踪
```

### 性能瓶颈
- 内存延迟
- 同步开销
- 缓存效率

---

## 渲染相关性

### 体积/流体渲染应用
- 路径追踪是高质量体积渲染的核心
- WPT 优化对实时体积渲染有借鉴意义
- 缓存局部性优化可应用于粒子体积渲染

### 体积渲染技术
- Ray Marching 优化
- 体积路径追踪
- 光束效果渲染

### 标签
#path-tracing #GPU #performance #volume-rendering #optimization

---

*整理: Doumiao - 2026-05-29*
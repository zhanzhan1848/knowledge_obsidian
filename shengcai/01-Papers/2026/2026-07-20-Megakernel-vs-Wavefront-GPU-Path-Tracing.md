---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, path-tracing, GPU, real-time-rendering, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.27323
---

# Megakernel vs Wavefront GPU Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Megakernel vs Wavefront GPU Path Tracing |
| **作者** | Rafael Padilla, Kyle Webster, Austin H Kim (University of Utah) |
| **发表** | arXiv cs.GR, May 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.27323) |
| **DOI** | https://doi.org/10.48550/arXiv.2605.27323 |
| **代码** | - |

---

## 核心贡献

> 比较两种GPU路径追踪架构的性能差异，发现波前路径追踪比巨型内核路径追踪快约16%

1. 在统一的Vulkan渲染器中实现了前向巨型内核路径追踪(PT)和波前路径追踪(WPT)
2. 使用NVIDIA Nsight Graphics进行详细性能分析，揭示性能差异的来源
3. 发现WPT的加速来自于更好的缓存局部性，而非更高的原始算力利用率

---

## 技术方案

### 核心思想

两种GPU路径追踪架构的对比：
- **巨型内核PT**：每个线程trace一条完整路径，单kernel完成
- **波前PT**：将路径追踪分为多个阶段(ray generation, intersection, shading, accumulation)，分批处理

### 关键技术

| 技术 | 说明 |
|------|------|
| Vulkan inline ray queries | 硬件加速光线追踪 |
| Slang shaders | 用于路径追踪的着色器语言 |
| OpenPBR | Adobe物理渲染材质模型 |
| Stream compaction | 通过原子索引列表和间接调度减少空闲线程 |

### Light Transport Equation

```math
L(x,\omega_o) = L_e(x,\omega_o) + \int_{S^2} L_i(x,\omega_i) f(x,\omega_o,\omega_i) |n \cdot \omega_i| d\omega_i
```

### Monte Carlo Estimator

```math
\hat{I} = \frac{1}{N} \sum_{i=1}^{N} \frac{f(X_i)}{p(X_i)} \approx \int_\Omega f(x) dx
```

---

## 实验结论

- **硬件**: NVIDIA RTX 3060 Ti
- **场景**: A Beautiful Game (Khronos glTF sample)
- **结果**:
  - WPT: 73.6 FPS (13.58 ms/frame)
  - PT: 64.7 FPS (15.47 ms/frame)
  - **加速比: ~16%**

### GPU Throughput对比

| 指标 | Megakernel PT | Wavefront PT |
|------|---------------|--------------|
| SM Throughput | 37.1% | 34.1% |
| RT Core Throughput | 16.9% | 11.7% |
| VRAM Throughput | 19.3% | **41.4%** |
| L2 Cache Throughput | 15.8% | **22.5%** |

---

## 局限性

1. 两种实现都未达到最大GPU吞吐量，通信和内存延迟是限制因素
2. 测试场景相对简单，更复杂场景的效果有待验证
3. 未探索混合方法

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 在现代GPU上WPT可获得10-20%性能提升
- **适用场景**: 实时渲染、交互式应用、离线渲染
- **优化方向**: 队列调度、内存布局、混合方法

---

## 相关工作

- Laine et al., "Megakernels considered harmful: wavefront path tracing on GPUs" (HPG 2013)
- Christensen et al., "RenderMan XPU: A Hybrid CPU+GPU Renderer" (CGF 2025)
- Pharr et al., "Physically Based Rendering, Fourth Edition" (2023)

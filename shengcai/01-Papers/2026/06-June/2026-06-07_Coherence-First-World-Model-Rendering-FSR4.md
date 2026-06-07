---
tags: [渲染, 实时渲染, 帧生成, 世界模型, 2026]
date: 2026-06-07
status: 待读
---

# A Compute-Normalized Proof of Concept for Coherence-First World-Model Rendering with Model-Guided FSR4 Frame Generation

## 元信息
| 标题 | Coherence-First World-Model Rendering with FSR4 |
| 作者 | Paweł Katarzyński |
| 链接 | [arXiv:2606.02586](https://arxiv.org/abs/2606.02586) |
| 领域 | cs.GR |
| 发表 | 2026-05-11 |

## 核心贡献

1. **Coherence-First 策略**：优先时序一致性而非帧率，在有限推理预算下分配计算资源
2. **15FPS锚帧 + 30FPS重建**：在15 FPS 时间线生成高上下文锚帧，用潜在增量运动引导和合成深度重建到 30 FPS
3. **与 FSR4 DX12 桥接**：通过 ONNX Runtime + DirectML 在 Windows fallback栈上实现
4. **对比 Cadence-First**：证明 coherence-first 在森林/剑/沙漠/雪场景中保持路径几何、物体一致性、大轮廓和深度分层

## 技术方案

### 两种策略对比
| 策略 | 锚帧帧率 | 重建帧率 | 优势 | 劣势 |
|------|----------|----------|------|------|
| **Coherence-First** | 15 FPS | 30 FPS | 时序稳定、几何保持 | 原始帧率较低 |
| **Cadence-First** | ~30 FPS 原生 | - | 高帧率 | 早期亮度漂移、几何失真 |

### 关键方法
```
Waypoint-1.5 (Overworld) + WorldEngine runtime
    ↓
ONNX Runtime + DirectML (Windows fallback)
    ↓
FSR4 DX12 bridge
    ↓
潜在增量运动引导 (latent-delta motion guidance)
    ↓
合成深度 (synthesized depth)
```

### 评估指标
- LPIPS (Learned Perceptual Image Patch Similarity) 优先 coherence-first
- 局部非单调性：更多上下文和去噪不一定改善质量

## 实验结论

- Coherence-first 分支在森林、剑、沙漠、雪场景中均优于 baseline
- 保持路径几何、物体一致性、大轮廓、深度分层
- 计算归一化（在相近 GPU/时间尺度下比较，非精确 FLOP 对等）

## 局限性

- 非成熟实时渲染器，是有限推理预算下的概念验证
- 剑场景探测显示局部非单调性（更多上下文 ≠ 更好质量）

## 相关工作
[[FSR4]], [[Real-time Rendering]], [[World Model]], [[Frame Generation]]

## 标签
#渲染 #实时渲染 #帧生成 #世界模型 #AMD #FSR4
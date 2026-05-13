# 每日论文搜索报告

**日期**: 2026-05-13
**Agent**: 豆苗 (doumiao)
**搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH/SIGGRAPH Asia 会议
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 搜索结果摘要

### 流体渲染相关论文

本次搜索在 arXiv cs.GR (2026-05-12 ~ 2026-05-13) 共发现 **20+ 篇** 新论文，其中与流体渲染领域直接相关的有：

#### 1. LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction
- **arXiv**: [2605.09299](https://arxiv.org/abs/2605.09299)
- **日期**: 2026-05-10
- **领域**: 流体重建 / 高斯泼溅
- **核心创新**: 
  - Divergence-Free Kernel 表示参数化速度场，保证流体不可压缩性
  - Lagrange 3DGS 驱动对流，传输一致性 + 物理有效性内在保证
  - Sliding Window 机制优化长时间梯度传播
- **标签**: `fluid-reconstruction` `gaussian-splatting` `divergence-free` `velocity-field`

#### 2. Elemental Alchemist: Semantic Control of Particle Systems
- **arXiv**: [2605.10014](https://arxiv.org/abs/2605.10014)
- **日期**: 2026-05-11
- **会议**: ACM DIS 2026
- **领域**: 粒子系统语义控制
- **核心创新**:
  - Contextual brush palette 根据场景上下文生成工具
  - Generative control panel 将技术参数抽象为语义/概念控制
  - 支持将高层创作意图（如"让火看起来愤怒"）转化为粒子参数
- **标签**: `particle-system` `VFX` `semantic-control` `generative-interface`

#### 3. ToF ReSTIR: Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling
- **arXiv**: [2605.11536](https://arxiv.org/abs/2605.11536)
- **日期**: 2026-05-12
- **领域**: 体积渲染 / 光传输
- **核心创新**:
  - Path-length-aware shift mapping 满足时域门控约束
  - 受 ReSTIR 启发，适用于瞬态光传输和ToF成像
  - 交互帧率支持时间门控和瞬态渲染
- **标签**: `volume-rendering` `time-of-flight` `ReSTIR` `Monte-Carlo`

#### 4. CAGS: Color-Adaptive Volumetric Video Streaming with Dynamic 3DGS
- **arXiv**: [2605.09279](https://arxiv.org/abs/2605.09279)
- **日期**: 2026-05-10
- **会议**: SIGGRAPH 2026
- **领域**: 体积视频流 / 3DGS
- **核心创新**:
  - Color-Adaptive 方案：VQ建立LoD + 低分辨率参考图校正色偏
  - 服务端渲染参考图 + 客户端色复原
  - 带宽波动下 PSNR 提升 5~20 dB
- **标签**: `volumetric-video` `3DGS` `streaming` `SIGGRAPH2026`

---

### 领域相关性评估

| 论文 | 相关性 | 说明 |
|------|--------|------|
| LagrangianSplats | ⭐⭐⭐⭐⭐ | **直接相关**：流体重建，速度场 + 高斯泼溅，与我的研究直接相关 |
| Elemental Alchemist | ⭐⭐⭐⭐ | **高度相关**：粒子系统语义控制，用于VFX可视化 |
| ToF ReSTIR | ⭐⭐⭐⭐ | **相关**：体积光传输渲染，时域技术可应用于体积效果 |
| CAGS | ⭐⭐⭐⭐ | **相关**：SIGGRAPH 2026 体积视频，高斯泼溅在流体中的应用 |

---

## 观察与趋势

1. **高斯泼溅用于流体**: LagrangianSplats 将 Divergence-Free 约束与 3DGS 结合，是流体渲染的重要进展

2. **粒子系统语义控制**: Elemental Alchemist 展示从高层意图到参数的映射，对艺术导向流体效果有意义

3. **SIGGRAPH 2026 论文持续公开**: CAGS 等论文已公开，属于体积视频研究

4. **时域渲染技术**: ToF ReSTIR 等工作将 ReSTIR 扩展到瞬态渲染，对体积光效果有启发

---

## 笔记创建

已为以下论文创建结构化笔记：
- `2026-05-13-LagrangianSplats-Divergence-Free-Fluid-Reconstruction.md`
- `2026-05-13-Elemental-Alchemist-Particle-System-Semantic-Control.md`

---

**下次搜索时间**: 2026-05-14 02:00 UTC
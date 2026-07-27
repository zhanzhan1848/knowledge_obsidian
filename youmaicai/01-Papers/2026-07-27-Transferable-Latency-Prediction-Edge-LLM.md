# Transferable Latency Prediction for Fast LLM Screening on Heterogeneous Edge Devices

## 元信息
| 标题 | Transferable Latency Prediction for Fast LLM Screening on Heterogeneous Edge Devices |
|------|------|
| 作者 | Xiaolong Tu, Vinod K. Mishra, Venkat R. Dasari, Anu G. Bourgeois, Haoxin Wang |
| 链接 | [原文](https://arxiv.org/abs/2607.21602) |
| arXiv | arXiv:2607.21602 |
| 领域 | cs.AI |

## 核心贡献

1. **问题**: 在异构边缘设备上部署 LLM 时，推理延迟受模型架构、提示行为、运行时后端、硬件利用率、DVFS 和热变化等多因素影响
2. **方案**: 提出运行时感知延迟预测框架，用于部署导向的 LLM 选择
3. **核心方法**: 
   - 将每个推理请求表示为 hardware-runtime-model-prompt 配置
   - 将推理分离为 prefill 和 decode 阶段
   - 通过 gated prediction model 自适应融合静态描述符和动态硬件遥测

## 实验结果

| 设备 | 指标 | 基线 | +Full Predictor | 提升 |
|------|------|------|-----------------|------|
| Pixel 8 | Total Latency R² | 0.953 | **0.960** | +0.007 |
| Pixel 8 | Decode Latency R² | 0.957 | **0.973** | +0.016 |
| Pixel 8 Pro | Prefill Latency R² | -1.383 | **0.966** | 大幅提升 |
| Pixel 8 Pro → Pixel 8 | Cross-device Total R² | -0.974 | **0.940** | 显著改善 |

| 设备 | SmolLM2 速度 |
|------|-------------|
| Orange Pi 5 Pro | 8.42 tokens/s |
| RTX 3090-class GPU | 64.38 tokens/s |

- **跨设备迁移**: 标定后 Pixel 8 Pro → Pixel 8 的 total R² 从 -0.974 提升到 0.940

## 核心创新点

- **运行时感知**: 融合静态和动态特征
- **跨设备迁移**: 轻量级标定实现高效跨设备迁移
- **异构分析**: 揭示延迟高度依赖于设备和运行时

## 局限性

- 主要在小规模模型 (SmolLM2) 上验证
- 对超大规模 LLM 的适用性待验证
- 框架复杂度随设备类型增加

## 建议
- **是否推荐使用**: 是
- **适用场景**: 边缘设备 LLM 部署、AIoT、移动端模型选择
- **备注**: 实用的 LLM 推理优化方向

---

> 💡 归档时间: 2026-07-27 | 来源: arXiv cs.AI

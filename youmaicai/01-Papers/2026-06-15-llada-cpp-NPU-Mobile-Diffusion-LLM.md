# Efficient On-Device Diffusion LLM Inference with Mobile NPU (llada.cpp)

## 元信息
| 标题 | Efficient On-Device Diffusion LLM Inference with Mobile NPU |
|------|------|
| 作者 | Tuowei Wang, Yanfan Sun, Ju Ren |
| 链接 | [原文](https://arxiv.org/abs/2606.13740) |
| arXiv | arXiv:2606.13740 |
| 领域 | cs.LG |
| 日期 | 2026-06-15 |

## 核心贡献
1. 提出 **llada.cpp**：首个 NPU-aware 移动端 diffusion LLM（dLLM）推理框架
2. 三个核心技术：Multi-Block Speculative Decoding、Dual-Path Progressive Revision、Swap-Optimized Memory Runtime
3. LLaDA-8B 延迟降低 **17x-42x**（vs CPU baseline），同时保持生成质量

## 背景：Diffusion LLM 的移动端挑战
Diffusion 大语言模型（dLLM）通过并行去噪多 token 加速生成，适合延迟敏感的移动端推理。但存在三个核心挑战：
1. **Token Commitment 收缩**：每 block 工作负载缩小
2. **Token Revision**：KV cache 重用复杂
3. **NPU 地址空间限制**：重映射和数据传输开销

## llada.cpp 三个核心技术

### 1. Multi-Block Speculative Decoding
用投机未来 block token 填充当前 block 后期萎缩的工作负载

### 2. Dual-Path Progressive Revision
- 已提交 token 保持可修订直到稳定
- 不稳定 token 通过 CPU 路径刷新，不阻塞 NPU 密集计算

### 3. Swap-Optimized Memory Runtime
- 压缩 NPU 可见地址布局
- 重叠数据调度与 NPU 计算，减少重映射和传输开销

## 实验结果
- 多硬件平台和 dLLM 工作负载评估
- **LLaDA-8B**：延迟降低 17x-42x vs CPU baseline
- 保持生成质量

## 局限性
- 依赖特定 NPU 硬件特性
- dLLM 生态工具链成熟度

## 建议
- **适用场景**：移动端 LLM 部署、边缘 AI、延迟敏感应用
- **推荐指数**：⭐⭐⭐⭐（移动端 LLM 推理工程突破）
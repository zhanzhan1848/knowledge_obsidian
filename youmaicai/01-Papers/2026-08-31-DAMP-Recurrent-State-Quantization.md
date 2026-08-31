# DAMP: Decay-Aware Mixed-Precision Recurrent-State Quantization

## 元信息
| 标题 | DAMP: Decay-Aware Mixed-Precision Recurrent-State Quantization |
|------|------|
| 作者 | Tao Zhang, Jianchao Tan, Pingwei Sun, Yanqi Yu, Zixu Jiang, Yuchen Xie, Xunliang Cai, Ziqian Zeng |
| 链接 | [原文](https://arxiv.org/abs/2608.27513) |
| arXiv | arXiv:2608.27513 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. 首个研究 GDN/KDA 语言模型循环状态后训练量化的工作
2. 发现均匀量化对复杂推理任务效果差（INT8/FP8 已降低精度）
3. 提出 DAMP：基于量化误差能量和衰减持久性的混合精度方法

## 问题背景
- Softmax attention 的 KV cache 随序列长度增长
- Gated DeltaNet (GDN) 和 Kimi Delta Attention (KDA) 用固定大小循环状态替代 KV cache
- 循环状态通常以 FP32 存储，消耗大量 GPU 内存且更新是内存带宽受限的

## 关键发现
1. **均匀量化 trade-off 差**: INT8/FP8 已损害复杂推理任务精度，INT4/NVFP4 接近零
2. **量化误差能量集中**: 大部分误差集中在少量通道
3. **衰减强度稳定**: 状态通道的相对衰减强度在 prompts 和任务间保持稳定

## 方法: DAMP
```
离线校准阶段:
  1. 识别高风险通道（量化误差能量 + 衰减持久性）
  2. 高风险通道 → 高精度存储
  3. 其余通道 → INT8

推理阶段:
  4. 循环状态更新 kernel 读取混合精度状态
  5. 动态重建 FP32 进行计算
```

### 核心指标
- **9.9 bits per state value** 时，精度接近 FP32 基线
- 循环状态存储减少 **69.1%**
- 循环状态更新 kernel 加速最高 **2.01x**
- 全模型 TPOT 降低最高 **10.9%**

## 实验结果
| 模型 | 基准 | DAMP (9.9 bits) |
|------|------|----------------|
| Qwen3.6-35B | FP32 baseline | 接近基线 |
| Kimi-Linear-48B | FP32 baseline | 接近基线 |

评测基准涵盖：数学推理、一般推理、代码生成（共6项）

## 建议
- **是否推荐使用**: 是
- **适用场景**: 长序列推理、边缘部署、内存受限场景
- **研究方向**: 与其他量化方法结合、更细粒度的通道选择

---
*关键词*: KV cache量化, GDN, KDA, 混合精度, LLM推理优化
*研究领域*: cs.LG, cs.AI

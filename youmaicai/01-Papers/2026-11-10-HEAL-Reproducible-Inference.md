---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Numerical Precision, Inference Systems, Reproducibility]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2606.21023
arxiv: 2606.21023
---

# Demystifying Numerical Instability in LLM Inference: Achieving Reproducible Inference for Mission-Critical Tasks with HEAL

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Demystifying Numerical Instability in LLM Inference: Achieving Reproducible Inference for Mission-Critical Tasks with HEAL |
| **作者** | 未提供（UCLA Systems，详见原文） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2606.21023) |
| **arXiv** | arXiv:2606.21023 |
| **分类** | cs.LG |
| **代码** | https://github.com/ucla-systems/HEAL |

---

## 核心贡献

> 跨 GPU 的输出不可复现根源是 kernel 边界的截断误差，而非算术本身；HEAL 用 INT16 量化守住 KV cache、用代数误差补偿在 16-bit Tensor Core 上合成高精度 GEMM，在任务级达到 FP32 的复现性而性能开销最多降低 6.0×。

1. **根因定位**：SASS 级 profiling 表明主流 kernel 的内部算术本就在 FP32 进行（GEMM 用 `HMMA.16816.F32.BF16`、Softmax/RMSNorm 显式转 FP32 寄存器），因此 $\epsilon_{\mathrm{arith}}$ 受 FP32 machine epsilon（1.19e-7）严格界住；真正的不稳定来源是 kernel 边界处寄存器下采样的**截断误差** $\epsilon_{\mathrm{trunc}}$，它沿网络深度累积，最终移动最终 logprob、翻转 top-1 token。
2. **HEAL（Hybrid Error ALleviation）**：Attention 侧对 Q/K/V 张量做 **INT16 量化**（浮点格式的位宽未被充分利用；INT16 的理论 MSE 上界严格优于 FP16，因 $\mathbb{E}[\mathrm{MSE}_{\mathrm{FP16}}]/\mathbb{E}[\mathrm{MSE}_{\mathrm{INT16}}]>256\sigma^2/M^2$），不扩大 KV cache 物理占用；GEMM 侧用**代数误差补偿**把输入拆成 16-bit 主项 + 残差误差项，分别用标准 16-bit 输入算两次矩阵乘，全程跑在高吞吐 16-bit Tensor Core 上。
3. **MCR-Bench**：面向医疗/法律/金融的 4,500 道高风险推理题，专门评测任务级复现性。
4. **开销**：HEAL 的 TPOT 开销仅 70%–120%，而全局 FP32 管线为 4.2–13.1×（H100 BF16 相对 FP32 有 14.8× 吞吐优势，AMD MI300X 为 8×）。

---

## 技术方案

### 核心思想
工程界通常用贪心解码消除算法随机性，但在 16-bit 精度下跨异构 GPU 仍会出现灾难性输出分歧。已有两条补救路线都有硬伤：确定性归约顺序（框架级 deterministic 模式、CUDA backward compatibility、专用 kernel）把部署限制在狭窄执行路径、禁用现代硬件特性、牺牲吞吐且跨厂商不可移植；全局 FP32 管线虽然理论上通用，但 TPOT 最多退化 13.1×，且 KV cache 上转使显存翻倍。本文通过 SASS profiling 证明这一「全有或全无」的代价是不必要的：非复现性不是计算问题，而是 **kernel 边界问题**——关键证据是手工在每个 kernel 边界注入截断的全 FP32 管线中，答案翻转率随保留的有效位增加而单调下降，且不需要 FP32 的全部 23 位尾数就已接近完美复现，说明只需把噪声压到「翻转阈值」以下。同时作者建立三个互相独立的概念：跨硬件复现性、与 FP32 锚点的一致性、任务准确率——HEAL 不改变准确率，只防止截断噪声在不同设备上翻转确定性预测。

### 关键公式
```math
\textbf{算术误差 vs 截断误差:}\quad
\epsilon(\mathcal{F}) = \text{精确算术误差} + \underbrace{\epsilon_{\mathrm{trunc}}}_{\text{kernel 边界下采样}}
,\qquad
\frac{\mathbb{E}[\epsilon_{\mathrm{arith}}^2]}{\mathbb{E}[(\hat{y}-y)^2]} \to 0
\quad(\text{因算术原生为 FP32})

\textbf{误差累积与翻转:}\quad
\text{Answer Flip Rate} = f\!\left(\text{累积数值误差}\right),
\qquad \text{FP32 machine epsilon} = 1.19\times10^{-7}
\quad(\text{TF32 截断后为 } 9.77\times10^{-4})

\textbf{INT16 量化:}\quad
\mathcal{Q}_{\mathrm{INT16}}(\bm{X})=\mathrm{Round}\!\left(\frac{(2^{15}-1)\bm{X}}{\max|\bm{X}|}\right),
\qquad
\frac{\mathbb{E}[\mathrm{MSE}_{\mathrm{FP16}}]}{\mathbb{E}[\mathrm{MSE}_{\mathrm{INT16}}]}
> 256\frac{\sigma^{2}}{M^{2}}
\ \Longrightarrow\ \text{70\% 的 Q,K,V 张量理论 MSE 至少降 50\%（均匀分布时 78\%）}

\textbf{代数误差补偿（高精度 GEMM）:}\quad
\bm{X} = \bm{X}_{16} + \bm{X}_{\mathrm{res}},
\qquad
\bm{X}\bm{W} \approx \bm{X}_{16}\bm{W}_{16} + \bm{X}_{\mathrm{res}}\bm{W}_{16}
\quad(\text{两次 16-bit GEMM，全部落在 Tensor Core 上})

\textbf{精度增益（保有效位）:}\quad
\text{Flip Rate} \downarrow \ \text{单调} \quad \text{随保留尾数位数增加}
\end{}
```

### 关键组件
- **SASS 级 profiling**：分析 A100/H100 上 FlashAttention、TritonAttention、GEMM、RotaryEmbedding、Softmax、RMSNorm 的浮点指令构成；结论在 AMD GPU 上同样成立。
- **INT16 Q/K/V 量化**：解决「Attention 上转导致 KV cache 显存翻倍」的墙；溢出风险低（实测最大绝对值 <1024，占 FP16 可表示范围 <1/64；偶发通道用定向 rescaling 处理）。
- **代数误差补偿 GEMM**：解决「上转导致放弃 16-bit Tensor Core」的墙，绕过 14.8×（H100）/8×（MI300X）吞吐损失。
- **H100 FP32 确定性锚点 + Teacher Forcing**：排除自回归分支干扰，逐层追踪低精度执行相对锚点的偏离。
- **MCR-Bench**：4,500 道医疗/法律/金融高风险推理题，评测任务级复现性。
- **三概念分离的评测口径**：跨硬件复现性 / 与 FP32 一致性 / 任务准确率，明确 HEAL 不改准确率。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| HEAL 复现性 | 与 FP32 基线在下游任务上达到**同等水平** |
| 性能开销 | FP32 管线 TPOT 增加 **4.2–13.1×**；HEAL 仅 **70%–120%** |
| 摘要口径开销降低 | 最多 **6.0×** |
| MCR-Bench | 4,500 道医疗/法律/金融高风险推理题 |
| 覆盖模型 | Qwen3-8B/14B/32B、Llama-3.1-8B-Instruct、DeepSeek-R1-Distill-Qwen-14B（主文为 Qwen3-14B） |
| INT16 量化精度收益 | 70% 的 Q/K/V 张量理论 MSE 至少降低 50%（均匀分布下 78%） |
| 硬件吞吐对比 | NVIDIA H100 BF16 相对 FP32 高 14.8×；AMD MI300X Matrix Core 高 8× |
| 实测溢出 | 最大绝对值 <1024，占 FP16 可表示范围 <1/64；异常通道占 0.1%–1% |
| 精度增益实验 | 在全 FP32 管线手工注入边界截断后，答案翻转率随保留尾数位数单调下降 |

---

## 局限性

- HEAL 依赖 INT16 量化，理论精度收益建立在高斯/均匀分布假设上，实际张量分布可能偏离。
- 只覆盖 Attention 与 GEMM 两处主要瓶颈，其他算子（Norm、RoPE 等）仍走 FP32，残余误差未完全消除。
- MCR-Bench 为作者自建，其「高风险」样本的挑选与标注过程可能引入乐观偏差。
- 结果为特定 GPU 代际（NVIDIA H100/A100、AMD）上的结论，对新架构（如 FP8/FP4 加速器）需重新评估。
- 「与 FP32 锚点一致」不等于「跨所有硬件绝对可复现」，跨厂商的实现差异仍可能存在。
- 需要改动推理内核（INT16 量化 + 补偿 GEMM），工程侵入性较高。

---

## 建议

- **是否推荐使用**：是（对金融/医疗/法律等要求输出可复现的推理部署有直接价值，且代码已开源）
- **适用场景**：多 GPU/多厂商混合部署的任务级可复现性保障；审计与合规场景；对成本敏感但要求稳定输出的生产服务。
- **值得复现**：是（MCR-Bench 可直接用于评估自研部署的复现性）

---

**相关论文**：[[vLLM]], [[FlashAttention]], [[Tensor-Cores]], [[FP16-Numerical-Stability]]
**主题标签**：#LLM #NLP #Numerical-Precision #Inference-Systems #Reproducibility

# Where Reliability Lives in Vision-Language Models

**arXiv**: [2605.08200](https://arxiv.org/abs/2605.08200) | cs.AI/cs.CV  
**会议**: ICLR 2026 Workshop on Multimodal Reasoning  
**作者**: (见原论文)  
**代码**: [GitHub](https://github.com/itsloganmann/VLM-Reliability-Probe)

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Where Reliability Lives in Vision-Language Models: A Mechanistic Study of Attention, Hidden States, and Causal Circuits |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08200) |
| arXiv | arXiv:2605.08200 |
| 代码 | [VLM-Reliability-Probe](https://github.com/itsloganmann/VLM-Reliability-Probe) |

---

## 核心贡献

直接检验「注意图越 sharp → 模型越可靠」的 Attention-Confidence 假设。在三个开源 VLM 家族（LLaVA-1.5、PaliGemma、Qwen2-VL，3-7B 参数）上开发统一的机械探针管道 VLM Reliability Probe (VRP)。

---

## 主要发现

### 1. 注意结构几乎不能预测正确性

| 指标 | 值 |
|------|-----|
| R_pb(C_k, y) | 0.001 (95% CI [-0.034, 0.036]) |
| R_pb(H_s, y) | -0.012 (95% CI [-0.047, 0.024]) |
| 样本量 | n = 3,090 |

但注意对特征提取**因果必要**：top-30% patch 遮蔽使准确率下降 **8.2-11.3 pp** (p<0.001)

→ 注意是必要的但不足以预测可靠性

### 2. 隐藏态是更好的可靠性指标

- 单隐藏态线性探针在 POPE 基准上对 2/3 VLM 家族达到 **AUROC > 0.95**
- Self-consistency at K=10 是最强的行为预测器（10x 推理成本）

### 3. 架构分裂：晚融合 vs 早融合

**晚融合 LLaVA**:
- 可靠性集中在脆弱的 late 瓶颈
- top-5 probe-neuron 消融 → **-8.3 pp** 物体识别准确率

**早融合 PaliGemma & Qwen2-VL**:
- 可靠性广泛分布
- 可承受 ~50% peak-layer 隐藏维度损失，**≤1 pp** 降级

---

## 实用建议

| 场景 | 建议 |
|------|------|
| 可靠性评估 | 使用 hidden-state geometry 而非 attention maps |
| 监控设计 | 关注 layer-wise margin formation 和稀疏 late-layer circuits |
| 架构选择 | 早融合 VLM 在可靠性上优于晚融合 |

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐⭐
- **必读原因**: 推翻广泛假设（attention=confidence），为 VLM 可靠性提供机械论解释
- **适用场景**: VLM 评估、可信 AI、多模态系统设计

---
*🥬 油麦菜 | 2026-05-12*
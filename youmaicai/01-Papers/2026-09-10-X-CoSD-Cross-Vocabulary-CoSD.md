# 🥬 LLM 论文分析：X-CoSD

## 基本信息
- **标题**: X-CoSD: Communication-Efficient Cross-Vocabulary Collaborative Speculative Decoding
- **作者**: Jaeduk Lee, Wan Choi
- **发表**: —
- **链接**: [arXiv:2609.09166](https://arxiv.org/abs/2609.09166)
- **arXiv**: arXiv:2609.09166v1
- **类别**: cs.CL, cs.DC, cs.LG

## 核心贡献

1. **跨词表 CoSD 框架**: 首次解决 SLM（设备端小语言模型）和 LLM（服务端大模型）词表不同构时的协作推测解码问题
2. **混合重采样 (Hybrid Resampling, HR)**: 将 residual resampling 拆分到设备端公共词表区域和服务端 LLM 专有词表区域
3. **X-CoSD-E 增强变体**: 服务端重采样 + 设备端验证 (SR-DV)，只需传输候选 token 及其概率

## 核心方法

**问题背景**:
- 现有 CoSD 方法假设 SLM 和 LLM 共享词表
- Residual resampling 需要设备-服务端传输完整 token 分布，通信开销大

**X-CoSD 思路**:
```
设备端: 公共词表区域的 residual resampling
服务端: LLM 专有词表区域的采样
→ 仅需传输公共词表区域分布
```

**X-CoSD-E 思路**:
```
服务端: 仅发送替换候选（从服务端 LLM 采样）+ 对应概率
设备端: 本地验证
→ 通信量进一步降低
```

## 理论保证

- 证明 X-CoSD 和 X-CoSD-E 均保持服务端 LLM 分布不变（lossless）

## 实验结果

- 显著提升 token 生成速度，同时保持与服务端 LLM 相当的生成质量

## 局限性

- 实现复杂度增加（需要处理异构词表）
- 需要对服务端和设备端均做修改

## 建议
- **是否推荐使用**: 是（对部署异构词表系统的场景）
- **适用场景**: 边缘计算 + 云端协同的 LLM 推理加速
- **亮点**: 首次系统解决跨词表通信效率问题

---

标签: #推测解码 #LLM推理 #边缘计算 #协作推理 #分布式系统

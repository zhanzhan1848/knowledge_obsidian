# One Word at a Time: Incremental Completion Decomposition Breaks LLM Safety

## 元信息
| 标题 | One Word at a Time: Incremental Completion Decomposition Breaks LLM Safety |
| 作者 | Samee Arif, Naihao Deng, Zhijing Jin, Rada Mihalcea |
| 链接 | [原文](https://arxiv.org/abs/2604.25921) |
| arXiv | arXiv:2604.25921 |
| 领域 | cs.CL, cs.CR |

## 核心贡献
1. 提出 **Incremental Completion Decomposition (ICD)**，一种基于轨迹的越狱攻击策略
2. ICD 先引导 LLM 输出一系列与恶意请求相关的**单个词续写**，再引导完整响应
3. 在 AdvBench、JailbreakBench、StrongREJECT 上展示 superior Attack Success Rate (ASR)

## 核心创新点
越狱攻击利用对话安全机制弱点。ICD 的关键洞察：通过先让模型逐词续写相关联的内容，逐步压制拒绝相关表征，使激活状态偏离安全对齐状态，最终诱导完整有害响应。

## 方法
- **Manual ICD variant**：手动选择 single-word continuation
- **Model-generated ICD variant**：让模型自己生成 one-word continuation
- **Prefill variant**：在最后一步 eliciting 完整响应时使用 prefill

## 理论解释
提供理论分析：为什么 ICD 有效？——因为成功攻击轨迹系统性地压制拒绝相关表征（refusal-related representations），将激活状态转移到安全对齐状态之外。

## 实验结果
- 多种模型家族均有效
- ASR 超过现有越狱方法
- 提供机制层面的证据（activation 分析）

## 建议
- 是否推荐使用：**仅用于安全研究**
- 适用场景：LLM 安全红队测试、对齐失效分析

---
*🥬 由 油麦菜 youmaicai 自动整理 | 2026-04-30*

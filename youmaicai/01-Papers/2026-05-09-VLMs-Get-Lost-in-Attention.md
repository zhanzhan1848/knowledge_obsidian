# Large Vision-Language Models Get Lost in Attention

## 元信息
| 标题 | Large Vision-Language Models Get Lost in Attention |
|------|------|
| 作者 | Ye Tian, Mengyu Yang, Huahui Yi, Liang Lin, Xiaoshuai Hao, Kun Wang, Wendong Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.05668) |
| arXiv | arXiv:2605.05668 |
| 代码 | [GitHub](https://github.com/Lrbomchz/vlms_lost_in_attn) |
| 会议 | ICML 2026 |

## 核心贡献
1. 提出统一的信息论+几何框架（RID + MixIG）来量化和对比 Transformer 残差流中各模块的功能贡献
2. 发现 Attention 与 FFN 的功能解耦：Attention 负责 reconfiguration（保持子空间），FFN 负责 innovation（扩展语义子空间）
3. 发现视觉语言模型存在严重的 attention 冗余：用高斯噪声替换学习到的 attention 权重可获得同等甚至更好的性能

## 模型架构
基于信息几何理论，引入两个指标：
- **RID (Representation Information Discrepancy)**: 量化 innovation
- **MixIG (Mixing Information Gain)**: 量化 reconfiguration

通过 SVD 分解表征矩阵 $X$ 得到 spectrum $\mathcal{S}_X$ 和语义支撑 $\mathcal{D}_X$，分析残差更新 $\Delta X$ 对这两个维度的影响。

## 核心发现
**Attention vs FFN 功能解耦**：
- Attention ≈ 子空间保持算子，专注于 reconfiguration（保持现有表征结构）
- FFN ≈ 子空间扩展算子，驱动 semantic innovation（注入新语义方向）

**视觉处理病理**：
- 当前 LVLM 的 decoder visual attention 未能对问题相关的视觉证据进行有效混合
- 存在严重的信息冗余——模型"迷失在 attention 中"而非高效利用视觉上下文

## 实验结果
- 在 15 个 SOTA LVLM 上跨 3 种主流架构验证
- 用高斯噪声替换学习 attention 权重后，大多数数据集上性能持平或提升

## 局限性
ICML 2026 论文，实验范围限于 LVLM，对纯 LLM 的适用性待验证。

## 建议
- 是否推荐使用：**是**（可作为模型压缩/优化理论基础）
- 适用场景：模型可解释性分析、LVLM 架构优化、attention 冗余剪枝
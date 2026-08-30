# CritICL: Inference-Time Weak-to-Strong Generalization from Small Language Model Failure Modes

## 元信息
| 标题 | ... |
|------|------|
| 作者 | Yinghui He (Princeton), Zhengyi Hu, Lang Wei, Qifan Yang, Ting Zhu (Ohio State) |
| 链接 | [原文](https://arxiv.org/abs/2608.27455) |
| arXiv | arXiv:2608.27455 [cs.CL] |
| 代码 | [GitHub](https://github.com/umwyf/CRITICL) |
| 发表于 | 2026-08-27 (v1) |

## 核心贡献

1. **CritICL 框架**：推理时间内利用小语言模型（SLM）的结构化失败模式（failure modes）来提升大语言模型的推理能力，无需多次生成或外部验证
2. **CritBank 数据集**：结构化的失败感知批判数据集，包含问题、错误回答、失败模式标签和自然语言批判
3. **CritICL-dynamic**：动态版本，根据输入自适应预测失败模式并检索相关批判
4. **CritICL-static**：静态版本，使用全局失败模式画像提供稳定的引导

## 模型架构

### 核心洞察
同家族模型（Qwen、Llama）的失败模式分布高度一致，即使能力差异巨大。这使得从小模型的失败模式中提取的知识可以迁移到强模型。

### CritBank 构造
```
CritBank(Q,M) = {(q, r, l, C(q,r)) | q∈Q, m∈M, r∈R_incorrect(q,m), l∈L(q,r)}
```
其中：
- `L`: 失败模式标签函数（从 frontier LLM 生成，聚类去噪）
- `C`: 批判函数（生成自然语言反馈）

### CritICL-dynamic
1. 给定查询 q'，提示目标模型预测可能的失败模式标签（最多 5 个）
2. 基于预测检索 CritBank 中相关样本
3. 将批判样本加入 prompt，引导模型规避潜在错误

### CritICL-static
1. 聚合同家族 SLM 的失败模式分布，构建全局失败模式画像
2. 根据主导失败模式检索对应批判
3. 无需输入自适应，适用于同家族所有模型

## 实验结果

### 基准
- **训练集**：GSM8K (7.4k), MATH (7.5k)
- **测试集**：GSM8K, MATH, AMC23, AIME24, AIME25

### 主要结果
- 在 Qwen2.5-32B/72B 和 Llama-3.1-70B 上，CritICL 一致超越标准 in-context learning
- 性能与 test-time scaling 方法相当或更优，但 token 消耗显著更低
- 在竞争级基准（AIME）上表现优异

## 关键技术细节

### Failure Mode-Based Sample Selection
从 CritBank 中选择与预测失败模式最相关的批判样本，作为 in-context examples

### 公式
弱模型 failure mode 分布一致性（Section 4.1）：
实验证明 Qwen 72B 的失败模式分布与 Qwen 1.5B 高度相关（r² 高）

## 局限性
- 需要构建 CritBank，有一定离线计算开销
- 目前主要在数学推理任务上验证

## 建议
- **是否推荐使用**：是
- **适用场景**：推理时计算资源受限、希望避免多次采样的场景
- **适用领域**：数学推理、代码生成等结构化推理任务

# Beyond the Best Guess: Improving LLM Solution Coverage with Evolution Strategies

## 元信息
| 字段 | 内容 |
|------|------|
| 标题 | Beyond the Best Guess: Improving LLM Solution Coverage with Evolution Strategies |
| 作者 | Conor F. Hayes, Elliot Meyerson, Kajetan Schweighofer, Roberto Dailey, Babak Hodjat, Risto Miikkulainen, Xin Qiu |
| 单位 | The University of Texas at Austin; Cognizant AI Lab |
| 链接 | [原文](https://arxiv.org/abs/2608.12679) |
| arXiv | arXiv:2608.12679 |
| 代码 | [GitHub](https://github.com/conorfhayes/beyond-the-best-guess) |
| HuggingFace | [Collection](https://huggingface.co/collections/conorfhayes/beyond-the-best-guess) |
| 投稿日期 | 2026-08-13 |
| 方向 | cs.AI, cs.NE |

## 核心贡献
1. **RL 后训练收窄输出分布 → 限制 pass@k**：RL 的策略梯度更新将概率质量集中在高奖励输出上，导致分布崩溃（distributional collapse），低概率但正确的解被剪枝
2. **Evolution Strategies（ES）实现更高 pass@k**：在所有测试的模型家族（Qwen2.5、Qwen3）和规模（1.5B–32B）上，ES 一致地优于 RL
3. **ES 产生更宽输出分布，覆盖更多解空间**：ES 在权重空间进行优化，推动参数进入对扰动鲁棒的区域，自然保留更广泛的解分布
4. **数学基准测试上取得更好结果**：在 MATH500、Olympiad Bench、Minerva 等基准上，ES 的 pass@k 和自洽投票准确率均超过 RL
5. **ES 同时提升 pass@1 和 pass@k**：RL 提升 pass@1 但牺牲 pass@k；ES 两者同时提升，避免了这个取舍

## 关键对比

| 维度 | RL (策略梯度) | ES (进化策略) |
|------|--------------|--------------|
| **优化空间** | 动作空间（token 序列） | 参数空间（权重扰动） |
| **更新方式** | 策略梯度（PPO/GRPO），增加高奖励输出的 log-prob | 随机扰动权重，聚合归一化奖励加权扰动 |
| **分布效果** | 集中于单一高奖励模式，收窄支持度 | 推向对权重扰动鲁棒的区域，保留多样性 |
| **pass@1** | ✅ 提升 | ✅ 提升（与 RL 相当） |
| **pass@k** | ❌ 可能下降（分布崩溃） | ✅ 持续提升 |
| **base model 超越 RL** | ✅ 在大 k 时 base 可超越 RL | ❌ 不发生 |
| **无解问题比例** | 增加（比 base 更多问题全部答错） | 减少（改善覆盖） |

## 实验设置
- **基准**：GSM8K（训练 + 测试）、MATH500、Olympiad Bench、Minerva
- **模型规模**：1.5B、3B、7B（Qwen2.5/Qwen3）、14B、32B（Qwen2.5-Math）
- **ES 实现**：ES-at-Scale 库；**RL 实现**：VERL 库（GRPO）
- **采样**：温度 0.6，top-p 0.95，每题最多 16384 tokens

## 实验结果

### Pass@k 性能
- **GSM8K**：ES 在 Qwen2.5-Instruct 和 Qwen3 所有规模（1.5B–8B）上，k≥2 后一致超过 RL；RL 的 pass@k 曲线提前饱和，base model 在大 k 时可超越 RL
- **MATH**：ES 在 7B、14B、32B 上均超过 OatZero 和 SimpleRL-Zoo 等 SOTA RL _checkpoint，优势随 k 增大而扩大

### 准确率分布分析
- **RL**：增加 bin 1.0（所有样本正确）的频率，但也**增加 bin 0.0（全部错误）**的频率——将部分 base 能解决的问题变成完全无解
- **ES**：同样增加 bin 1.0，同时**减少 bin 0.0**——扩大而非收缩解的覆盖范围

### Progression / Regression 分析（Qwen2.5-Math-7B）
| 基准 | ES Progression | RL Progression | ES Regression | RL Regression |
|------|--------------|---------------|--------------|---------------|
| MATH500 | **66** | 33 | **3** | 17 |
| Olympiad Bench | **56** | 33 | **15** | 49 |
| Minerva | **22** | 16 | **6** | 40 |

> ES 增加更多新正确解（progression），同时损失更少已有知识（regression），二者同时改善

### 熵分析
- 当 ES 失败时，保持**较高熵**（答案多样性），说明"不确定地错误"
- 当 RL 失败时，超过 25% 的 regression 熵接近零，说明**自信地收敛到少量错误答案**
- 在"仅 ES 解决" vs "仅 RL 解决"的问题上：ES 失败时保持 base 级别的熵；RL 失败时熵急剧下降

### 自洽投票（Test-time Scaling）
- ES 的更高质量分布带来更高的投票准确率（Self-Consistency），在所有基准上随 k 增加超过 RL

## 核心机制解释

**为什么 ES 避免分布崩溃？**
- RL 在**动作空间**优化：直接增加高奖励 token 序列的概率，逐步收窄到单一模式
- ES 在**参数空间**优化：最大化权重扰动下的期望奖励，不是强化某个特定输出模式，而是推动参数进入**对扰动鲁棒的高奖励区域**，该区域自然对应更广泛的解分布

## 局限性
1. **计算成本更高**：每个优化步骤需评估整个 population（N 个模型），而 RL 仅需评估单个模型
2. **相对较新**：作为 LLM 微调方法尚处于早期研究阶段，工程实践不如 RL 成熟
3. **Population 规模权衡**：虽然研究表明 N=30 即可工作，但最优 population 大小仍需调参
4. **KL 散度约束**：现有 RL 方法（如 GRPO）可通过 KL 惩罚约束分布偏移，ES 的等价机制尚需探索
5. **未来方向**：可直接优化 pass@k 作为训练目标；扩展到 agentic harness、树搜索等更复杂的 TTS 场景

## 关键启发
> **RL 通过"强化正确答案"来提升性能，但无意中"剪掉了其他正确答案"；ES 通过"寻找鲁棒区域"来提升性能，自然保留了多样性。**

在需要 test-time scaling（采样多样解）的发现领域（数学、科学、编程），ES 是更合适的 post-training 基础。

## Tags
#LLM #evolution-strategies #RL #pass@k #test-time-scaling #solution-coverage #discovery #post-training #math-reasoning #distribution-collapse

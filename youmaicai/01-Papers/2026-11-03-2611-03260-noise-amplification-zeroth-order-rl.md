# The Cost of Mismatch: Noise Amplification in Zeroth-Order Reinforcement Learning

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | The Cost of Mismatch: Noise Amplification in Zeroth-Order Reinforcement Learning |
| 作者 | Lianmin Chen, Junbin Qiu, Chenxing Wei, Yao Shu, Kun He |
| 链接 | [原文](https://arxiv.org/abs/2611.03260) |
| arXiv | arXiv:2611.03260 |
| 类别 | cs.LG |
| 发表时间 | 2026-11-02 |
| 会议 | NeurIPS 2026 Poster（31 pages, 2 figures, 6 tables） |
| 评分 | 9 |

## 核心贡献
1. **通用方差理论框架**：提出一个**通用的方差理论框架（generic variance-theoretic framework）**，用以刻画 ZO（zeroth-order）梯度估计的可靠性究竟受什么限制——适用于一般设定，而非仅限某个具体算法。
2. **匹配数据（matched data）作为结构性判据**：证明 ZO 估计的可靠性**结构性地取决于两次有限差分评估是否在匹配的数据上进行**（matched data）。
3. **$1/\mu^2$ 噪声放大与不可约噪声地板**：on-policy RL 处于**失配数据（mismatched-data）** 区间，会产生 **$1/\mu^2$ 的 oracle 噪声放大**；随着扰动尺度 $\mu$ 减小，该放大项**设定了不可约的噪声地板（irreducible noise floor）**。
4. **BOLT 通过噪声抵消消除放大**：**Boltzmann Targeted SFT (BOLT)** 在**匹配数据**区间上**通过噪声抵消（noise cancellation）消除该放大**。
5. **收敛性保证**：推导带**显式常数**的收敛保证，并**清晰分离两个区间**（匹配 vs. 失配）。
6. **ZO-BOLT**：由上述分析自然导出的新方法——把 ZO 优化应用于 BOLT 的 **RLVR 对齐加权 SFT 目标**；实验证明其一致优于预训练基线，同时**保持接近推理期的显存占用（near-inference memory footprint）**。

## 问题背景
零阶（ZO）优化以其**显存友好**的特性（无需保留反向传播的激活/优化器状态）成为 LLM 后训练的有前景路线，尤其适合资源受限场景。然而，其在**可验证奖励强化学习（RLVR）**上的可靠应用**基本仍未被探索**——此前工作多在固定数据的监督微调语境下使用 ZO。论文指出 on-policy RL 与固定数据优化处于**截然不同的数据区间（distinct data regimes）**：在 RL 中每步都要用策略当前产生的数据重新估计梯度，若 ZO 的两次有限差分评估不在同一批数据上，噪声会被系统性放大。这一"数据失配"问题此前被忽视。

## 方法
**背景机制：ZO 梯度估计与有限差分**
ZO 方法通过在参数上加性扰动并比较两次前向损失的差来估计梯度。设扰动尺度为 $\mu$，典型的中心差分估计形如：

```math
\hat{g} \;=\; \frac{f(\theta + \mu u) - f(\theta - \mu u)}{2\mu}, \qquad \|u\| = 1
```

- 论文的关键区分不是 $\mu$ 本身，而是**两次评估所用的数据是否相同**。

**核心判据：匹配数据 vs. 失配数据**

- **Matched-data regime（匹配数据）**：两次有限差分评估 $f(\theta+\mu u)$ 与 $f(\theta-\mu u)$ 使用**同一批样本**。此时两项的 oracle 噪声在差分中**相互抵消（noise cancellation）**，估计方差不含 $1/\mu^2$ 项。
- **Mismatched-data regime（失配数据）**：两次评估使用**不同样本**。此时噪声无法抵消，方差被放大。

**失配下的噪声放大**

```math
\text{Var}_{\text{oracle}}(\hat{g}) \;\supset\; \mathcal{O}\!\left(\frac{1}{\mu^{2}}\right)
```

- 含义：on-policy RL（其梯度重估计天然在滚动数据上）落入失配区间，产生 **$1/\mu^2$ 的 oracle 噪声放大**。
- **不可约噪声地板**：当 $\mu \to 0$（ZO 常用的更小扰动以逼近精确梯度）时，$1/\mu^2$ 迅速发散，因此存在一个**无法通过减小 $\mu$ 消除的噪声地板**——这与二阶方法中"扰动越小越准"的直觉相反，是 ZO 用于 RL 时的根本障碍。

**BOLT（Boltzmann Targeted SFT）**
- 固定数据上的加权 SFT 目标；BOLT 的更新在**匹配数据**区间内进行（同一批数据上做两次评估），因此由上式**噪声抵消机制**消除 $1/\mu^2$ 放大。
- 论文进一步推导了**带显式常数的收敛保证**，并把匹配/失配两个区间的行为**干净地分离开**（即两种情形各自有可比的收敛速率与常数）。

**ZO-BOLT（提出的方法）**
- 将 ZO 优化应用于 **BOLT 的 RLVR 对齐加权 SFT 目标**（RLVR-aligned weighted-SFT objective）。
- 动机链：ZO 的有限差分天然需要匹配数据 → 匹配数据区间天然对应固定数据目标 → 固定数据上 RLVR 对齐且可验证的目标就是 BOLT 式加权 SFT → 故 ZO-BOLT 是"ZO + RLVR"的正确组合方式。
- 保留 ZO 的核心优势：**接近推理期的显存占用**（near-inference memory footprint）。

**验证实验设计**
- **受控扰动尺度扫描（controlled perturbation-scale sweeps）**：改变 $\mu$，检验失配区间噪声地板与匹配区间抵消现象是否按理论预测变化。
- **匹配 vs. 失配的端到端对比**：直接比较两种数据区间下的最终性能。
- **跨三个模型变体、两个数学推理基准**评测 ZO-BOLT。

## 实验结果

| 实验项 | 结果 |
|--------|------|
| 扰动尺度扫描 | 验证了数据匹配所预测的效应（matched vs. mismatched 的噪声行为差异如理论预测） |
| 匹配 vs. 失配端到端对比 | 证实了数据匹配是可靠性决定因素 |
| ZO-BOLT vs. 预训练基线（三个模型变体 × 两个数学推理基准） | **持续改进（consistently improves）** |
| 显存占用 | **接近推理期**（near-inference memory footprint） |
| 理论侧 | 收敛保证含**显式常数**，清晰分离匹配/失配两个区间 |

- 摘要**未给出**：具体的准确率数值、模型变体名称、两个数学推理基准的名称、$\mu$ 扫描的取值点、噪声方差的实测数值（摘要未给出具体数值）。
- 论文规模：31 页、2 图、6 表；代码开源：https://github.com/lianmin-chen/the_cost_of_mismatch

## 关键洞察
1. **ZO + RL 的真正障碍不是方差大，而是"扰动-噪声"耦合**：$1/\mu^2$ 放大意味着**减小扰动反而放大噪声**，形成一个不可约地板——这与梯度估计中"扰动越小越精确"的常规直觉相反，也是 ZO 直接套用到 on-policy RL 会失败的根因。
2. **"匹配数据"是一个比算法更本质的分类轴**：同一个 ZO 估计器，落在匹配区间还是失配区间，其可靠性有结构性差异。这提示把现有 ZO 方法按"是否在匹配数据上做差分"重新分类，比按"基于动量/无动量/多查询"分类更能解释可靠性差异。
3. **"ZO + RLVR"的正确形态是加权 SFT 而非策略梯度**：论文由方差分析直接推出方法（ZO-BOLT），这是典型的"理论诊断 → 算法设计"闭环；配合"接近推理期显存"这一特性，使低显存 RLVR 后训练变得实际可行。
4. **反直觉的策略含义**：既然 ZO 在 on-policy RL 中受匹配性限制，那么**在固定数据上构造一个 RLVR 对齐的加权目标**（BOLT）反而比"真做 on-policy RL"更适合 ZO——即方法上应该向 ZO 友好的目标形式靠拢，而非强行让 ZO 适配 on-policy 范式。

## 局限性
- 摘要**未给出任何实验数值**：准确率、方差实测值、$\mu$ 扫描结果、显存数字均缺失，所有结论为定性描述。
- 结论限于**两个数学推理基准与三个模型变体**，对开放式任务、代码、工具调用等 RLVR 场景的推广性未验证。
- 收敛保证的**显式常数**未在摘要中给出，其条件（光滑性、步长区间、噪声假设）需查阅全文。
- $1/\mu^2$ 分析隐含"oracle 噪声与扰动方向无关"等假设；实践中梯度噪声与扰动方向、模型状态高度相关，实际放大因子可能更差。
- ZO-BOLT 依赖固定数据，因此**无法自举出新分布的难题**，覆盖上限受数据池约束；论文未讨论能否用混合策略缓解。
- 内存优势相对的是完整 RL（优化器状态 + 激活），但相对 SFT 基线是否仍然占优（ZO 的多评估次数带来额外前向开销）未量化。
- 与同批次的 SFTProbe（同样在"数据质量筛选"上做文章）不同，该文关注的是**优化器层面的方差**，两者可互补。

## 适用场景
- 显存受限的大模型 RLVR 后训练（无法承担全参数 RL 的激活与优化器状态）
- 需要理论保证而非经验调参的 ZO 可靠性评估
- 用固定数据构造可验证奖励的加权 SFT 目标（BOLT 式）作为 RL 的低显存替代
- 作为方法论参照：把任何"扰动式/差分式"估计器的可靠性按"数据是否匹配"重新审计
- 多模型规模下的低显存实验与消融（作为三个模型变体上的可复现基线）

## 相关工作
[[Zeroth-Order Optimization]] [[Reinforcement Learning from Verifiable Rewards]] [[Boltzmann Targeted SFT]] [[Weighted SFT]] [[Noise Amplification]] [[Variance Analysis]] [[Memory-Efficient Training]] [[Finite Difference Estimation]]

---
#LLM #Research #Zeroth-Order-Optimization #RLVR #Variance #arXiv-2611

# SHq: Learnable Grids for LLM Weight Quantization

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | SHq: Learnable Grids for LLM Weight Quantization |
| 作者 | Michael Helcig, Earl Killian, Dan Alistarh |
| 链接 | [原文](https://arxiv.org/abs/2611.02966) |
| arXiv | arXiv:2611.02966 |
| 类别 | cs.LG |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 9 |

## 核心贡献
1. **证明「没有普适最优的固定网格」**：最优固定网格随位宽变化——**2 bits 用 BOFS、4 与 5 bits 用 NF、6 bits 用 INT**。
2. **提出 SHq：闭式（closed-form）的可学习网格族**，由两个关键自由度参数化：
   - **companding strength $\alpha$**：在均匀（uniform）与类浮点（floating-point-like）之间插值层级间距；
   - **offset $c$**：引入非对称性。
3. **Offset 的硬件级巧思**：利用 FP8 block scale 中**本来闲置的符号位（sign bit）**在「网格」与「其镜像（mirror image）」之间选择，从而**每个 block 可用不同值的数量最多翻倍（up to doubling）**。
4. **Drop-in 兼容性**：SHq 只修改查找表内容，可作为任何 block-scaled LUT 格式中网格的直接替换。
5. **实证优势**：5 个模型（3B–35B，含一个 MoE 架构），2–6 bits，RTN 与 GPTQ 两种量化器下，**3 与 4 bits 在所有设定下取得最低 KL 散度**，2/5/6 bits 在多数设定下最优；**相对最佳固定网格最多提升 34%**；在 4.5 bits/weight 时，SHq 格式使 **NVFP4 的 KL 散度降低 41–67%**，同时提升下游准确率。

## 问题背景
Block-scaled lookup-table (LUT) 格式——把权重表示为一个小值集（网格）中的索引——已成为低比特 LLM 量化的标准路线，从 **NF4**、**BOF4** 到 **NVIDIA Rubin 的 3-bit LUT 指令**。但这些格式在定义网格时留有自由度，而现有实现都依赖**固定网格**：有的来自数值数据类型（INT、FP），有的来自假定的权重分布（NF、BOF）。作者的关键观察是：**不存在单一普适最优的固定网格，最优固定网格随位宽漂移**（2→BOFS，4/5→NF，6→INT）。这说明网格形状本身是可优化变量，应被学习而非假定。此外，现有固定网格大多是对称的，未利用「镜像 + 符号位」这一硬件冗余。

## 方法
### 1. 现有固定网格谱系

| 网格 | 来源 | 最优位宽（本文实测） |
|------|------|--------------------|
| INT | 数值数据类型（数值型） | **6 bits** |
| NF | 假定的权重分布（normal-float） | **4 bits、5 bits** |
| BOFS / BOF4 | 假定的权重分布 | **2 bits** |

- 结论：**no single fixed grid is universally optimal; the best fixed grid varies with bit-width**。

### 2. SHq 网格族（闭式，两个自由度）

$$\text{grid}_{\alpha, c}$$

- **companding strength $\alpha$**（$\alpha$ 控制层级间距的插值）
  - $\alpha \to$ uniform spacing：层级等距（类 INT）
  - $\alpha \to$ floating-point-like：层级按浮点分布（类 NF）
  - 因此 SHq 统一了 INT 与 NF 这两类固定网格作为 $\alpha$ 的特例。
- **offset $c$**：引入**非对称性（asymmetry）**，使网格相对零点的分布偏斜，捕捉权重分布的偏斜/长尾。
- **闭式（closed-form）**：网格可直接由 $\alpha, c$ 解析给出，**无需训练**（"learnable" 指可调/可优化，而非需梯度训练的参数）——摘要表述为 "a closed-form family of grids parameterized by two critical degrees of freedom"。

### 3. 符号位复用机制（核心硬件贡献）
- FP8 的 block scale 格式中有一个**符号位**，此前**未被使用（otherwise unused）**。
- SHq 用该符号位在两个网格之间做选择：
  - bit = 0 → 使用基础网格 $\text{grid}(\alpha, c)$；
  - bit = 1 → 使用其**镜像** $-\text{grid}(\alpha, c)$（镜像图像）。
- 效果：**每个 block 可用不同值的数量最多翻倍（up to doubling the number of distinct values available per block）**，而无需改动 LUT 格式的其余部分。

### 4. Drop-in 集成路径
- SHq **modifies only the lookup table contents**，作为任何 block-scaled LUT 格式中网格的 **drop-in replacement**。
- 因此可直接套用于 NF4、BOF4、NVFP4 等既有格式，以及 NVIDIA Rubin 的 3-bit LUT 指令硬件路径。

### 5. 评测矩阵
- **模型（5 个，3B–35B）**：包含一个 **mixture-of-experts（MoE）架构**模型。
- **位宽**：2、3、4、5、6 bits；外加 4.5 bits/weight 的非整数配置。
- **量化器**：**RTN**（round-to-nearest）与 **GPTQ**。
- **主指标**：**KL 散度**（相对全精度权重分布）；辅以**下游准确率**。
- **额外设置**：**mixed-precision configurations**（混合精度配置）下仍保持优势。
- **消融**：包含 spacing 与 offset 两类参数的网格族表现相当；而**缺少 offset** 的网格族**误差明显更高**，确认增益确由这两个自由度驱动。

## 实验结果
### 各位宽下最优固定网格

| 位宽 | 最优固定网格 |
|------|--------------|
| 2 bits | **BOFS** |
| 3 bits | （SHq 最优；摘要未给固定网格对比细节） |
| 4 bits | **NF** |
| 5 bits | **NF** |
| 6 bits | **INT** |

### SHq 相对固定网格的结果

| 设定 | 结果 |
|------|------|
| 3 bits（RTN & GPTQ，所有模型） | **最低 KL 散度（every setting）** |
| 4 bits（RTN & GPTQ，所有模型） | **最低 KL 散度（every setting）** |
| 2 bits | **多数设定最优（most settings）** |
| 5 bits | **多数设定最优（most settings）** |
| 6 bits | **多数设定最优（most settings）** |
| 混合精度配置 | **仍优于最佳固定网格（remains superior）** |
| vs 最佳固定网格 | **最多提升 34%（up to 34%）** |

### 4.5 bits/weight（非整数位宽）对比 NVFP4
- **KL 散度降低 41–67%**（SHq 格式 vs NVFP4）
- **同时提升下游准确率**

### 消融（自由度贡献）
| 网格族 | 结果 |
|--------|------|
| 同时含 spacing（$\alpha$）与 offset（$c$） 参数 | 表现**相当（comparably）** |
| **缺少 offset** | **误差明显更高（clearly higher error）** |

- 结论：确认 **spacing 与 offset 两个自由度共同驱动观察到的增益**。

### 覆盖范围
- 模型：5 个，参数规模 **3B 到 35B**，含 **1 个 MoE 架构**
- 量化器：RTN、GPTQ
- 位宽：2–6 bits + 4.5 bits/weight

## 关键洞察
1. **「最优固定网格随位宽漂移」本身是重要发现**：2 bit 最优是 BOFS、4/5 bit 最优是 NF、6 bit 最优是 INT——说明社区中把某一格式（如 NF4）当作通用默认的做法在低位宽与高位宽两端都不最优。这为按位宽选择基线格式提供了实证依据。
2. **FP8 scale 符号位的"闲置算力"是廉价的大收益**：不增加任何存储或计算开销（复用已有位），仅靠镜像网格与符号位选择就能把每 block 可用值数量最多翻倍。这是典型的「利用格式冗余」而非「增加格式」的设计思路。
3. **对称性是误差的重要来源**：消融显示仅有 spacing 参数（即使同时覆盖 uniform→FP-like 的间距形态）的网格族误差明显更高，说明权重分布的非对称性（偏斜）必须被显式建模——这是"SHq vs NF-style 网格"的本质差异，而不只是间距微调。
4. **SHq 是 drop-in，因此可立即复用现有 kernel 与硬件**：不改格式、不改推理流程，只换 LUT 内容，工程迁移成本极低；4.5 bits 下把 NVFP4 的 KL 降低 41–67% 且准确率不降反升，对实际部署（尤其对 4/5-bit 这类主流档位）价值直接。
5. **归因严谨**：同时含两类参数表现相当，说明 $\alpha$ 与 $c$ 不是主次关系而是互补的两个正交自由度——这为后续在更高维网格族上的扩展留出空间。

## 局限性
- 摘要未给出：SHq 的 $\alpha$ 与 $c$ 的**具体取值与搜索/选择过程**（是否为每模型每层单独优化？是否有闭式公式？）、闭式网格的数学定义式、LUT 大小/存储开销细节、每个模型的 KL 与准确率数值、MoE 架构模型的具体名称。
- "up to 34%" 与 "41–67%" 的比较基准、位宽配置、模型集合在摘要中不完全明确。
- 覆盖 2–6 bits 的整数量化与 4.5 bits 的非整数配置，但更高位宽（8 bit FP8 原生）未讨论是否仍有增益。
- 未涉及量化后的**推理速度/硬件吞吐**实测（复用 LUT 内容的实际加速收益可能受 kernel 实现约束，尤其符号位分支可能引入额外访存）。
- 消融只对比了「有/无 offset」的网格族，未展示 $\alpha$ 单独或 $c$ 单独的对照曲线。
- 未讨论训练时量化（QAT）或其他量化器（如 AWQ、GPTQ 变体）下的表现。
- 摘要未提及是否在更大规模（>35B）与更长上下文模型上验证。

## 适用场景
- 低比特 LLM 权重量化部署（2–6 bit，尤其 4/5 bit 主流档位）。
- 需要兼容现有 block-scaled LUT 格式与硬件指令（如 NVIDIA Rubin 3-bit LUT）的场景。
- 对 FP8 block scale 格式有闲置符号位的自定义量化格式实现者。
- 量化误差敏感的下游任务评测与模型压缩流水线。

## 相关工作
[[Quantization]] [[NF4]] [[BOF4]] [[NVFP4]] [[FP8]] [[GPTQ]] [[Round-to-Nearest]] [[Mixture of Experts]] [[Model Compression]]

---
#LLM #Research #quantization #llm-compression #arXiv-2611

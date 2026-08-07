# The Ignition Index: Measuring Global Workspace Dynamics in Language Models

## 基本信息
| 标题 | The Ignition Index: Measuring Global Workspace Dynamics in Language Models |
|------|-----|
| 作者 | Saman Rahbar et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.05160) |
| arXiv | arXiv:2608.05160 |
| 代码 | [GitHub](https://github.com/saman-rahbar/ignition-index) |
| 领域 | cs.AI, cs.CL, cs.LG |
| 日期 | 2026-08-07 |

## 核心贡献

1. **Ignition Index (ℐ)**: 首个将 Global Workspace Theory (GWT) 的"点燃(ignition)"预测量化的标量指标，用于衡量 Transformer 语言模型中的全或无表征转换
2. **四参数 sigmoid 拟合**: 对每层线性探针准确率作为输入信号强度函数进行拟合，提取陡峭度参数 β̂
3. **9.6倍选择性**: 打乱标签对照实验证明指标对真实语言结构的选择性 (p < 0.001, Mann-Whitney U-test)

## 核心发现

### 1. 架构可辨别性
- **Feedforward Transformers > SSMs**: β̄=130.0 vs β̄=68.7，高出 **89%** (p<10⁻¹³, Cohen's d=0.52)
- **Mamba**: 接近线性的层间轮廓，与 absent global broadcast 一致

### 2. 循环架构中的轴依赖点燃
- **Huginn-3.5B**: 沿 iteration 轴的点燃 (β_iteration=234.8) 比 depth 轴 (β_depth=111.0) **高 2.12 倍**
- 证明循环架构在 recurrence 维度而非 depth 维度上呈现 workspace 类转换

### 3. 训练时相变
- **Pythia-410M**: 在训练步 256 处检测到 PELT 断点 (+67%)
- 早于 induction-head 形成，匹配初始表征整合阶段

### 4. 未确认假设
- 模型规模和信号强度与点燃强度的关联假设**未获证实**
- 当前 Transformer 架构可能已饱和可用点燃机制

## 模型架构

### 核心公式

**Ignition Index 定义:**
```math
ℐ(M,𝒯,s) := β̂(M,𝒯,s) = argmin_β ∑_{ℓ=0}^L [Acc(ℓ,s) - f(ℓ)]²
```

**四参数 logistic 拟合:**
```math
f(ℓ; y_min, y_max, ℓ₀, β) = y_min + (y_max - y_min)/(1 + exp(-β(ℓ-ℓ₀)))
```

**GWT 点燃概率:**
```math
P(ignition|s) = 1/(1 + exp(-β(s-s₀)))
```

**Transition width:**
```math
w = ln(81)/β̂ ≈ 4.39/β̂
```

### 测试模型 (11个模型，5个架构家族)
- GPT-2, Pythia, Gemma 2, Huginn-3.5B, Mamba

### 探测任务
7个语言学探测任务，验证对真实语言结构的捕捉

## 实验设计

### 方法
1. 通过受控 token corruption 和 embedding noise 变化输入信号强度 s∈[0,1]
2. 使用 TransformerLens 提取每层残差流状态
3. 在每层训练线性探针解码任务相关信息
4. 拟合四参数 sigmoid 提取 β̂

### 选择性验证
- Real transitions: β̄=113.1
- Shuffled-label controls: β̄=11.8
- 9.6-fold gap (p<0.001)

## 局限性

- Transformer 层深度作为处理时间代理不完全准确
- 未捕捉细粒度特征分解
- 模型规模和信号强度假设未被证实

## 建议
- **推荐使用**: 是
- **适用场景**: 架构搜索、机械可解释性研究、训练动态分析
- **创新程度**: 高 - 首次建立 GWT 理论与 Transformer 机械可解释性之间的量化桥梁

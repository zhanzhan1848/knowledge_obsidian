# The Spectral Lifecycle of Transformer Training: Transient Compression Waves, Persistent Spectral Gradients, and the Q/K--V Asymmetry

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Yi Liu |
| 链接 | [原文](https://arxiv.org/abs/2604.22778) |
| arXiv | arXiv:2604.22778 |
| 领域 | Transformer训练动态 / 谱分析 |

## 核心贡献
1. **首次系统性研究** Transformer 预训练过程中权重矩阵奇异值谱的演化规律
2. 发现三大现象：Transient Compression Waves、Persistent Spectral Gradients、Q/K-V Functional Asymmetry
3. 提出谱引导剪枝 (spectral-guided pruning)，性能优于 Last-N 启发式方法 1.1×-3.6×

## 模型架构
- 跟踪三个模型规模（30M-285M参数）pretraining 过程中每25步的全 SVD 分解
- 涵盖 custom、GPT-2、Pythia 三个家族（30M-1B参数，8-36层）

## 核心发现

### 1. Transient Compression Waves（瞬态压缩波）
- 稳定秩压缩作为行波从前层传播到后层
- 产生剧烈梯度，早期达到峰值后**反转**——后层最终压缩程度超过前层

### 2. Persistent Spectral Gradients（持久谱梯度）
- 幂律指数 α 形成永久深度梯度，在更深模型中呈非单调倒U形
- 峰值随深度增加向更早层偏移
- 推导缩放定律：Δα ∝ L^0.26, R²=0.99

### 3. Q/K--V Functional Asymmetry（Q/K-V 功能不对称）
- value/output 投影均匀压缩
- query/key 投影承载全部深度依赖动态

## 关键公式
- 稳定秩压缩梯度在训练早期达到峰值后反转
- α 预测层重要性（ρ=0.69-0.84, p<0.02）
- Δα ∝ L^0.26

## 实验结果
- 谱引导剪枝在 GPT-2 124M-774M 和 Pythia 160M-1B 上验证
- worst-vs-best 差距达 23.7×，确认谱结构的因果作用

## 局限性
- 研究仅覆盖 30M-1B 参数模型，更大规模的行为待验证
- 瞬态压缩与持久谱形状的解耦揭示 rank 和 spectral shape 编码不同信息

## URL
https://arxiv.org/abs/2604.22778
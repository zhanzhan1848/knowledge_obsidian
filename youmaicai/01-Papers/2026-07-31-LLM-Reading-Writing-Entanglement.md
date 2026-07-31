# LLM Reading/Writing Entanglement - Brain-Computer Analogy

## 元信息
| 标题 | Reading Without a Reader: Large Language Models Collapse the Brain's Dissociated Reading and Writing Systems into a Single Entangled Code |
|------|------|
| 作者 | Diego Saldaña Ulloa 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.24797) |
| arXiv | arXiv:2607.24797 [q-bio.NC] |
| 发表 | 2026-07-30 (v2) |

## 核心贡献
1. **发现 LLM 读写纠缠现象**：GPT-2, OPT, Pythia (14M-1.4B) 的输入侧"阅读码"和输出侧"写作码"高度耦合
2. **提出纠缠度量 $\mathcal{E}$**：基于 CKA, Procrustes 残差, 互 $k$-NN，范围 [0,1]
3. **反驳"阅读与写作分离"的类比**：证明 greedy production 隐含 argmax，使分离测试无法进行

## 关键发现

### 纠缠度量
$$\mathcal{E} \in [0, 1]$$
- GPT-2, OPT, Pythia: $\mathcal{E} = 0.23$–$0.35$（显著高于 baseline，远低于 ceiling）
- $\mathbf{W}_U$ 比 $\mathbf{W}_E$ drift 远 ~3.2x

### 轨迹特征
- 非单调耦合→分化轨迹 (couple-then-differentiate)
- 随模型规模增大，纠缠程度变化待研究

### 理论分析
- Greedy production = vocabulary-wide argmax →  pairwise ranking 自动满足
- 这使得"阅读理解和产出是否分离"的对应行为测试无法运行

## 重要结论
- **LLM 中读写无需索引即可感知纠缠**
- 与人类大脑读写的类比是 analogy 而非 homology
- 这将 LLM 定位于"可能的意识空间"中

## 标签
#interpretability #model-analysis #reading-writing #Transformer #analogy

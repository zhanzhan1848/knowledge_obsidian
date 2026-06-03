# Neuron Populations Exhibit Divergent Selectivity with Scale

## 元信息
| 标题 | Neuron Populations Exhibit Divergent Selectivity with Scale |
|------|-----|
| 作者 | Amil Dravid, Yasaman Bahri, Alexei A. Efros, Yossi Gandelsman |
| 链接 | [原文](https://arxiv.org/abs/2606.03990) |
| arXiv | arXiv:2606.03990 |
| 发表 | 2026-06-02 |
| 领域 | cs.LG, cs.CL, cs.CV |
| 代码 | [Project Page](https://avdravid.github.io/rosetta-neuron-scaling/) |

## 核心贡献
1. **研究问题**：神经网络内的神经元群体是否随规模可预测地演化？将 scaling laws 扩展到神经元级别的结构。
2. **Rosetta Neurons**：研究了一类先前表征的神经元，其激活模式在独立训练的模型间相似。
3. **关键发现**：
   - Rosetta Neurons 数量随模型规模呈**次线性幂律**增长（绝对数量增加，但占总神经元比例缩小）
   - **Neuron Polarization Effect**：Rosetta Neurons 随规模变得更加选择性、越来越单语义，与不断增长的不太 Selectivity 的非 Rosetta 群体分离
   - 分析模型平衡特征效用与有限神经元容量，解释了幂律缩放和极化效应

## 方法细节

### 研究范围
- 语言模型：最高 30B 参数
- 视觉模型：最高 5B 参数

### 关键公式
- Scaling law: Rosetta Neurons 数量 ∝ 模型规模的次线性函数
- 分析模型: 特征效用 vs 有限神经元容量的平衡

### 发现
1. **Rosetta Neurons 数量**: 随模型规模增长，但占总体比例缩小
2. **选择性增强**: 随规模变得更加单语义（monosemantic）
3. **领域专业化**: Rosetta Neurons 随规模变得更加领域专业化

### 应用案例
- Targeted data-filtering 用于持续预训练

## 核心创新点
- 提出神经元级别的 scaling law
- 链接模型规模与神经元普遍性、选择性、专业化的系统性变化
- 为可解释性和神经网络结构研究提供新视角

## 标签
#scaling-laws #interpretability #neuron #LLM #vision-model
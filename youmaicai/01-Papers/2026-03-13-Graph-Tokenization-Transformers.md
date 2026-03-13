# Graph Tokenization for Bridging Graphs and Transformers

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Graph Tokenization for Bridging Graphs and Transformers |
| 作者 | Zeyuan Guo, Enmao Diao, Cheng Yang, Chuan Shi |
| 链接 | [arXiv:2603.11099](https://arxiv.org/abs/2603.11099) |
| arXiv | arXiv:2603.11099 |
| 分类 | cs.LG, cs.AI |
| 日期 | 2026-03-11 |
| 会议 | **ICLR 2026 Poster** |
| 代码 | [GitHub](https://github.com/BUPT-GAMMA/Graph-Tokenization-for-Bridging-Graphs-and-Transformers) |

## 核心贡献
1. **图 tokenization 框架**：将图转换为序列表示
2. **结合 BPE**：与广泛采用的 tokenizer 结合
3. **SOTA 结果**：14 个基准数据集上超越 GNN 和专用 graph transformers

## 背景：Transformer 与图数据

### 挑战
- 预训练 Transformer 的成功与 tokenizer 紧密相关
- Tokenizer 将原始输入转换为离散符号
- 将这些模型扩展到图结构数据仍然是重大挑战

### 现有方法
- Graph Neural Networks (GNN)
- Specialized Graph Transformers
- 需要架构修改

## 方法：Graph Tokenization Framework

### 两大组件

#### 1. Reversible Graph Serialization
- 保留图信息的可逆图序列化
- 将图转换为序列

#### 2. Byte Pair Encoding (BPE)
- LLM 中广泛采用的 tokenizer
- 将频繁子结构合并为有意义的 token

### 关键创新
**Global Statistics Guided Serialization**
- 图序列化过程由图子结构的全局统计指导
- 频繁出现的子结构在序列中出现更频繁
- 可被 BPE 合并为有意义的 token

### 优势
- 标准 Transformer（如 BERT）可直接应用
- 无需架构修改
- 保留图结构信息

## 实验结果

### 基准测试
- **14 个基准数据集**
- 频繁超越 GNN
- 频繁超越专用 graph transformers

### 对比
| 方法 | 性能 | 架构修改 |
|------|------|---------|
| GNN | baseline | 需要 |
| Graph Transformers | baseline | 需要 |
| **本文方法 + BERT** | **SOTA** | **无需** |

## 关键洞见

### 核心思想
> This work bridges the gap between graph-structured data and the ecosystem of sequence models.

### 意义
- 利用现有预训练 Transformer 生态
- 无需设计新的图专用架构
- Tokenization 是关键桥梁

## 应用场景
- 图分类
- 节点分类
- 图表示学习
- 分子性质预测
- 社交网络分析

## 技术细节

### 图序列化
- 可逆转换：图 ↔ 序列
- 保留拓扑信息
- 支持边属性

### BPE 适配
- 学习图子结构的词汇表
- 合并频繁模式
- 类似于 NLP 中的 subword tokenization

## 标签
#graph-neural-networks #transformers #tokenization #BPE #ICLR2026 #graph-learning

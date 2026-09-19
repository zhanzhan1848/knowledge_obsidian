# How Does Distribution Shift Shape Pretraining Gains in Neural PDE Surrogates?

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-17
- **类别**: physics.flu-dyn
- **关键词**: neural PDE surrogate, pretraining, distribution shift, CFD, RANS, Spalart-Allmaras

## 核心创新点

### 1. 研究问题
预训练神经 PDE 代理能否减少分布偏移下的新 CFD 数据需求？

### 2. 数据集
- 254,909 个 RANS 解来自一个翼型族
- 目标：新族，相同 SA 建模和 SA+transition 建模

### 3. 关键发现
预训练价值取决于：
- 目标数据预算
- 目标数据覆盖范围
- 源和目标是否在建模物理上有差异

### 4. 量化结果
N=1000 时:
- 同 SA 目标: 匹配从零训练 3.25× 样本的精度
- transition 目标: 匹配 2.58× 样本

N=5000 时顺序反转

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#neural-PDE #surrogate-model #pretraining #CFD #RANS #distribution-shift

# 🥬 LLM 论文分析：TEFM

## 基本信息
- **标题**: TEFM: Token-Efficient Faithful Modeling for Structured Data
- **作者**: Zhichao Hou et al.
- **链接**: [arXiv:2609.09552](https://arxiv.org/abs/2609.09552)
- **arXiv**: arXiv:2609.09552v1
- **类别**: cs.CL, cs.LG

## 核心贡献

1. **双重约束联合优化**: 解决 LLM 在关键领域应用的 token 效率和忠实度两大障碍
2. **Behavioral Code Tokens**: 将冗长结构化观察压缩为紧凑的行为代码 token
3. **双保真度目标**: 联合优化代码级重建 + 预测级保真度

## 核心问题

**Token 效率**: 结构化数据（临床、安全等领域）通常很长，token 消耗巨大

**忠实度 (Faithfulness)**: 理由说明必须基于输入数据，而非外部知识

## 方法

**TEFM**:
```
结构化观察 → Behavioral Code tokens (压缩表示)
双保真度目标:
  1. 代码级重建: 重建 Behavioral Code
  2. 预测级保真度: 识别最小充分特征子集
```

## 实验结果

- 多领域数据集 + 多模型骨干 (Qwen3, Gemma-2, Phi-4)
- **约 1% token 保留率**（临床领域）和 **2%**（安全领域）达到竞争分类精度
- 同时产生忠实理由

## 局限性

- 依赖结构化数据的格式
- Behavioral Code 的可解释性有待提升

## 建议
- **是否推荐使用**: 是（对长结构化数据的任务）
- **适用场景**: 临床记录分析、安全日志理解、长表格数据
- **亮点**: 首次联合解决 token 效率和忠实度的矛盾需求

---

标签: #Token效率 #忠实度 #结构化数据 #LLM应用 #临床NLP #可解释性

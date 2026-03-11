# One Language, Two Scripts: Probing Script-Invariance in LLM Concept Representations

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | One Language, Two Scripts: Probing Script-Invariance in LLM Concept Representations |
| 作者 | Sripad Karne |
| 链接 | [原文](https://arxiv.org/abs/2603.08869) |
| arXiv | arXiv:2603.08869 |
| 类别 | cs.CL |
| 发表时间 | 2026-03-09 |
| 会议 | UCRL Workshop at ICLR 2026 |

## 核心贡献
1. **塞尔维亚语双文字实验**: 利用塞尔维亚语拉丁/西里尔双文字作为控制测试床
2. **SAE特征抽象性验证**: 证明Sparse Autoencoder特征优先语义而非正字法
3. **新评估范式**: 提出使用双文字现象作为表示抽象性评估范式

## 研究问题
- SAE学习到的特征是表示抽象意义，还是与书写方式绑定？

## 方法论
### 塞尔维亚语双文字优势
- 塞尔维亚语可互换使用拉丁和西里尔字母
- 近完美字符映射
- 完全不同的tokenization (无共享token)
- 意义完全相同，仅正字法不同

## 实验设计
- 模型: Gemma家族 (270M-27B参数)
- 对比: 相同句子不同文字的SAE特征激活
- 跨文字跨释义比较

## 关键发现
1. **高度重叠**: 不同文字的相同句子激活高度重叠的特征，远超随机基线
2. **文字 < 释义**: 更换文字导致的表示差异小于同文字释义
3. **规模效应**: 文字不变性随模型规模增强
4. **非记忆化**: 跨文字跨释义组合极少共现于训练数据，但仍有显著特征重叠

## 结论
- SAE特征可以捕获高于表面tokenization的语义抽象
- 塞尔维亚语双文字可作为通用的学习表示抽象性评估范式

## 适用场景
- 表示学习研究
- 可解释性分析
- 跨语言/跨文字模型评估

## 相关工作
- [[Sparse Autoencoders]] - 稀疏自编码器
- [[Mechanistic Interpretability]] - 机制可解释性
- [[Multilingual LLMs]] - 多语言大模型

---
#SAE #Interpretability #Representation-Learning #Script-Invariance

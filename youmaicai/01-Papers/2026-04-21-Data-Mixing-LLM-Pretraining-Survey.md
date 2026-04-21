# Data Mixing for LLM Pretraining: A Survey and Outlook

## 元信息
| 标题 | Data Mixing for Large Language Models Pretraining: A Survey and Outlook |
|------|------|
| 作者 | Zhuo Chen, Yuxuan Miao, Supryadi, Deyi Xiong |
| 链接 | [原文](https://arxiv.org/abs/2604.16380) |
| arXiv | arXiv:2604.16380v1 |
| 发表 | 2026-03-25 |
| 期刊 | Data Intelligence 8 (2026), Art. No. 2026r01 |

## 核心贡献
1. **首个系统性综述**：全面梳理 LLM 预训练中的数据混合方法
2. **形式化定义**：将数据混合优化建模为概率单纯形上的双层问题 (bilevel problem)
3. **细粒度分类体系**：
   - Static mixing：rule-based / learning-based
   - Dynamic mixing：adaptive / externally guided

## 分类体系

### Static Mixing
- **Rule-based**：基于规则的采样权重设计
- **Learning-based**：通过学习确定数据混合比例

### Dynamic Mixing
- **Adaptive**：训练过程中自适应调整
- **Externally guided**：由外部信号引导（如 loss、验证指标）

## 核心挑战
1. 跨数据域、优化目标、模型和验证集的**迁移性有限**
2. **评估协议和基准不统一**
3. 性能提升与成本控制之间的**内在张力**（learning-based 方法）

## 未来方向
- 更细粒度的领域划分 (finer-grained domain partitioning)
- 逆数据混合 (inverse data mixing)
- 管道感知设计 (pipeline-aware designs)

## 关键公式
- 数据混合优化：概率单纯形上的双层优化问题

## 关键词
`data mixing` `pretraining` `LLM` `training data` `domain weighting` `survey`

## 相关工作
- Curriculum Learning
- Data Selection for LLMs
- Mixture of Experts
- Token-level vs domain-level data selection

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*
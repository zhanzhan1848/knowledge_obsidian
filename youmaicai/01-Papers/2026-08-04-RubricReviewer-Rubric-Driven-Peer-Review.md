# 🥬 LLM 论文分析：RubricReviewer — Rubric-Driven Peer Review

## 基本信息
- **作者**：Shuyu Guo, Wenxiang Hu, Yuyue Zhao, Yougang Lyu, Xiaohui Yan
- **发表**：arXiv:2608.00005 (cs.CL, cs.AI)
- **链接**：[原文](https://arxiv.org/abs/2608.00005) | [PDF](https://arxiv.org/pdf/2608.00005)
- **arXiv**：arXiv:2608.00005

## 核心贡献
1. **RubricReviewer**：首个完全 rubric-driven 的 LLM 审稿框架，将 rubric 生成作为显式中间步骤，使审稿生成和最终评估都以 paper-adaptive rubrics 为条件
2. 融合 training-free agent (Scout) 和 human-aligned trained model (Aligner)：Scout 负责搜集外部证据，Aligner 消费证据进行审稿
3. 在真实投稿上表现显著更全面、更具判别力，且对 prompt-injection 攻击具有最强鲁棒性

## 问题背景
现有 LLM 审稿系统存在两个结构性缺陷：
1. **直接映射**：直接将稿件映射到审稿意见，rubric 隐式且推导过程与判断纠缠
2. **范式偏颇**：training-free agents 收集广泛证据但产生无方向性批评；training-based reviewers 继承人类判别能力同时也继承了噪声和不均匀覆盖

## 方法
```
输入稿件 → Scout (training-free) 搜集外部证据 → Rubric Generation (显式) 
                                                        ↓
                                                   Aligner (trained) 消费证据
                                                        ↓
                                               Rubric-Conditioned Review + 评估
```

**三个关键组件**：
- Rubric Generation：生成 paper-adaptive rubrics（显式 intermediate step）
- Scout：training-free agent，搜集外部证据
- Aligner：human-aligned trained model，消费证据，融合两方监督来源优势

## 实验
- 在真实学术投稿上评估
- 评估维度：comprehensiveness、discriminativeness、对抗鲁棒性

## 局限性
- 需要预训练 Aligner 模型，计算成本较高

## 建议
- **是否推荐使用**：是，尤其适合会议/期刊审稿辅助
- **适用场景**：学术论文审稿、AI 会议投稿评审

---
*标签*: #LLM-review #peer-review #rubric #academic-writing #prompt-injection #arXiv-2026-08

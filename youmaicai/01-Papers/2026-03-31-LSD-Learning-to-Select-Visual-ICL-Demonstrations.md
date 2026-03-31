# LSD: Learning to Select Visual In-Context Demonstrations

## 元信息
| 标题 | Learning to Select Visual In-Context Demonstrations |
|------|------|
| 作者 | Eugene Lee, Yu-Chi Lin, Jiajie Diao |
| 链接 | [原文](https://arxiv.org/abs/2603.26775) |
| arXiv | arXiv:2603.26775 |
| 代码 | - |
| 发表 | CVPR 2026 Findings Track, 2026-03-24 (announced 2026-03-31) |

## 核心贡献
1. 将演示选择重新定义为**顺序决策问题**，提出 **Learning to Select Demonstrations (LSD)**
2. 使用 **Dueling DQN + query-centric Transformer Decoder** 训练强化学习 agent 构建最优演示集
3. 发现关键二分法：
   - **kNN 最适合主观偏好任务**
   - **LSD 在客观事实回归任务上显著优于基线**
4. 通过平衡视觉相关性与多样性，LSD 更好地定义回归边界

## 方法
```
Mllm 输入: [query, selected_demos, image] → 输出
    ↑
RL Agent (Dueling DQN): 选择最优 demo 集
    ↑
Query-centric Transformer Decoder: 编码 query 特征
```

## 实验结果
- 评测：5个视觉回归基准
- 结论：LSD 在客观事实回归任务上优于 kNN，强调了 learned selection 在视觉 ICL 中的必要性

## 关键洞察
- 相似性优先的 kNN 选择冗余示例，无法捕获任务的完整输出范围
- Learned selection 对视觉 ICL 的改进取决于任务类型（主观 vs 客观）

## URL
- arXiv: https://arxiv.org/abs/2603.26775
- PDF: https://arxiv.org/pdf/2603.26775

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*

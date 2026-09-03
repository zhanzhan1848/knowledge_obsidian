# How Output Format Confounds Data Quality and Capability in Instruction Tuning

## 元信息
| 标题 | How Output Format Confounds Data Quality and Capability in Instruction Tuning |
|------|------|
| 作者 | Chengguang Gan et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02015) |
| arXiv | arXiv:2609.02015 |

## 核心贡献
1. 指令微调的数据质量指标和模型能力基准都通过"输出接口"——即答案写作的表面格式——传递
2. 使用 12 个任务的梯度签名、4 种语义等价接口、3 个模型家族，证明接口同时混淆了两个测量
3. 谱统计量（如 effective rank）对接口旋转不变且对语义腐败经验上盲目；更新方向携带质量信号
4. **核心发现**：能力本身是相对于训练接口存储的——在训练格式下提升超过 40% 准确率的技能在其他格式下可能几乎不可见；修正单一生成预算可将微调对 GSM8K 的测量效果从收益变为大损失

## 模型架构 / 方法
- Interface-conditioned quantities 分析
- 梯度签名分析跨任务、接口、模型家族
- Controlled corruptions 实验

## 实验结果
- 接口变化残余不是噪声：它完美识别每个单元自身的目标任务
- 能力是接口条件量，当前实践往往报告接口而非内容

## 局限性
- 仍不清楚接口几何形状在哪些场景下停止
- 预注册干预划定了边界

## 关键词
#instruction-tuning #data-quality #evaluation #fine-tuning

# UP-NRPA: User Portrait based Nested Rollout Policy Adaptation for Planning with LLMs in Goal-oriented Dialogue Systems

## 元信息
| 标题 | UP-NRPA: User Portrait based Nested Rollout Policy Adaptation for Planning with Large Language Models in Goal-oriented Dialogue Systems |
|------|------|
| 作者 | Hui Wang, Fafa Zhang, Meng Liu, Xiangyu Chen, Chaoxu Mu |
| 链接 | [原文](https://arxiv.org/abs/2606.13683) |
| arXiv | arXiv:2606.13683 |
| 领域 | cs.AI, cs.CL |
| 日期 | 2026-06-15 |

## 核心贡献
1. 提出 **UP-NRPA (User Portrait based Nested Rollout Policy Adaptation)** 框架，无需离线强化学习即可动态适配用户特征
2. 利用实时用户反馈 + 用户画像（人格、偏好、目标）实现对话策略的自适应定制
3. 在协作和非协作对话基准上达到 100% 成功率，谈判任务中销售/挂牌价比（SL）提升 56.41%

## 核心方法

### 问题
现有对话策略规划方法依赖离线训练的 RL 策略模型，难以动态适配多样化用户特征。

### UP-NRPA 框架
- **User Portrait（用户画像）**：从当前对话中实时映射用户的人格、偏好和目标
- **Nested Rollout Policy Adaptation（嵌套 Rollout 策略适配）**：将用户画像与实时反馈结合，动态调整对话策略
- 无需离线强化学习，无需为用户群体预训练策略模型

### 关键机制
- 在线自适应机制：根据实时反馈 + 用户画像动态定制对话策略
- 不依赖模型训练过程

## 实验结果
- 协作对话任务：100% 成功率
- 非协作对话任务：100% 成功率
- 谈判任务：SL（Sale-to-List Ratio）提升 56.41%

## 局限性
- 在极端复杂对话场景下的泛化性待进一步验证
- 计算开销随用户群体规模的变化趋势未详细讨论

## 建议
- **适用场景**：需要动态适配用户的对话系统（客服、谈判、个性化助手）
- **推荐指数**：⭐⭐⭐⭐（思路新颖，无需训练即可适配用户）
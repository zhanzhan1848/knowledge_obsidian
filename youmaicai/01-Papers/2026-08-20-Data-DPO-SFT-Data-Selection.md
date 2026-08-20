# Data-DPO: Direct Preference Optimization for Target Model Data Selection in LLM Post-Training

## 元信息
| 标题 | Data-DPO: Direct Preference Optimization for Target Model Data Selection in LLM Post-Training |
|---|---|
| 作者 | Peng Sun, Yi Yang et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.16926) |
| arXiv | arXiv:2608.16926 |

## 核心贡献
1. 提出 **Data-DPO**，首个**目标模型导向**的 SFT 数据选择方法
2. 核心洞察：现有方法将数据价值视为静态属性，忽视**数据与目标模型能力分布的兼容性**
3. Data-DPO 通过一步探测观察目标模型在不同样本上的局部训练反馈，将激活差异转化为**成对数据偏好**
4. 训练轻量奖励模型学习目标模型感知的数据偏好

## 方法三阶段

### 阶段1：单步探测
- 对目标模型执行一步前向传播，观察激活差异
- 激活差异反映样本对目标模型的训练价值

### 阶段2：偏好学习
- 将激活差异转化为成对数据偏好
- 训练轻量奖励模型学习目标模型感知偏好

### 阶段3：数据选择
- 结合：目标模型偏好 + 外部质量分数 + 边际多样性
- 构建更稳定有效的训练子集

## 实验结果
- 数据集：Vision-Flan，LLaVA-CoT
- Data-DPO 在多个数据预算下**一致优于**所有数据选择基线
- 在多个设置中**稳定超越全数据训练性能**

## 与 MASS 的关系
同期工作 MASS（2608.16927）关注层级语义覆盖；Data-DPO 关注目标模型兼容性。两者可互补。

---
*关键词：SFT，Data Selection，DPO，Fine-tuning，Post-training，LLM，Vision-Language Model，Data Efficiency*
*领域：cs.LG*

# MoRI: Motivation-Grounded Reasoning for Scientific Ideation

## 元信息
| 属性 | 值 |
|------|------|
| 标题 | Learning Motivation-Grounded Reasoning for Scientific Ideation in Large Language Models |
| 作者 | Chenyang Gu et al. (ECNU) |
| 链接 | [arXiv:2603.19044](https://arxiv.org/abs/2603.19044) |
| arXiv | arXiv:2603.19044 |
| 日期 | 2026-03-19 |
| 类别 | cs.CL |
| 代码 | [GitHub](https://github.com/ECNU-Text-Computing/IdeaGeneration) |

## 核心贡献
1. **MoRI框架**: 动机-方法推理的科学研究创意生成
2. **复合RL奖励**: 近似科学严谨性的奖励函数
3. **熵感知信息增益**: 鼓励揭示高复杂度技术细节
4. **对比语义增益**: 约束推理轨迹保持科学有效性

## 模型架构
### MoRI流程
```
科学上下文 → 研究动机生成 → 方法论推导 → 创意输出
                ↑                  ↑
           SFT初始化          RL训练
```

### 核心组件
1. **动机生成器**: 从上下文生成研究动机
2. **推理模块**: 从动机推导方法论
3. **奖励模型**: 评估科学严谨性

## 训练方法
### 两阶段训练
1. **监督微调(SFT)**: 
   - 初始化基座LLM
   - 学习上下文→动机映射

2. **强化学习(RL)**:
   - 复合奖励函数
   - 熵感知信息增益
   - 对比语义增益

### 奖励函数设计
```python
reward = (
    entropy_aware_information_gain +  # 高复杂度技术细节
    contrastive_semantic_gain         # 科学有效性对齐
)
```

## 实验结果
### 评估维度
- **新颖性**: 显著优于商业LLM
- **技术严谨性**: 超越复杂Agent基线
- **可行性**: 实际可实施性高

### 对比基线
- 商业LLM (GPT-4等)
- 复杂Agent系统
- 传统创意生成方法

## 局限性
- 需要高质量科学数据
- 领域特异性较强

## 建议
- **是否推荐使用**: 是
- **适用场景**:
  - 科研创意生成
  - 研究方向探索
  - 学术写作辅助

## 技术细节
### 现有方法问题
| 方法 | 问题 |
|------|------|
| LLM Agent | 表面级概念重组 |
| 传统方法 | 缺乏技术深度 |
| MoRI | 动机→方法显式推理 |

### 信息增益计算
```
熵感知信息增益:
- 鼓励揭示高复杂度技术细节
- 基于真实方法论的知识挖掘

对比语义增益:
- 约束推理轨迹
- 保持与科学有效解的概念对齐
```

## 相关链接
- [[scientific-reasoning]]
- [[idea-generation]]
- [[rl-for-llm]]
- [[research-automation]]

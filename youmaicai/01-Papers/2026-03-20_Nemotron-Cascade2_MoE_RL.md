# Nemotron-Cascade 2: 30B MoE with Cascade RL

## 元信息
| 属性 | 值 |
|------|------|
| 标题 | Post-Training LLMs with Cascade RL and Multi-Domain On-Policy Distillation |
| 作者 | Zhuolin Yang, Zihan Liu, Yang Chen, Wenliang Dai, Boxin Wang, Sheng-Chieh Lin et al. (NVIDIA) |
| 链接 | [arXiv:2603.19220](https://arxiv.org/abs/2603.19220) |
| arXiv | arXiv:2603.19220 |
| 日期 | 2026-03-19 |
| 类别 | cs.CL, cs.AI, cs.LG |
| 代码 | [HuggingFace Collections](https://huggingface.co/collections/nvidia/nemotron-cascade-2) |

## 核心贡献
1. **Nemotron-Cascade 2**: 30B参数MoE模型，激活参数仅3B
2. **竞赛级推理能力**: 第二个在IMO/IOI/ICPC World Finals达到金牌水平的开源LLM
3. **Cascade RL扩展**: 覆盖更广泛的推理和Agent领域
4. **多域策略蒸馏**: 从各领域最强教师模型蒸馏

## 模型架构
- **架构类型**: Mixture of Experts (MoE)
- **总参数**: 30B
- **激活参数**: 3B (高智能密度，20倍参数效率)
- **对比**: DeepSeekV3.2-Speciale-671B-A37B (首个达到IMO金牌水平的开源模型)

## 训练方法
### Cascade RL (级联强化学习)
1. **SFT阶段**: 精心策划的高质量数据集
2. **Cascade RL扩展**: 覆盖更广泛的推理和Agent领域
3. **多域策略蒸馏**:
   - 为每个领域选择最强中间教师模型
   - 在Cascade RL过程中持续蒸馏
   - 高效恢复基准回归，维持性能增益

## 实验结果
### 数学推理
- **IMO 2025**: 金牌水平
- **IOI 2025**: 金牌水平
- **ICPC World Finals**: 金牌水平

### 关键指标
- 智能密度: 20倍于更大模型
- 数学/编码推理: 接近前沿开源模型

## 局限性
- MoE架构推理需要特定优化
- 30B总参数仍需较大显存

## 建议
- **是否推荐使用**: 强烈推荐
- **适用场景**:
  - 数学推理任务
  - 代码生成与调试
  - 竞赛级问题求解
  - Agent系统

## 关键技术点
```
Cascade RL Pipeline:
1. SFT on curated dataset
2. Multi-domain RL expansion
3. On-policy distillation from domain experts
4. Checkpoint collection and data release
```

## 对比分析
| 模型 | 总参数 | 激活参数 | IMO水平 |
|------|--------|----------|---------|
| DeepSeekV3.2-Speciale | 671B | 37B | 金牌 |
| Nemotron-Cascade 2 | 30B | 3B | 金牌 |

## 相关链接
- [[moe-architecture]]
- [[cascade-rl]]
- [[knowledge-distillation]]
- [[mathematical-reasoning]]
- [[code-generation]]

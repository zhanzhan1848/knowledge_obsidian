# DIVE: Scaling Diversity in Agentic Task Synthesis

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | DIVE: Scaling Diversity in Agentic Task Synthesis for Generalizable Tool Use |
| 作者 | Aili Chen, Chi Zhang, Junteng Liu, Jiangjie Chen, Chengyu Du, Yunji Li, Ming Zhong, Qin Wang, Zhengmao Zhu, Jiayuan Song, Ke Ji, Junxian He, Pengyu Zhao, Yanghua Xiao |
| 链接 | [arXiv:2603.11076](https://arxiv.org/abs/2603.11076) |
| arXiv | arXiv:2603.11076 |
| 分类 | cs.AI, cs.SE |
| 日期 | 2026-03-10 |

## 核心贡献
1. **证据驱动合成**：反转合成顺序，先执行工具再推导任务
2. **多样性扩展**：沿两个可控轴扩展结构多样性
3. **突破性结果**：多样性扩展优于数量扩展（即使数据量少 4x）

## 问题背景
### Tool-Using LLMs 的挑战
- 合成任务用于后训练 tool-using LLMs
- 任务和工具集变化时泛化能力差
- **根本原因**：合成任务多样性不足

### 多样性扩展的困难
- 训练需要任务可执行且可验证
- 泛化需要覆盖多样工具类型、工具集组合
- 异构工具使用模式难以捕获

## 方法：DIVE

### 核心思想
**Inverted Synthesis Order**
```
传统：任务定义 → 工具执行 → 验证
DIVE：工具执行 → 证据收集 → 任务推导
```

### 两个可控轴
1. **Tool-Pool Coverage**：工具池覆盖度
2. **Per-Task Toolset Variety**：每任务工具集多样性

### Evidence Collection--Task Derivation Loop
- 执行多样化的真实工具
- 收集执行证据
- 从证据严格推导任务
- **Grounding by Construction**：构造性保证

## 实验结果

### 数据规模
- 373 个工具
- 5 个领域
- 48k SFT + 3.2k RL 数据

### 性能提升
| 指标 | 结果 |
|------|------|
| OOD benchmark 平均提升 | +22 points |
| vs 最强 8B baseline | +68 points |
| 样本效率 | 4x 更少数据 |

### 关键发现
> **Diversity scaling consistently outperforms quantity scaling for OOD generalization, even with 4x less data.**

## 应用场景
- Tool-using LLM 训练
- Agent 系统开发
- 任务合成与数据生成

## 标签
#LLM #tool-use #agentic #task-synthesis #diversity #generalization #OOD

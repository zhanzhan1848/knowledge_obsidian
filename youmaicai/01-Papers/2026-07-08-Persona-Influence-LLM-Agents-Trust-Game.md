# How Personas Can Influence Agents to Play Split or Steal

## 元信息
| 标题 | How Personas Can Influence Agents to Play Split or Steal |
|------|------|
| 作者 | Carlos Leon, Alexandre Rodrigues, Pedro Gamito, Thomas D. Parsons |
| 链接 | [原文](https://arxiv.org/abs/2607.05398) |
| arXiv | arXiv:2607.05398 |
| 领域 | cs.CL, cs.CY |

## 核心贡献

1. **首个系统性Persona影响研究**: 在信任博弈中验证Persona提示效果
2. **跨模型对比**: 评测Ministral、phi4、Gemma3、Gemma4的行为差异
3. **温度敏感性分析**: 探索随机性对策略的影响

## 实验设置

### 模型
- Ministral 3:3b
- phi4:14b
- Gemma3:12b
- Gemma4:e4b

### 温度
- 0.3 (低)
- 0.7 (高)
- 0 (确定性)

### VH对手
- GPT 4.1 mini控制

### 规模
- 160 sessions × 15 rounds
- 语言: 欧洲葡萄牙语

## 核心结果

### 总体行为
- **Mutual Split**: ~74% (合作主导)
- **Exploitation**: <11% (背叛少见)

### 模型差异显著

| 模型 | 合作性 | 策略稳定性 |
|------|--------|------------|
| phi4 | 高 | 稳定 |
| Ministral 3:3b | 高 | 稳定 |
| Gemma3:12b | 低 | 变异 |
| Gemma4:e4b | 低 | 变异 |

### Persona效果

| Persona类型 | 合作性 | 背叛倾向 |
|-------------|--------|----------|
| Prosocial | 最高 | 低 |
| Principled | 高 | 低 |
| Analytical | 低 | 高 |

### 对话主题分析
- **Split决策**: 友谊相关对话更常见
- **Steal决策**: 金钱、复仇相关对话更多
- 情感标签解释力有限

## 局限性

- 仅限信任博弈
- 欧洲葡萄牙语单一语言
- VH对手固定策略
- 虚拟Human非真实人类

## URL
- 论文: https://arxiv.org/abs/2607.05398
- PDF: https://arxiv.org/pdf/2607.05398

---
*Extracted by 油麦菜 (youmaicai) - 2026-07-08*

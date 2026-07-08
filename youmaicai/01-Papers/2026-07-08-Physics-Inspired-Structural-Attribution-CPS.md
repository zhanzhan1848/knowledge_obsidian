# From Graphs to Gradients: Physics-Inspired Structural Attribution for Cyber-Physical IoT Systems and Beyond

## 元信息
| 标题 | From Graphs to Gradients: Physics-Inspired Structural Attribution for Cyber-Physical IoT Systems and Beyond |
|------|------|
| 作者 | Georgios Papadopoulos Th. |
| 链接 | [原文](https://arxiv.org/abs/2607.05563) |
| arXiv | arXiv:2607.05563 |
| 领域 | cs.AI |

## 核心贡献

1. **能量基归因框架**: 用统计力学替代因果图建模
2. **无向依赖建模**: 无需恢复有向因果图
3. **扰动推理**: 支持跨混合相互作用的扰动效应推理

## 核心问题

大规模混合网络物理系统:
- 反馈环路存在
- 部分可观测
- 难以恢复显式有向因果结构

传统方法: 相关性分析 → 因果推断困难

## 方法

### 能量基表示
- 用无向能量景观建模变量依赖
- 分析能量景观变化反映各组件影响
- 不恢复有向因果图

### 优势
- 不需要先验因果知识
- 自然处理反馈环
- 支持部分可观测

## 实验

- 工业IoT测试平台
- 混合连续+离散变量
- 验证: attribution accuracy、robustness、scalability

## 局限性

- 不意图完全恢复系统生成动力学
- 主要用于解释，非预测
- 在更复杂系统上验证有限

## URL
- 论文: https://arxiv.org/abs/2607.05563
- PDF: https://arxiv.org/pdf/2607.05563

---
*Extracted by 油麦菜 (youmaicai) - 2026-07-08*

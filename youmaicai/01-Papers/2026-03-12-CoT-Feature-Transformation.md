# Evolving Demonstration Optimization for Chain-of-Thought Feature Transformation

## 元信息
| 标题 | Evolving Demonstration Optimization for Chain-of-Thought Feature Transformation |
|------|--------------------------------------------------------------------------------|
| 作者 | Xinyuan Wang, Kunpeng Liu, Arun Vignesh Malarkyan, Yanjie Fu |
| 链接 | [原文](https://arxiv.org/abs/2603.09987) |
| arXiv | arXiv:2603.09987 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. **闭环演化框架**：通过强化学习探索的高性能特征转换序列构建经验库
2. **多样性感知选择器**：结合CoT形成上下文，引导生成更高性能的转换特征
3. **跨模型泛化**：适用于API和开源LLM，对下游评估器保持鲁棒性

## 问题背景
特征转换(FT)是数据中心AI的核心任务，但面临挑战：
- 特征-操作组合空间巨大
- 现有方法局限：
  - 离散搜索：样本效率低
  - 潜在生成：无效候选、冗余生成
  - 静态演示LLM方法：多样性有限、与下游目标对齐弱

## 方法架构

### 核心组件
1. **Experience Library**: 下游任务验证的转换轨迹经验库
2. **Diversity-aware Selector**: 多样性感知选择器
3. **Chain-of-Thought Context**: CoT上下文引导

### 工作流程
```
RL探索 → 高性能序列 → 经验库更新 → 多样性选择 → CoT上下文 → 特征生成 → 下游评估 → 反馈
```

## 技术创新

### 演化轨迹级经验
- 从强化学习探索开始
- 持续更新经验库
- 保持高性能转换记录

### 多样性感知
- 避免冗余输出
- 扩大覆盖范围
- 提升生成质量

### CoT增强
- 提供推理链
- 引导生成方向
- 提高性能对齐

## 实验结果

### 基准测试
- 多样化表格数据基准
- 对比经典和LLM基线方法

### 关键发现
- **性能提升**：超越所有基线
- **稳定性**：比单次生成更稳定
- **泛化性**：
  - API LLM有效
  - 开源LLM有效
  - 不同下游评估器鲁棒

## 优势分析
| 方面 | 本方法 | 传统方法 |
|------|--------|----------|
| 样本效率 | 高 | 低 |
| 候选有效性 | 高 | 中 |
| 生成多样性 | 高 | 低 |
| 下游对齐 | 强 | 弱 |
| 跨模型泛化 | 是 | 有限 |

## 适用场景
- 表格数据特征工程
- 自动化机器学习(AutoML)
- 数据预处理流水线
- 特征选择与转换

## 相关工作
[[Feature-Transformation]] [[Chain-of-Thought]] [[Reinforcement-Learning]] [[Data-Centric-AI]] [[AutoML]]

## 局限性
- 主要针对表格数据
- 需要RL预探索阶段
- 计算开销需评估

---
*Created: 2026-03-12*
*Agent: 油麦菜 (youmaicai)*

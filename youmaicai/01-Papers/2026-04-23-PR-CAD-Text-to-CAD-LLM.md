# PR-CAD: Progressive Refinement for Text-to-CAD Generation with LLMs

## 元信息
| 标题 | PR-CAD: Progressive Refinement for Unified Controllable and Faithful Text-to-CAD Generation with Large Language Models |
|---|---|
| 作者 | Jiyuan An, Jiachen Zhao, Fan Chen, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.19773) |
| arXiv | arXiv:2604.19773 |
| 代码 | - |

## 核心贡献

1. **问题**：现有方法将生成和编辑视为独立任务，实用性受限
2. **PR-CAD**：渐进式精炼框架，统一生成和编辑
3. **高保真交互数据集**：涵盖完整 CAD 生命周期
4. **RL 增强推理框架**：整合意图理解、参数估计、精确编辑定位

## 方法

```
Text → CAD Representation (LLM-friendly)
           ↓
    RL-enhanced Reasoning Agent
           ↓
    Intent Understanding
    Parameter Estimation  
    Edit Localization
           ↓
    All-in-one: Generation + Refinement
```

## 实验结果

- 公开基准 SOTA
- 生成和编辑任务相互强化
- 用户友好，显著提升 CAD 建模效率

## 建议

- **是否推荐使用**：是
- **适用场景**：CAD 生成、AI 辅助设计、LLM 应用

---
**归档日期**：2026-04-23
**搜索关键词**：text-to-CAD, LLM application, generation, editing, reinforcement learning
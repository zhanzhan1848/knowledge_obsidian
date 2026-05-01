# When Your LLM Reaches End-of-Life: A Framework for Confident Model Migration in Production Systems

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Emma Casey, David Roberts, David Sim, Ian Beaver |
| 链接 | [原文](https://arxiv.org/abs/2604.27082) |
| arXiv | arXiv:2604.27082 |

## 核心贡献
1. 提出生产级 LLM 系统模型迁移框架
2. 关键贡献：**贝叶斯统计方法**，将自动化评估指标与人类判断进行校准
3. 实现有限人工评估数据下的自信模型比较

## 背景

### 问题
- LLM 生态系统快速演进
- 组织管理跨多个模型、地区、用例的 AI 服务组合
- 当底层模型到达生命周期或需要更换时面临迁移需求

## 方法

### 贝叶斯统计方法
```
自动化指标 → 贝叶斯校准 → 人类判断校准 → 自信模型比较
```

### 评估维度
1. **正确性** (Correctness)
2. **拒绝行为** (Refusal behavior)
3. **风格合规** (Stylistic adherence)

## 实验

### 应用场景
- 商业问答系统
- 服务 **530万** 月度交互
- 跨 **6个全球地区**

### 目标
- 评估模型正确性、拒绝行为和风格合规性
- 成功识别合适的替换模型

## 框架适用性
- 适用于任何部署基于 LLM 产品的企业
- 提供原则性、可重复的模型迁移方法论
- 在质量保证和评估效率之间取得平衡

## 建议
- **是否推荐阅读**: 是
- **适用场景**: LLM 生产部署、模型迁移、企业 AI 系统

---
标签: LLM, production, model migration, evaluation, MLOps
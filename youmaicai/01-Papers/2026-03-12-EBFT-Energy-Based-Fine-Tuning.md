# Matching Features, Not Tokens: Energy-Based Fine-Tuning of Language Models

## 元信息
| 标题 | Matching Features, Not Tokens: Energy-Based Fine-Tuning of Language Models |
|------|------|
| 作者 | Samy Jelassi, Mujin Kwun, Rosie Zhao, Yuanzhi Li, Nicolo Fusi, Yilun Du, Sham M. Kakade, Carles Domingo-Enrich |
| 链接 | [原文](https://arxiv.org/abs/2603.12248) |
| arXiv | arXiv:2603.12248 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.LG |

## 核心贡献
1. **特征匹配目标**: 提出针对语言模型微调的特征匹配目标，优化序列级统计而非下一个 token 预测
2. **EBFT 方法**: 提出 Energy-Based Fine-Tuning，使用 strided block-parallel sampling 高效优化
3. **理论连接**: 建立 EBFT 与 KL 正则化特征匹配和能量基建模的理论联系

## 方法架构

### 核心思想
传统交叉熵 (CE) 训练的问题：
- 优化 teacher forcing 下的下一个 token 预测
- 而非模型 rollout 下的序列级行为

EBFT 的解决方案：
- 目标：序列级完成分布的统计特征
- 无需任务特定的验证器或偏好模型
- 提供密集的语义反馈

### 技术实现

```python
# EBFT 核心流程 (概念)
# 1. Strided block-parallel sampling
#    - 从嵌套前缀并发生成多个 rollout
# 2. 批量特征提取
#    - 在 rollout 上提取嵌入
# 3. On-policy policy-gradient 更新
#    - 使用嵌入进行策略梯度更新
```

### 理论视角
- 连接到 KL 正则化特征匹配
- 连接到能量基建模

## 实验结果

| 任务 | EBFT vs SFT | EBFT vs RLVR |
|------|-------------|--------------|
| Q&A 编程 | 优于 SFT | 匹配 RLVR |
| 非结构化编程 | 优于 SFT | 匹配 RLVR |
| 翻译 | 优于 SFT | 匹配 RLVR |
| 验证交叉熵 | 低于两者 | 低于两者 |

## 优势
- 不需要任务特定验证器
- 不需要偏好模型
- 提供密集的语义反馈
- 同时实现更好的下游准确率和更低的验证交叉熵

## 应用场景
- 语言模型微调
- 编程任务
- 问答系统
- 机器翻译

## 标签
#fine-tuning #energy-based-model #feature-matching #RLVR #SFT

## 相关论文
- [[RLVR]]
- [[SFT]]
- [[能量基模型]]
- [[语言模型微调]]

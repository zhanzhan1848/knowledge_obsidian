# RIMS: Preference Optimization via Smoothed Multi-pair Aggregation for Small-Scale LLM RAG

## 元信息
| 标题 | RIMS: Preference Optimization via Smoothed Multi-pair Aggregation for Small-Scale LLM Retrieval-Augmented Generation |
|------|------|
| 作者 | Pei Tian, Zihan Dong, Tianci Liu, Linjun Zhang, Haoyu Wang |
| 链接 | [原文](https://arxiv.org/abs/2607.16431) |
| arXiv | arXiv:2607.16431v1 |
| 代码 | [GitHub](https://github.com/tptrix29/RIMS) |
| 领域 | cs.CL |
| 发表 | COLM 2026 |
| 发表日期 | 2026-07-17 |

## 核心贡献
1. 提出 RIMS，一种三阶段偏好优化框架，专为小型语言模型 (SLM) 的 RAG 设计
2. 可微分的软聚合机制替代硬选择，保留所有偏好对的梯度信号
3. 理论上证明平滑近似具有可控误差界，软聚合比硬选择产生更紧密的梯度对齐

## 问题背景
- 小型语言模型 (SLM) 在资源受限环境中用于 RAG 很有吸引力
- 但其有限容量使其对噪声或虚假检索证据高度敏感
- 现有方法（如 RoseRAG）仅选择最难的单个偏好对，丢弃其余信号
- 其他方法将多对视为独立二元比较，数据利用率低

## 三阶段框架

### 阶段1: 合成 Chain-of-Thought 偏好数据生成
- 通过拒绝采样使用目标 SLM 本身生成合成数据
- 不依赖专有模型

### 阶段2: 可微分软聚合机制
- 用平滑算子替代硬 argmin/argmax 选择
- 保留所有偏好对的梯度信号
- 保留边缘感知选择的判别结构

### 阶段3: 平滑目标的偏好优化
- 将平滑目标应用于多种对齐算法

## 理论保证
1. 平滑近似 admits 可控误差界
2. 软聚合比硬选择产生更紧密的梯度对齐到 oracle 目标

## 实验结果
- 四个多跳问答基准测试
- 多种 SLM backbone
- 在 Exact Match 和 F1 上均有提升
- 在噪声检索条件下表现尤其出色

## 建议
- **是否推荐使用**：是
- **适用场景**：SLM + RAG、边缘计算、多跳问答
- **论文级别**：COLM 2026

---
*关键词*: RAG, Preference Optimization, Small Language Model, Fine-tuning, RLHF

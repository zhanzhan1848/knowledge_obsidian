# FedMPO: Federated Multimodal Graph Learning under Modality Heterogeneity

## 元信息
| 标题 | Towards Robust Federated Multimodal Graph Learning under Modality Heterogeneity |
|------|-----|
| 作者 | (Authors from multi-party collaboration) |
| 链接 | [原文](https://arxiv.org/abs/2605.12584) |
| arXiv | arXiv:2605.12584 |
| 类别 | cs.LG, cs.AI |

## 核心贡献
1. **问题**：现实图数据常因数据共享限制而隔离，且模态经常不完整；需要鲁棒的联邦方法
2. **现有不足**：
   - 中心化 MGL 方法处理缺失模态时忽视联邦场景的知识共享和泛化
   - 联邦 MGL 方法主要针对非图数据
3. **两阶段 pipeline**：客户端模态补全 + 服务端聚合
4. **两大挑战**：
   - **Topology-Isolated Local Completion**：客户端模态生成难以有效利用全局语义
   - **Reliability-Imbalanced Global Aggregation**：多方协作受不同模态可用性和恢复可靠性的客户端更新阻碍

## 方案：FedMPO
- **Topology-aware cross-modal generation**：利用全面图上下文恢复缺失特征
- **Missing-aware expert routing**：本地过滤噪声恢复信号
- **Reliability-aware aggregation**：适当降权不可靠更新

## 实验结果
- 3 任务 × 6 数据集
- 高缺失和非 IID 设置下性能提升达 **4.10%** 和 **5.65%**

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.LG | Federated Learning | Multimodal
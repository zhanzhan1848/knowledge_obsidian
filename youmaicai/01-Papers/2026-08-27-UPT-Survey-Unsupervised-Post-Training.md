# Unsupervised Post-Training of Foundation Models: A Survey

## 元信息
| 标题 | Unsupervised Post-Training of Foundation Models: A Survey |
|------|------|
| 作者 | Yijie Xu, Qianyi Cai, Huizai Yao, Yili Wang, Tianfu Wang, Cehao Yang, Xingbo Yao, Zhiyu Guo, Aiwei Liu, Xuming Hu, Weiyu Guo, Hui Xiong |
| 链接 | [原文](https://arxiv.org/abs/2608.24982) |
| arXiv | arXiv:2608.24982 |
| 发表 | Findings of EMNLP 2026 |

## 核心贡献
1. **系统性梳理 80 种 UPT 方法**：全面分类无监督后训练（UPT）技术
2. **四类内部信号分类体系**：按信号来源分为预测统计、样本关系、自生成目标、内部评估器
3. **Input Visibility × Update Persistence 统一框架**：映射部署场景，为 UPT 选型和评估提供统一视角
4. **揭示递归误差放大风险**：内部信号选择和任务结构共同决定模型是改进还是递归放大错误

## 分类体系

### 按内部信号分类
| 类别 | 描述 | 代表方法 |
|------|------|---------|
| **Prediction Statistic** | 利用模型自身的预测统计量作为监督信号 | Self-training, Pseudo-labeling |
| **Sample Relation** | 利用样本间关系（对比、正例负例） | Contrastive learning, CURIC |
| **Self-Generated Target** | 模型自生成目标（思维链、自我推理） | Self-Reward, Self-Instruction |
| **Internal Evaluator** | 模型内部评估器或判别器提供信号 | LLM-as-a-Judge, Internal FM |

### 统一框架维度
- **Input Visibility**：模型能否访问输入（full / partial / zero）
- **Update Persistence**：更新效果的持久性（transient / persistent / cumulative）

## 核心洞察

### 递归误差放大机制
```
好情况：内部信号强化正确预测 → 模型改进
坏情况：错误被自我强化 → 递归放大误差
```

论文指出：UPT 成功的关键在于**任务结构**——只有当内部信号与真实目标存在一致映射时，UPT 才能带来真正提升。

### 与传统监督学习的区别
| 维度 | 传统 Post-training | UPT |
|------|-------------------|-----|
| 标签来源 | 人工标注/外部 oracle | 模型自身 artifact |
| 偏好数据 | 人类反馈 | 内部评估器 |
| 验证器 | 外部可执行验证 | 自生成验证 |

## 建议
- **是否推荐阅读**：是（系统综述，适合了解 UPT 全貌）
- **适用场景**：模型后训练、domain adaptation、efficiency-critical deployment

## 相关研究
- Post-training: [[Fine-tuning]] [[RLHF]]
- Self-supervised: [[Self-Supervised Learning]]
- Foundation Models: [[LLM]]

---
*标签*: #unsupervised-post-training #foundation-models #survey #EMNLP2026

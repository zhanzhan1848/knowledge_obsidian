# VEPO: Variable Entropy Policy Optimization for Low-Resource Language Foundation Models

## 元信息
| 标题 | Variable Entropy Policy Optimization for Low-Resource Language Foundation Models |
|------|----------------------------------------------------------------------------------|
| 作者 | Chonghan Liu, Yimin Du, Qi An, Xin He, Cunqi Zhai, Fei Tan, Weijia Lin, Xiaochun Gong, Yongchao Deng, Shousheng Jia, Xiangzheng Zhang |
| 链接 | [原文](https://arxiv.org/abs/2603.19152) |
| arXiv | arXiv:2603.19152 |
| 日期 | 2026-03-19 |
| 分类 | cs.CL, cs.AI |

## 核心贡献
1. **VEPO框架**: 变熵策略优化，专门针对低资源语言
2. **RLVR集成**: 使用可验证奖励的强化学习融入确定性结构约束
3. **变熵机制**: 动态调节字面保真度与语义自然性之间的平衡
4. **熵调节优势估计**: 结合非对称裁剪，维持鲁棒探索同时避免策略崩溃

## 问题背景
LLM在低资源语言上表现不佳，主要由于：
- 低效的子词分割
- 系统性训练数据不平衡

## 方法设计
### 结构约束（训练时强制）
- 规定序列长度
- 鲁棒格式一致性
- 严格语言合式性

### 变熵机制
- 动态校准探索-利用平衡
- 调节字面保真度 vs 语义自然性
- 熵调节优势估计 + 非对称裁剪

## 实验结果
- **评估方向**: 90个FLORES-200, COMET-22, chrF方向
- **改进**:
  - 分词效率显著提升
  - 翻译质量大幅提高
  - 缩小代表性不足语言的性能差距

## 技术亮点
- RLVR（Reinforcement Learning with Verifiable Rewards）
- 变熵策略优化
- 非对称裁剪策略
- 多维度评估（FLORES-200, COMET-22, chrF）

## 适用场景
- 低资源语言翻译
- 多语言模型微调
- 语言模型对齐
- 跨语言迁移学习

## 相关链接
- [[RLHF]]
- [[Low-Resource-NLP]]
- [[Multilingual-NLP]]
- [[Policy-Optimization]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*

# YOPO: You Only Pass Once

## 元信息
| 标题 | You Only Pass Once: Answering and Abstaining Together in a Single Forward Pass of a Frozen Language Model |
|------|-----|
| 作者 | Ziyang Luo, Zhongyao Chu 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.14465) |
| arXiv | arXiv:2608.14465 |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. **单次前向传播同时完成：回答 + 推理 + 弃权**
2. 解决两个耦合弱点：
   - 模型未充分利用自身残差流编码的证据
   - 模型无法检测输入是否足以回答（导致虚构）
3. 整合条件 steering probe 和 zero-shot sufficiency direction
4. **无需两遍推理**（之前方法需要干净通道避免干扰）

## 核心问题
- Steering write 改变 sufficiency direction 读取的状态 → 小模型跨域迁移损失高达 8 AUROC 点
- 独立干净通道计算 → 双倍推理成本

## 解决方案：YOPO
1. 保持 direction 固定
2. 训练小网络从 steering 后状态重建 steering 前残差（无监督 MSE 损失）
3. 在重建上读取 sufficiency direction
4. 单一前向传播同时完成回答 + 引导 + 弃权

## 实验结果
- Qwen2.5 backbone (1.5B/3B/7B)：
  - **三路准确率翻倍**：1.5B 上从 0.375 → 0.798
  - 单次前向超过两遍参考：0.798/0.830/0.893 vs 0.753/0.790/0.863
- 六个模型家族十个 backbone 验证
- 首个 answer-or-abstain 基准贡献

## 核心洞察
- **弃权不应在训练中学习**的容量-迁移边界量化
- Label-free direction 是唯一通过域迁移的门控家族

## 局限性
- 依赖 Qwen2.5 架构，其他模型迁移需调整
- 小型重建网络增加约 0.5% 参数

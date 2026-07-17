# OriginBlame

## 元信息
| 标题 | OriginBlame: Record- and Token-Level Data Provenance for AI Training Datasets |
|------|------|
| 作者 | Haolin Xue |
| 链接 | [原文](https://arxiv.org/abs/2607.13037) |
| arXiv | arXiv:2607.13037 |
| 领域 | cs.AI |

## 核心贡献
1. **问题**: 数据贡献者请求删除时，无法定位哪些训练记录属于给定作者
2. **现有方案**: 文件/数据集级别 provenance，强制灾难性过度删除
3. **OriginBlame (ob)**: 记录和 token 级别 provenance 系统，传播作者身份，解析撤销请求为精确 forget set

## 实验结果
- **数据集**: 219,555 Wikipedia pages
- **Over-deletion**: 101x → **1.3x**
- **吞吐量开销**: HuggingFace 1.3-4.0%, Datatrove 2.1-19.0%
- **Unlearning 改进**: 基于 provenance 的 forget set 比随机基线优 **42%**

## 意义
为 GDPR 等数据删除法规提供技术基础

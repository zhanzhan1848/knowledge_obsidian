# SDSL: Speculative Decoding Scaling Laws

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Speculative Decoding Scaling Laws (SDSL): Throughput Optimization Made Simple |
| 作者 | Amirhossein Bozorgkhoo, Igor Molybog |
| 链接 | [arXiv:2603.11053](https://arxiv.org/abs/2603.11053) |
| arXiv | arXiv:2603.11053 |
| 分类 | cs.CL, cs.IT, cs.LG |
| 日期 | 2026-02-25 |

## 核心贡献
1. **理论框架**：提出 SDSL 理论，解析性连接预训练 LLM 的关键超参数与下游 SD 推理系统的吞吐效率
2. **预测能力**：允许在预训练前预测推理系统组件的吞吐最优超参数
3. **成本降低**：避免昂贵的实验性优化，减少 LLM 训练成本

## 技术背景
Speculative Decoding 是一种使用多个语言模型加速推理的技术：
- 使用小型 draft model 快速生成候选 token
- 大型 target model 并行验证多个 token
- 接受正确预测，拒绝错误预测

## 方法
- 将 SD 视为计算受限的优化过程
- 建立超参数（如 draft model 大小、验证窗口）与吞吐量的解析关系
- 提供 scaling law 公式预测最优配置

## 应用场景
- LLM 推理加速
- 吞吐量优化
- 推理成本降低

## 关键洞见
- 传统方法依赖实验性调优，成本高昂
- SDSL 提供理论指导，可在预训练阶段优化
- 适用于需要大规模部署的 LLM 应用

## 相关工作
- Speculative Decoding 原始论文
- LLM 推理优化技术
- Scaling laws for neural language models

## 标签
#LLM #inference #speculative-decoding #throughput #scaling-laws #optimization

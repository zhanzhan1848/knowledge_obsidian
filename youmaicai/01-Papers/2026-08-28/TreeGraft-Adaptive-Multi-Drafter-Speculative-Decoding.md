# TreeGraft: Adaptive Multi-Drafter Grafting for Tree-Based Speculative Decoding

## 元信息
| 标题 | TreeGraft: Adaptive Multi-Drafter Grafting for Tree-Based Speculative Decoding |
|------|------|
| 作者 | Jiaming Fan, Daming Cao, Canchen Huang, Jiale Fu, Jin Zhang, Junjie Gao, Kai Yang, Xiangzhong Luo, Xu Yang |
| 链接 | [原文](https://arxiv.org/abs/2608.26112) |
| arXiv | arXiv:2608.26112v1 |
| 领域 | cs.CL |
| 发表 | 2026-05-28 |

## 核心贡献
1. **多 drafter 框架**：不同成本的 drafter 联合构建共享 draft tree
2. **TreeGraft 机制**：
   - 强 drafter 重新评分候选、重新选择嫁接位置、恢复有前景路径
   - 非破坏性集成强 drafter 扩展
3. **轻量级调度器**：从离线价值系统蒸馏，决定何时调用强 drafter
4. **平均提升 15.1%**：最高达 26.6%

## 核心创新点
- **现有方法问题**：单一 drafter 面临质量-延迟权衡
  - 小 drafter：快但树质量低
  - 大 drafter：树质量高但延迟高
- **TreeGraft 方案**：
  - 多 drafter 协作
  - 强 drafter rescoring 和路径恢复
  - 调度器控制成本

## 实验结果
| 指标 | 结果 |
|------|------|
| 10 个模型对 + 6 个基准平均提升 | 15.1% |
| 最高提升 | 26.6% |

## 建议
- **是否推荐使用**：是
- **适用场景**：LLM 推理加速、Speculative Decoding 优化
- **相关方向**：Inference Optimization、Model Compression

---
*来源：arXiv cs.CL 2026-08-28 日报*

# ReLoRA: Knowledge-Reusing Adaptation for Fast Rollout of Evolving LLM Services

## 元信息
| 标题 | ReLoRA: Knowledge-Reusing Adaptation for Fast Rollout of Evolving LLM Services |
|------|-----|
| 作者 | Yang Xu, Zihuai Xu, Hongli Xu, Yunming Liao, Zhiwei Yao, Xitong Fu |
| 链接 | [原文](https://arxiv.org/abs/2606.02606) |
| arXiv | arXiv:2606.02606 |
| 发表 | 2026-05-23 |
| 领域 | cs.LG, cs.AI |
| 代码 | - |

## 核心贡献
1. **问题定义**：大语言模型作为持续演进的服务，频繁的基础模型更新会使之前部署的 LoRA 适配器失效。从头重新训练每个 LoRA 适配器计算成本高且延迟服务发布。
2. **ReLoRA 框架**：知识复用重适配框架，通过两个关键优化步骤高效恢复服务就绪的 LoRA 适配器：
   - **自适应 LoRA 初始化**：利用贝叶斯优化构建兼容性感知起点，融合已部署任务适配器和基础模型演进的信息
   - **调度正则化微调**：先用强正则化快速将适配器引导到高质量区域，再用宽松正则化进行任务特定细化

## 方法细节

### 自适应 LoRA 初始化
- 使用贝叶斯优化在权重空间中搜索最优初始化点
- 融合源 LoRA 适配器权重与新基础模型权重的信息
- 解决适配器与新基础模型之间的兼容性问题

### 调度正则化微调
- Phase 1: 强正则化阶段快速收敛到高质量区域
- Phase 2: 放松正则化进行任务特定精调
- 减少重新适配开销

## 实验结果
- **时间节省**：ReLoRA 相比基线方法将就绪时间减少最多 **8.9×**
- **精度提升**：精度提升最多 **4.6%**
- 在多个下游任务上验证有效性

## 核心创新点
将知识复用问题建模为适配器与基础模型的兼容性问题，通过贝叶斯优化和调度正则化实现高效重适配。

## 局限性
- 依赖贝叶斯优化的搜索效率
- 需要历史适配器和新基础模型的配对信息

## 标签
#LLM #LoRA #fine-tuning #model-evolution #knowledge-reuse
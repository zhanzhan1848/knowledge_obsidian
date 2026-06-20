# CAHP: Complementary Attention Head Pruning for Efficient Transformers

## 基本信息
| 标题 | Complementary Attention Head Pruning for Efficient Transformers |
|------|------|
| 作者 | Yaniv Livertovsky et al. |
| 发表 | IJCNN 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.19150) |
| arXiv | arXiv:2606.19150v1 |
| 代码 | - |

## 核心贡献
1. **问题**: 现有剪枝方法依赖梯度重要性排名或随机门控，存在不稳定性、结构退化和超参数调优负担
2. **方法**: CAHP（Complementary Attention Head Pruning），将 head 选择重新定义为全局图论问题
3. **自适应**: 无需预定义稀疏度或剪枝比，自动通过边际性能递减曲线确定 selected heads 数量

## 核心方法

### CAHP Pipeline
1. **图论聚类**: 基于图的聚类 + 信息论距离度量
2. **互补 Head 选择**: 识别并保留拓扑多样化的互补 attention heads 子集
3. **自动停止准则**: 通过多项式阶数确定性能急剧下降点

### 关键优势
- 避免梯度方法固有的 "proximity bias"（靠近输出的层保留更多 heads）
- 在中间层保留功能关键的 attention heads

### 实验结果
- SST-5 和 MNLI 基准测试
- 不同模型规模验证
- 高压缩率下性能优于基线

## 建议
- **是否推荐使用**: 是
- **适用场景**: 资源受限环境部署、Transformer 压缩

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*
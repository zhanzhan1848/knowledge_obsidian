# Two-dimensional Early Exit Optimisation of LLM Inference

## 元信息
| 标题 | Two-dimensional early exit optimisation of LLM inference |
|------|--------------------------------------------------------|
| 作者 | Jan Hůla, David Adamczyk, Tomáš Filip, Martin Pavlíček, Petr Sosík |
| 链接 | [原文](https://arxiv.org/abs/2604.18592) |
| arXiv | arXiv:2604.18592 |
| 发表日期 | 2026-03-27 |
| 类别 | cs.CL, cs.AI |
| 会议/期刊 | - |

## 核心贡献
1. **2D Early Exit 策略**：协调 layer-wise 和 sentence-wise 退出
2. **乘法计算节省**：sentence-by-sentence 增量处理 + progressive layer activation
3. **模型无关**：只需轻量分类适配器，正交于量化/剪枝等方法

## 方法架构

### 2D Early Exit = Layer-wise × Sentence-wise
```
输入: "句子1。句子2。句子3。"
处理: 句子1 → 浅层 → 退出判断 → 若简单则停止
                    → 若复杂 → 激活更深层 → 句子2 → ...
```

### 与单维度对比
- Layer-wise early exit alone: 1D 优化
- Sentence-wise exit alone: 独立优化
- **2D 协调**: 乘法节省，效果 > 优化任一维度

### 实验设置
- **模型**: Llama 3.1, Llama 3.2, Gemma, Qwen (3B-8B 参数)
- **数据集**: 3个情感分类数据集
- **结果**: 1.4--2.3× 额外加速 (相比最优 layer-wise early exit)
- Fine-tuning 减少但不消除此优势

## 实验结果
| 模型 | 加速比 |
|------|--------|
| Llama 3.1 3B | 1.4-2.3× over layer-wise early exit |
| Llama 3.2 | 同上 |
| Gemma | 同上 |
| Qwen | 同上 |

## 关键发现
- 2D early exit 策略适用于语义信息在输入结构中可预测累积的任务
- 可能扩展到情感分类以外的序列处理任务

## 局限性
- 复杂多分类问题性能有 graceful degradation
- 主要验证分类任务，其他任务待探索

## 建议
- **是否推荐使用**：是（效率提升显著）
- **适用场景**: LLM 推理部署、边缘计算、资源受限环境

## 标签
#LLM #inference-efficiency #early-exit #transformer-optimization
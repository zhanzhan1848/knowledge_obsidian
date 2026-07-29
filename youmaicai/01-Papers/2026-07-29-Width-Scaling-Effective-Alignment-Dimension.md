# Width Scaling: LLaMA 的有效对齐维度

## 元信息
| 标题 | Mechanisms of Width Scaling in Normalized Residual Networks: The Effective Alignment Dimension |
|------|-----|
| 作者 | Jinhao Zhang, Zeyu Liu, Zicheng Yan, Yunquan Zhang, Guangming Tan, Fangming Liu, Daning Cheng |
| 链接 | [原文](https://arxiv.org/abs/2607.24887) |
| arXiv | arXiv:2607.24887 |

## 核心贡献
1. 提出 **有效对齐维度 (effective alignment dimension)**：描述 activation gradients 的 signal-noise 几何
2. 从有限样本训练/测试梯度内积推导出 misalignment probability 的有限样本上界
3. 整合到 train-test residual-expansion framework，得到 test-risk 改善的高概率条件

## 核心概念
**有效对齐维度**：
- 测量 activation gradients 中 training 和 test gradients 内积的 signal-noise 几何
- 仅依赖有效对齐维度和有效样本量
- 不需要协方差谱假设或指定宽度增长率

## 实验验证
- Width-controlled **LLaMA-style Transformers**
- **Pythia**
- **ResNet-20**

### 结果
| 发现 | 详情 |
|------|------|
| 更宽模型 → 更大有效对齐维度 | - |
| 更宽模型 → 更低经验 misalignment | - |
| 对齐统计预测 held-out loss 变化的符号和幅度 | 直接残差干预确认 |

## 关键词
#width-scaling #neural-network-theory #LLaMA #transformer #alignment-dimension #residual-networks

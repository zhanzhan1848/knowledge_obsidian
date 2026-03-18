# MoLoRA: Composable Specialization via Per-Token Adapter Routing

## 元信息
| 项目 | 内容 |
|------|------|
| **标题** | MoLoRA: Composable Specialization via Per-Token Adapter Routing |
| **作者** | Shrey Shah, Justin Wagle |
| **链接** | [arXiv:2603.15965](https://arxiv.org/abs/2603.15965) |
| **arXiv** | arXiv:2603.15965v1 |
| **分类** | cs.CL, cs.AI |
| **日期** | 2026-03-16 |

## 核心贡献

1. **Per-Token Routing**: 提出 token 级别的适配器路由，而非传统的序列级路由
2. **MoLoRA**: Mixture of LoRA，实现可组合的专业化
3. **小模型超越大模型**: Qwen3-1.7B + MoLoRA 超越 Qwen3-8B

## 问题背景

### 传统多适配器系统的局限

**Per-Sequence Routing 问题**:
```
场景 1: 多模态生成
- 文本 tokens 和图像 tokens 在同一序列
- 需要不同适配器，但传统方法只能选一个

场景 2: 混合能力请求
- "写代码解这个方程" = 代码能力 + 数学能力
- 需要多个专业适配器协作
```

**计算开销**:
- Per-sequence: O(K × N) - K 个适配器类型 × N 个 tokens
- Per-token: O(N) - 每个 token 只路由一次

## MoLoRA 架构

### 核心思想

```
输入序列: [text_token, image_token, code_token, math_token, ...]
                ↓              ↓             ↓              ↓
           [LoRA_text]   [LoRA_image]  [LoRA_code]   [LoRA_math]
                ↓              ↓             ↓              ↓
           路由器选择合适的 LoRA 适配器 (per-token)
                ↓
           组合输出
```

### 两种路由策略

1. **词汇结构路由** (多模态模型)
   - 根据 token 类型自动选择
   - 确定性路由

2. **学习门控路由** (语义专业化)
   - 可学习的路由网络
   - 基于语义内容选择

## 关键实验结果

### 规模 vs 专业化

| 模型配置 | 参数 | 推理基准性能 |
|---------|------|-------------|
| Qwen3-8B (基线) | 8B | 基准 |
| Qwen3-1.7B + MoLoRA | 1.7B | **超越 8B** |
| 提升 | - | 4.7x 更小 |

**关键发现**: 专业化 > 规模

### 优势

✅ **模块化专业知识**
- 独立训练专注的 LoRAs
- 无需重新训练即可组合
- 通过加载新适配器添加新能力

✅ **可证明的最优性**
- Per-token 路由复杂度: O(N)
- Per-sequence 路由复杂度: O(K × N)

## 实现细节

### LoRA 组合

```python
# 伪代码示意
class MoLoRA:
    def __init__(self, base_model, lora_adapters, router):
        self.base = base_model
        self.loras = lora_adapters  # {domain: lora_weights}
        self.router = router
    
    def forward(self, x):
        # Per-token routing
        routes = self.router(x)  # [batch, seq, num_loras]
        
        # Apply selected LoRAs
        outputs = []
        for token_idx in range(x.shape[1]):
            selected_lora = routes[:, token_idx].argmax()
            out = self.base(x[:, token_idx]) + self.loras[selected_lora](x[:, token_idx])
            outputs.append(out)
        
        return torch.stack(outputs, dim=1)
```

## 应用场景

### 1. 多模态生成
```
输入: "描述这张图片并生成相关代码"
     [text] → Text-LoRA
     [image] → Vision-LoRA
     [code] → Code-LoRA
```

### 2. 混合能力任务
```
输入: "用 Python 实现快速排序并分析复杂度"
     [Python语法] → Code-LoRA
     [复杂度分析] → Math-LoRA
```

### 3. 多领域问答
```
输入: "解释量子计算在药物发现中的应用"
     [量子计算] → Physics-LoRA
     [药物发现] → Bio-LoRA
```

## 与其他方法对比

| 方法 | 路由粒度 | 可组合性 | 训练成本 |
|------|---------|---------|---------|
| 传统 Fine-tuning | - | ❌ | 高 |
| Multi-LoRA (seq-level) | 序列 | 部分 | 低 |
| **MoLoRA** | **Token** | **✅** | **低** |
| MoE (Mixture of Experts) | Token | ❌ | 高 |

## 局限性

- **路由器训练**: 需要学习有效的路由策略
- **适配器管理**: 多个 LoRA 的存储和加载
- **推理开销**: 路由决策的额外计算

## 实用建议

**推荐使用**:
- 需要多领域能力的应用
- 计算资源受限但需要高性能
- 快速迭代添加新能力

**实现步骤**:
1. 为每个领域训练专门的 LoRA
2. 训练路由网络
3. 部署时按需加载适配器

## 相关概念

- [[LoRA]] - Low-Rank Adaptation
- [[Mixture of Experts]] - 专家混合模型
- [[Adapter Routing]] - 适配器路由
- [[Parameter-Efficient Fine-Tuning]]

## 个人笔记

MoLoRA 的核心洞察非常深刻：**专业化可以击败规模**。在 4.7x 更小的模型上超越大模型，证明了高效组合领域知识的重要性。

Per-token routing 的设计很优雅，解决了多模态和混合能力场景的真实痛点。这种方法可以成为构建通用 AI 系统的重要组件。

未来可能的发展方向：
- 动态适配器加载（按需从磁盘加载）
- 层次化路由（先选领域，再选子领域）
- 与 MoE 结合（每个 LoRA 内部再是 MoE）

---
#LLM #LoRA #Routing #ParameterEfficient #MultiModal

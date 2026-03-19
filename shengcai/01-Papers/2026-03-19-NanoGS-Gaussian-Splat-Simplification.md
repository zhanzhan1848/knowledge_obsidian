---
type: paper
created: 2026-03-19
updated: 2026-03-19
tags: [paper, gaussian-splatting, 3DGS, compression, real-time-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.16103
---

# NanoGS: Training-Free Gaussian Splat Simplification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | NanoGS: Training-Free Gaussian Splat Simplification |
| **作者** | Butian Xiong, Rong Liu, Tiantian Zhou, Meida Chen, Zhiwen Fan, Andrew Feng |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.16103) |
| **DOI** | 10.48550/arXiv.2603.16103 |
| **代码** | https://saliteta.github.io/NanoGS/ |

---

## 核心贡献

> 无需训练的 Gaussian Splat 简化框架，大幅减少原语数量同时保持渲染质量

1. **训练无关**：直接在现有 3DGS 模型上操作，无需重新优化
2. **轻量级**：CPU 上高效运行，无需 GPU
3. **质量保持**：通过质量感知合并保持渲染保真度

---

## 技术方案

### 核心思想

NanoGS 将 Gaussian Splat 简化问题建模为稀疏空间图上的局部成对合并。使用质量保持的矩匹配方法，用单个原语近似一对高斯，并通过原则性合并代价评估合并质量。

### 关键技术

| 技术 | 说明 |
|------|------|
| 局部成对合并 | 在稀疏空间图上进行合并 |
| 质量保持矩匹配 | 保持原始混合的质量 |
| 合并代价评估 | 原则性的合并质量度量 |
| 邻域限制 | 限制合并候选到局部邻域 |

### 算法流程

```
1. 构建稀疏空间图
2. 识别兼容的局部高斯对
3. 使用矩匹配近似合并
4. 评估合并代价
5. 迭代直到目标原语数量
```

---

## 公式

```math
\text{merge\_cost} = D_{KL}(G_1 \otimes G_2 \| G_{merged})
```

其中 $G_1, G_2$ 为原始高斯，$G_{merged}$ 为合并后的近似。

质量保持矩匹配：
```math
\mu_{merged} = \frac{w_1 \mu_1 + w_2 \mu_2}{w_1 + w_2}
```

---

## 代码片段

```python
# 伪代码：高斯合并
def merge_gaussians(g1, g2):
    # 质量保持矩匹配
    total_weight = g1.weight + g2.weight
    merged_mean = (g1.weight * g1.mean + g2.weight * g2.mean) / total_weight
    # 合并协方差...
    return Gaussian(merged_mean, merged_cov, total_weight)
```

---

## 实验结论

- **压缩率**：大幅减少原语数量
- **质量保持**：保持高渲染保真度
- **效率**：CPU 高效运行
- **兼容性**：保持标准 3DGS 参数化

---

## 局限性

- 合并操作可能丢失细节
- 极端压缩率下质量下降

---

## 相关工作

- [[3D-Gaussian-Splatting]]
- [[神经渲染]]
- [[场景压缩]]

---

## 实现建议

- **实现难度**：低（无需训练，纯几何操作）
- **预期性能**：显著减少存储和传输成本
- **适用场景**：移动端部署、Web 渲染、大规模场景流式传输

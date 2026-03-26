# 散度自由神经算子：不可压缩流

**arXiv**: [2603.24500](https://arxiv.org/abs/2603.24500)
**日期**: 2026-03-26
**作者**: Xigui Li et al.
**领域**: 机器学习 + CFD / 神经算子

---

## 核心问题

学习型流体模型通常在无约束函数空间操作，导致：
- 物理上不可接受的速度场
- 数值不稳定
- 虚假散度
- 长期崩溃

## 解决方案

### 统一框架
强制不可压缩连续方程作为**硬约束**（非软惩罚）

### 两个核心组件

#### 1. 确定性模型投影
- **可微分谱 Leray 投影**
- 基于 Helmholtz-Hodge 分解
- 将回归假设空间限制在物理可接受的速度场

#### 2. 生成模型
- **基于旋度的无散度高斯参考测度**
- 通过 curl-based pushforward 构造
- 确保整个概率流保持子空间一致性

## 理论基础

### Helmholtz-Hodge 分解
$$\mathbf{u} = \nabla \phi + \nabla \times \mathbf{A}$$

其中：
- $\nabla \phi$: 无旋部分（标量势）
- $\nabla \times \mathbf{A}$: 无散部分（矢量势）

### Leray 投影
$$\mathbb{P}: \mathbf{u} \mapsto \nabla \times \mathbf{A}$$

将任意场投影到无散子空间。

## 实验验证

### 2D Navier-Stokes 方程
- **散度约束**: 精确满足（至离散误差）
- **稳定性**: 显著改善
- **物理一致性**: 提高

## 代码结构示意

```python
# 概念性代码
import neural_operator as no

# 1. Leray 投影层
class LerayProjection(nn.Module):
    def forward(self, u):
        # 谱空间投影
        u_hat = torch.fft.fftn(u)
        # 散度自由投影
        return no.project_divergence_free(u_hat)

# 2. 无散神经算子
model = DivFreeNeuralOperator(
    projection=LerayProjection(),
    backbone=FourierNeuralOperator()
)
```

## 优势对比

| 方法 | 散度约束 | 稳定性 | 物理一致性 |
|-----|---------|--------|-----------|
| 软惩罚 | 弱 | 中 | 低 |
| 硬约束 (本文) | **精确** | **高** | **高** |

## 相关链接

- [[神经算子]]
- [[物理信息神经网络]]
- [[不可压缩流数值方法]]

## 可行性评估

🥢 **可行性分析**：

| 方面 | 评估 |
|-----|------|
| 理论严谨性 | ⭐⭐⭐ Helmholtz 分解 |
| 实现难度 | ⭐⭐⭐ 需谱方法知识 |
| 计算开销 | ⭐⭐ FFT 增加开销 |
| 应用潜力 | ⭐⭐⭐ 广泛 |

✅ **推荐采用** - 为 ML+CFD 提供物理约束框架，避免非物理解

---

*Source: https://arxiv.org/abs/2603.24500*

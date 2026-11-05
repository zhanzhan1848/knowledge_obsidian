---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 光线追踪, 可微渲染, 路径追踪, 常量内存, 蓄水池采样, 光线重放, 逆向模式, MITSUBA, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10847
---

# ResLRB: 常量内存的可微光线追踪（随机图压缩）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing |
| **作者** | Linas Beresna, Eugene Fiume（Inria Sophia Antipolis） |
| **发表** | arXiv 2026-10-07（cs.GR），**SIGGRAPH Asia 2026 / ACM TOG** |
| **链接** | [原文](https://arxiv.org/abs/2610.10847) · [HTML](https://arxiv.org/html/2610.10847v1) |
| **DOI** | — |
| **代码** | 论文未提供公开仓库（实现为 Mitsuba 3 自定义 integrator，底座 Dr.Jit） |

---

## 核心贡献

> **用「流式加权蓄水池」把每条光路的所有传感器连接压缩成 1 个**，配合 PRNG 重放 + 逐顶点局部 AD 作用域，使可微光线追踪的显存**与路径长度、每路连接数都无关**。

1. **蓄水池压缩伴随图**：primal 阶段用加权蓄水池采样（Vitter 1985）**随机保留单个代表性传感器连接**，把分支的伴随图压成一条路径。
2. **无偏梯度估计器**：$\hat{S}=\frac{W_k}{w_I}f_I(\mathbf{C}_I,u_I)$ 的期望**精确等于**确定性逐路贡献，梯度亦无偏；代价是方差增大。
3. **PRNG 重放的两趟结构**：adjoint 阶段重播种随机数流并重走同一条路径，逐顶点开**局部 AD 作用域**（记录一个散射事件 → 传播 → 丢弃）。
4. **peak AD 显存 = 微分单个散射事件的代价**，与 $k$（连接数）、$I$（选中深度）**完全无关**。
5. **Attached 扩展**：给出参数化光线段端点坐标的前向模式 Jacobian 链 $J_{0\to i}$，处理「扰动参数会移动光路从而移动 splat 位置 $u_i$」的情形（镜面/折射顶点），这是 detached 形式失效的地方。

---

## 技术方案

### 核心思想

**问题定位**：可微渲染用反向模式 AD，光传输的每个路径深度/每个散射顶点都要记图 → 图随路径深度线性增长，深度大或采样数高时显存爆掉。

已有方案：
- **Radiative Backpropagation (Nimier-David et al. 2020)**：把梯度计算重构成传输问题，**以时间换显存**
- **Path Replay Backpropagation (PRB, Vicini et al. 2021)**：primal 只存 PRNG 种子，adjoint 重播种并重走路径 → 对**视点路径追踪**是路径深度无关的常量内存

**但 PRB 对光线追踪（light tracing）不适用**：光线追踪中通量可以从**每一个散射顶点 splat 到传感器**，即每条路径有 $k$ 个候选连接 → 伴随图是**分支**的，PRB 的非分支结构无法直接套用。

**ResLRB 的解法**：既然每路有 $k$ 个连接，就**随机保留 1 个**，用蓄水池采样保证无偏。

### 关键技术

| 技术 | 说明 |
|------|------|
| **加权蓄水池采样** | primal 阶段流式处理候选 $(C_i,u_i,w_i)$，维护 $W=\sum_j w_j$，以概率 $w_i/W$ 用新候选替换当前内容；路径结束后保留索引 $I\in\{1..k\}$，$\Pr(I=i)=w_i/W_k$（Vitter 1985 经典性质） |
| **权重选择 $\ell$** | 任意「贡献处严格为正」的 $\ell$ 都保持无偏 → $\ell$ 可自由选取以降方差。本文用**亮度（luminance）**：使选择概率正比于该连接对路径图像贡献的占比，把保留连接集中到主导梯度的顶点；且 primal 已计算，零额外成本 |
| **PRNG 重放** | primal 存 PRNG 种子 + 选中索引 $I$ + 最终权重和 $W_k$，**不记录任何 AD 图**；adjoint 重播种并重走路径至深度 $I$，其余状态以 detached 形式重建 |
| **对数导数恒等式** | $\nabla_\theta\log f=\nabla_\theta f/f$ → 每个顶点可用 $\nabla_\theta f_s^{(i)}\cdot(C_I/f_s^{(i)})$ 贡献自己那一份 $\nabla_\theta C_I$，**无需持有其他顶点的图**；$W_k/w_I$ 只依赖 primal 量，视为常数 |
| **局部 AD 作用域** | 每次 adjoint 迭代开新的局部作用域，记录**单个散射事件**的图，传播梯度后立即丢弃 → peak 显存有界 |
| **Attached 扩展** | 参数化光线段端点 $\mathbf{p}_i=(\mathbf{u}_{i-1},\mathbf{u}_i)\in\mathbb{R}^4$，前向模式得逐顶点 Jacobian $J_i=\partial\mathbf{p}_{i+1}/\partial\mathbf{p}_i$，链成 $J_{0\to i}$ 描述参数扰动如何沿路径传播并移动 $u_i$；选中顶点时缓存 $J_{0\to i}$（**常量额外存储**） |
| **两种渲染模式对比** | Naive AD（ptracer）显存线性增长、深度 16 后爆显存；ResLRB 恒定 142 MB |

---

## 公式

**逐路梯度目标**：

```math
g(\bar{x};\theta)=\sum_{i=1}^{k}\nabla_{\theta}\big[f_{i}(C_{i}(\theta),u_{i})\big]
```

**蓄水池选择概率**：

```math
\Pr(I=i)=\frac{w_{i}}{\sum_{j=1}^{k}w_{j}}=\frac{w_{i}}{W_{k}}
```

**无偏估计器**：

```math
\hat{S}(\bar{x};\theta)=\frac{W_{k}}{w_{I}}\cdot f_{I}(C_{I}(\theta),u_{I})
```

**无偏性证明**：

```math
\mathbb{E}_{I}\!\left[\hat{S}(\bar{x};\theta)\right]
=\sum_{i=1}^{k}\Pr(I=i)\cdot\frac{W_{k}}{w_{i}}\cdot f_{i}(C_{i}(\theta),u_{i})
=\sum_{i=1}^{k}\frac{w_{i}}{W_{k}}\cdot\frac{W_{k}}{w_{i}}\cdot f_{i}(C_{i}(\theta),u_{i})
=\sum_{i=1}^{k}f_{i}(C_{i}(\theta),u_{i})
```

**梯度无偏**：

```math
\mathbb{E}_{I}\!\left[\nabla_{\theta}\hat{S}(\bar{x};\theta)\right]
=\nabla_{\theta}\,\mathbb{E}_{I}\!\left[\hat{S}(\bar{x};\theta)\right]
=g(\bar{x};\theta)
```

**Attached 扩展的 Jacobian 链**：

```math
J_{i}=\frac{\partial\mathbf{p}_{i+1}}{\partial\mathbf{p}_{i}},\qquad J_{0\to i}=J_{i-1}\cdots J_{0}
```

---

## 代码片段

```python
def primal(ray):
    R, W = empty_reservoir(), 0
    v = trace(ray)
    for i in range(max_depth):
        if not v.valid(): break
        C_i, w_i = connect_to_sensor(v)
        W += w_i
        if uniform() < w_i / W:
            R.store(v, C_i, w_i, i)
        v = trace(v)
    splat(R.C * (W / R.w), R.u)
    return R.depth

def adjoint(ray, I, delta_L):
    v = trace(ray)
    for i in range(max_depth):
        if not v.valid(): break
        consume_reservoir_rng()          # 保持与 primal 的随机数流同步
        f_s = bsdf_eval(v)
        delta_theta += backward_grad(f_s, delta_L * R.C / f_s)
        if i == I: break
        v = trace(v)
```

---

## 实验结论

- **数据集/场景**:
  - **Grey & White Room**（Mitsuba 3 标准场景）：路径长度 32，32 spp；测地板漫反射率的 L2 图像损失梯度
  - **玻璃板焦散**（caustic）：验证 attached 扩展
- **基线**:
  - **Naive reverse-mode AD（Mitsuba ptracer）**
  - **Detached PRB**
- **关键结果**:
  - **显存**：Naive AD 线性增长，**深度 16 后耗尽 GPU 显存**；ResLRB **恒定 142 MB**（由微分单个散射事件的代价决定）
  - **时间**：深度 4 时 ResLRB 梯度步 93 ms vs naive AD 63 ms（**1.5×** 慢）；**深度 8 追平**；深度 16 时 ResLRB 132 ms vs naive AD 260 ms（**约 2× 快**），此后 naive AD 无法运行
  - ResLRB 自身从深度 4 到深度 128 仅从 93 ms 涨到 197 ms
  - **梯度正确性**：ptracer 与 ResLRB 的梯度**符号与空间结构一致**，只差 MC 噪声 → 证实蓄水池选择保持估计器无偏
  - **玻璃板焦散**：32 spp 时 ResLRB 与 naive AD 梯度**匹配**；>32 spp 时 naive AD 显存耗尽，ResLRB 可达 **1024 spp**，得到**同一梯度但噪声更小**
- **消融/变体**（论文提出，未做完整实验）:
  - 容量 $m>1$ 的蓄水池 → 在**内存-方差权衡**上插值
  - 多趟 gather 方案 → 保留所有连接，代价是更多次路径重走
  - Attached 扩展 → 为几何逆问题打开通路

---

## 局限性

- **方差增大**：未计算的连接全部丢弃，虽然期望无偏，但方差高于全量计算
- **Attached 扩展仅是草图**：论文明确说 "the attached extension sketched above"，只给了 Jacobian 链的思路与缓存策略，未给完整实验
- **需要额外一趟路径重走**：这是换取常量内存的代价，浅路径下反而更慢（深度 4 时 1.5×）
- **只处理光线追踪（light tracing / splatting）**：视点路径追踪已有 PRB，无需此法
- **权重 $\ell$ 的选择未做系统比较**：论文只说「可用亮度」，未给其他 $\ell$ 的对比实验
- **深度 16 以下 naive AD 仍可用**，故本方法的优势区间是深路径/高采样数场景

---

## 相关工作

- [[Path-Replay-Backpropagation]] — Vicini et al. 2021（PRB，非分支结构）
- [[Radiative-Backpropagation]] — Nimier-David et al. 2020
- [[Mitsuba-3]] — Jakob et al. 2022（实现底座）
- [[ReSTIR]] — Bitterli et al. 2020（蓄水池重采样）
- [[Unbiased-Inverse-Volume-Rendering-Differential-Trackers]] — Nimier-David et al. 2022
- [[Gaussian-Light-Transport-13D-Gaussian-GI]]

---

## 实现建议

- **实现难度**: **中**（需理解 PRNG 重放与蓄水池采样，但代码量不大；难点在 Dr.Jit/Mitsuba 的局部 AD 作用域与随机数流同步）
- **预期性能**:
  - 显存：恒定 ~142 MB（vs naive AD 深度 16 后 OOM）
  - 时间：深路径下比 naive AD 快至 ~2×
  - 梯度方差上升，但高 spp 下可用「更多采样换更小噪声」
- **适用场景**:
  - ✅ **光线追踪（light tracing / photon mapping 风格）的可微优化**：焦散、间接光相关的材质/几何反演
  - ✅ 深路径 + 高采样数（1024 spp 级）的梯度计算
  - ✅ 显存受限的 GPU（消费级卡）
  - ❌ 视点路径追踪（PRB 已足够）
  - ❌ 浅路径低采样（naive AD 更快）
- **落地建议**:
  1. **这是可直接落地的工程改进**：若现有可微渲染管线用 naive AD 且深度 >16，建议优先试此方案
  2. 蓄水池权重先用**亮度**（零成本），若梯度噪声仍大可尝试 $m>1$ 的多元素蓄水池在内存-方差间插值
  3. Attached 扩展建议**后置**实现：先用 detached 形式验证无偏性与显存收益，再处理焦散类几何逆问题
  4. 与现有 PRNG 重放实现集成时，**关键是随机数流严格同步**（adjoint 中 `consume_reservoir_rng()`），这是最易出错的地方

---
type: paper
created: 2026-10-11
updated: 2026-10-11
tags: [paper, geometry-processing, implicit-surface, neural-implicit, INR, SDF, multiscale, noise-robustness]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2609.28684
venue: arXiv cs.GR, 2026-09-23
arxiv_id: "2609.28684"
---

# M-plicits: Neural Implicit Surfaces via Nested Multiscale Residuals

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | M-plicits: Neural Implicit Surfaces via Nested Multiscale Residuals |
| **作者** | Vinícius da Silva, Isabelle Melo, Matheus Bessa, Guilherme Schardong, Luiz Schirmer, André Araújo, Nuno Gonçalves, Hélio Lopes, Alberto Raposo, Luiz Velho, Tiago Novello |
| **发表** | arXiv cs.GR, 2026-09-23 |
| **链接** | [arXiv:2609.28684](https://arxiv.org/abs/2609.28684) |
| **代码** | https://github.com/dsilvavinicius/m-plicits |
| **领域** | 神经隐式表面 / INR / 多尺度残差 / 去噪表面 |

---

## 核心贡献

> 通过**嵌套邻域**训练的 MLP 残差和建模隐式表面，自然实现"低频几何先验 + 高频细节渐进细化"的鲁棒表面重建；对噪声数据天然稳健，比 iNGP / BACON / IDF 噪声鲁棒性强一个数量级，参数比 grid-based 基线少一个数量级。

1. **嵌套邻域训练**：表面建模为 MLP 残差和 $\mathrm{SDF}(x) = f_0(x) + f_1(x) + \dots + f_k(x)$，每个 $f_i$ 在上一层零水平集的**窄带**内监督
2. **隐式去噪**：粗网络天然作为低通滤波器建立干净几何先验，细残差不再拟合高频噪声
3. **无 mesh 抽取的可视化**：multiscale sphere tracing + GEMM-based 法向计算，**不依赖 marching cubes**，实时高保真渲染
4. **参数效率**：比 grid-based 基线（Instant-NGP 等）少一个数量级参数

---

## 技术方案

### 核心问题

现有 INR 表面表示的取舍：

| 方案 | 训练效率 | 渲染速度 | 噪声鲁棒性 |
|------|---------|---------|----------|
| 单 MLP（SIREN / DeepSDF） | 慢 | 慢（per-pixel MLP eval） | 较稳健 |
| Grid-based（iNGP / BACON） | 快 | 快 | 易过拟合噪声 |
| 多尺度残差（已有工作） | 中 | 中 | **硬截断 → 噪声伪影** |

### 核心思想：Nested Multiscale Residuals

$$
\mathrm{SDF}(x) = \sum_{i=0}^{K} f_i(x), \quad f_i : \mathbb{R}^3 \to \mathbb{R}
$$

**关键差异**：监督严格局部化到前一层零水平集的窄带：

- $f_0$：常规域内监督（粗几何先验）
- $f_1$：仅在 $\{x \mid |f_0(x)| < \epsilon_1\}$ 窄带内监督
- $f_2$：仅在 $\{x \mid |\sum_{j\leq 1} f_j(x)| < \epsilon_2\}$ 窄带内监督
- ...

这一嵌套设计的两个好处：
1. **粗网络是低通**：训练早期覆盖全域，自然平滑掉高频噪声
2. **细网络不再过拟合**：噪声已被粗网络"吸收"，细残差只补真正细节

### 关键技术

| 技术 | 说明 |
|------|------|
| Nested narrow-band sampling | 每层采样严格在上一层零水平集附近 |
| Sum-of-MLP representation | 残差和 = 表面 SDF |
| Multiscale sphere tracing | 沿 coarse-to-fine 层级推进 ray |
| GEMM-based normal | $\nabla f_i$ 通过解析 Jacobian + GEMM 算，无 auto-diff 开销 |
| Low-pass coarse prior | $f_0$ 天然实现去噪 |

---

## 实验结论

- **数据集**: Stanford 3D Scanning Repository, Thingi32
- **基线**: SIREN, DeepSDF, iNGP, BACON, IDF
- **关键结果**:
  - **Coarse 配置**：mean Chamfer **最佳**
  - **Fine 配置**：median Chamfer + IoU **最佳**
  - **噪声鲁棒性**：比 iNGP / BACON / IDF **显著更好**（数量级差距）
  - **参数效率**：比 grid-based 基线**少 10× 参数**
- **附加**: 实时高保真渲染（不需 marching cubes）

---

## 局限性

- **多网络训练**：$K$ 个 MLP 的训练时间是单 MLP 的 $K$ 倍（但比 grid-based 仍更快）
- **窄带宽度 $\epsilon_i$ 选择**：每层 $\epsilon$ 需要调度，过紧会丢失几何，过宽会引入噪声
- **未见证明对拓扑变化场景的稳定性**：细分后拓扑改变的鲁棒性未充分研究
- **训练开销**：嵌套窄带采样实现复杂，需自定义 batch sampler

---

## 与本知识库其他笔记的关系

- [[PCAsplat]] - 同样关注"鲁棒表面 + 下游几何处理"
- [[StyleFields]] - 另一种可控隐式表面（AdaIN 多尺度）
- [[Neural Centroidal Voronoi Tessellations]] - 神经 CVT，几何处理的另一种神经化
- [[INR Survey Notes]] (待创建) - 主题笔记

---

## 实现建议

- **实现难度**: 中（需要自定义 nested sampler + 多 MLP 残差架构）
- **依赖项**:
  - PyTorch + 自定义 batch sampler（窄带采样）
  - SIREN 风格的正弦激活或 hash grid（粗网络）
  - libigl / Open3D（参考评估指标）
- **可复用模块**:
  - Multiscale sphere tracing：作者开源
  - GEMM-based normal：避免 auto-diff 瓶颈
- **预期性能**: 训练慢于单 MLP 但快于 grid-based；推理可实时
- **适用场景**: 含噪声的扫描数据重建、对重建质量要求高的几何资材

---

## 🥬 可行性结论

✅ **推荐关注** — 这是 INR 表面在"鲁棒性 + 参数效率"两侧同时突破的工作。
- 学术价值：嵌套窄带训练为 INR 提供了一个优雅的"去噪 + 细节"解耦范式
- 工程价值：开源 + 实时渲染，适合直接集成到几何重建流水线
- 推荐下一步：测试在含噪声扫描数据上的实际重建质量，评估能否替代现有 Poisson 重建流程

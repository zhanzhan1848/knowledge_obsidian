---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 神经渲染, Gaussian-Splatting, 前馈重建, 可微优化, 形状优化, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.38951
---

# GradSplat: Gradients Inside the Forward Pass for Feed-Forward 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GradSplat: Gradients Inside the Forward Pass for Feed-Forward 3D Gaussian Splatting |
| **作者** | Jingong Chen, Linlian Jiang, Guangyuan Li, Xinxin Zuo, Yang Wang, Chulwoo Pack, Kyle Gao, Kwanghee Won |
| **发表** | arXiv preprint 2026-10-28（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2610.38951) · [HTML](https://arxiv.org/html/2610.38951v1) · [代码](https://github.com/Jingong-Chen/GradSplat/) |
| **DOI** | 10.48550/arXiv.2610.38951（DataCite pending） |
| **代码** | 论文声明将于 https://github.com/Jingong-Chen/GradSplat/ 发布 |

---

## 核心贡献

> 前馈 3DGS 从少量图像预测场景，但**预测精度低于「在同一批图像上逐场景优化自己的高斯」**。这个差距**主要来自高斯的形状（scale 与 rotation）** —— 因为只优化形状就能恢复几乎全部差距，而优化不透明度与颜色的收益要小得多。GradSplat 让模型**在自己的前向传播内部执行梯度步**，来修正自己的高斯。

1. **差距归因（gap attribution）**：定量拆解「前馈预测 vs 逐场景优化」的差距来源 —— **形状（scale/rotation）占主导**；opacity 与 color 的贡献较小。这个归因直接决定了修正顺序。
2. **Log-anisotropy correction（对数各向异性修正）**：在**对数空间**改变每个高斯的轴比，同时**保持体积不变**（constant volume）。这保证了修正形状时不会意外改变图元的「体积预算」，从而不会破坏既有的密度分布。
3. **In-forward gradient refinement（前向内梯度精化）**：把高斯渲染进**输入视图**，对**光度损失**求梯度，用一个**学习的循环更新（learned recurrent update）**应用该梯度。**先作用于 opacity 与 color，再作用于形状**。
4. **无需目标视图（no target view）**：整个精化过程只使用输入视图，不需要测试时的目标视角。
5. **结果**：
   - 完整的 **6 视图 RealEstate10K** 协议下，9 个方法中 **PSNR 与 SSIM 最佳**
   - 从 **6 到 42 个输入视图**，精度保持稳定
   - **无需微调**即可在 **DL3DV** 上取得最高精度，在 **ScanNet++** 上取得最佳 PSNR 与 SSIM

---

## 技术方案

### 核心思想

这是一个「**把迭代优化折叠进前向传播**」的设计。传统前馈 3DGS 是一次性映射：

```math
\{I_v\}_{v=1}^{K} \xrightarrow{f_\theta} \mathcal{G}
```

GradSplat 把它变成**迭代式**的：

```math
\mathcal{G}^{(0)} = f_\theta(\{I_v\}), \qquad
\mathcal{G}^{(k+1)} = \mathcal{G}^{(k)} - \eta \cdot \mathcal{U}_\phi\big(\nabla_{\mathcal{G}} \mathcal{L}_{\mathrm{photo}}(\mathcal{G}^{(k)}, \{I_v\})\big)
```

其中 $\mathcal{U}_\phi$ 是一个**学习的循环更新器**（不是普通的 SGD）——它学会「如何把梯度映射为参数更新」，等价于把优化器本身网络化了。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Gap attribution** | 量化拆解预测误差在 shape / opacity / color 上的分布 → shape 主导 |
| **Log-anisotropy correction** | 在 log 空间改轴比，保持体积不变（$\det\Sigma$ 守恒） |
| **In-forward gradient refinement** | 前向内做梯度步；渲染进输入视图 + 光度损失梯度 |
| **Learned recurrent update** | $\mathcal{U}_\phi$ 学习的循环更新器，非 SGD |
| **修正顺序** | 先 opacity & color，再 shape（据差距归因反推的优先级） |
| **无需目标视图** | 只用输入视图做精化，推理时模型「持有」这些视图 |
| **多视图输入鲁棒** | 6 → 42 视图精度稳定 |

### 公式

对数空间的各向异性修正（保持体积不变）：

```math
\Sigma = R\,\mathrm{diag}(s_x^2, s_y^2, s_z^2)\,R^\top,
\qquad
\log \mathbf{s} = \big(\log s_x, \log s_y, \log s_z\big)
```

在 log 空间施加修正 $\Delta_{\mathrm{aniso}}$，并强制体积守恒（去掉 log 空间的均值分量）：

```math
\Delta_{\mathrm{aniso}}^{\mathrm{proj}}
= \Delta_{\mathrm{aniso}}
- \frac{1}{3}\big(\textstyle\sum_i \Delta_{\mathrm{aniso},i}\big)\cdot \mathbf{1},
\qquad
\log \mathbf{s}' = \log \mathbf{s} + \Delta_{\mathrm{aniso}}^{\mathrm{proj}}
```

修正后体积不变：

```math
\det \Sigma' = \det \Sigma
\;\Longleftrightarrow\;
\sum_i \log s'_i = \sum_i \log s_i
```

前向内的循环更新：

```math
\mathcal{G}^{(k+1)} = \mathcal{G}^{(k)} - \eta\,\mathcal{U}_\phi\big(\nabla_{\mathcal{G}}\mathcal{L}_{\mathrm{photo}}(\mathcal{G}^{(k)}; \{I_v\})\big)
```

先 opacity/color 后 shape 的分阶段修正：

```math
\mathcal{L}_{\mathrm{photo}} = \sum_{v} \big\| \mathcal{R}(\mathcal{G}^{(k)}, v) - I_v \big\|_2^2
```

```math
\mathcal{G}^{(k+1)}.\{\alpha, c\}
= \mathcal{G}^{(k)}.\{\alpha, c\} - \eta_{\mathrm{oc}}\,\nabla_{\{\alpha,c\}}\mathcal{L}_{\mathrm{photo}},
\qquad
\mathcal{G}^{(k+1)}.\{s, R\}
= \mathcal{G}^{(k)}.\{s, R\} - \eta_{\mathrm{shape}}\,\nabla_{\{s,R\}}\mathcal{L}_{\mathrm{photo}}
```

### 代码片段

```python
# 概念级伪代码：前向传播内的梯度精化
def gradsplat_forward(images, K=3):
    """images: 输入视图 (K 张)。精化只使用这些视图，不需要目标视图。"""
    gaussians = predictor(images)              # f_theta: 一次性初始预测

    for k in range(K):
        # 渲染进输入视图
        renders = render(gaussians, views=input_views(images))

        # 光度损失对高斯参数的梯度
        loss = photometric(renders, images)
        grads = torch.autograd.grad(loss, gaussians.params)

        # 阶段 1：先修正 opacity 与 color（差距归因中收益较小的部分先做）
        gaussians.opacity, gaussians.color = learned_update_oc(
            gaussians.opacity, gaussians.color, grads.oc, grads.color)

        # 阶段 2：再修正 shape（主导差距），在对数空间做各向异性修正
        delta = learned_update_shape(gaussians.scale, gaussians.rot, grads.shape)
        delta = delta - delta.mean()             # log 空间去均值 → 体积守恒
        gaussians.scale = gaussians.scale * torch.exp(delta)

        # 阶段 3：应用剩余梯度（learned recurrent update，非普通 SGD）
        gaussians = recurrent_update(gaussians, grads, k)

    return gaussians
```

---

## 实验结论

- **数据集**：**RealEstate10K**（完整 6 视图协议 + 6→42 视图扫描）、**DL3DV**、**ScanNet++**
- **基线**：9 个方法（RealEstate10K 协议）
- **结果**：

| 评测 | 结果 |
|------|------|
| RE10K 完整 6 视图协议 | **9 个方法中 PSNR 与 SSIM 最佳** |
| RE10K 6 → 42 视图 | 精度**保持稳定** |
| DL3DV（无需微调） | **最高精度** |
| ScanNet++（无需微调） | **最佳 PSNR 与 SSIM** |

- **数值细节**：摘要未给出具体 PSNR/SSIM 数值与基线名称

---

## 局限性

1. **摘要未给量化表**：无法从摘要判断相对具体基线的增益幅度
2. **推理成本上升**：前向内做 K 步梯度精化 + K 次渲染，**推理时间显著高于单次前馈**（这是「免费午餐」的主要代价，摘要未报告速度）
3. **需要保持输入视图**：推理时模型「持有」输入视图（holds these views），意味着**推理必须携带全部输入图像**，存储与带宽成本上升
4. **依赖可微渲染器**：整个方法建立在「高斯渲染可微 + 梯度可用」之上，非可微渲染器不适用
5. **循环更新器的稳定性**：K 步迭代精化可能引入不稳定性（尤其在分布外场景），摘要未讨论
6. **形状修正的各向异性假设**：log 空间修正适合轴对齐不等的高斯，对强各向异性/接近退化的协方差可能不稳定

---

## 相关工作

- [[2026-11-01_GeoGSplat-Geometry-Grounded-Non-Pixel-Aligned-GS]] — 同为前馈 3DGS 的几何/深度约束路线
- [[2026-11-01_BudSplat-Feed-Forward-3DGS-Rendering-Budget]] — 前馈 3DGS 的预算与冗余
- [[2026-10-31_Gaussian-Grid-Frequency-Adaptive-Neural-Representation]] — 频率自适应计算划分
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] — 3DGS 的物理光传输
- [[Differentiable-Rendering]] / [[Gradient-Based-Optimization]] / [[Gaussian-Splatting]] — 基础技术

---

## 实现建议

- **实现难度**：**中偏高**。需要：(a) 一个可微的 3DGS 渲染器（正反向）；(b) 在 log 空间的轴比参数化与体积守恒投影；(c) 学习的循环更新器 $\mathcal{U}_\phi$（递归网络）；(d) 推理时保留输入视图的缓存管理。
- **预期性能**：在 RE10K 6 视图协议下 PSNR/SSIM 领先 9 个方法；**推理开销未在摘要中量化，是最大的未知数**。
- **适用场景**：
  - ✅ 视图数少（6 视图级别）但要求高精度的前馈重建场景
  - ✅ 有充足推理时间预算的离线/近线任务
  - ✅ 无法承受逐场景优化的工程约束，但愿意承担更高单次推理成本
  - ❌ 实时/端侧推理（迭代精化 + 携带输入视图的代价过高）
- **推荐度**：**⭐⭐⭐ 推荐** —— 核心洞见很锐利：**「前馈 vs 逐场景优化的差距主要在形状上」**，这个归因式的拆解方法值得学习（差距归因 → 定向修正）。但作为工程方案，其推理成本代价需要先量化评估。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.38951
- HTML 全文：https://arxiv.org/html/2610.38951v1
- PDF：https://arxiv.org/pdf/2610.38951
- 代码：https://github.com/Jingong-Chen/GradSplat/

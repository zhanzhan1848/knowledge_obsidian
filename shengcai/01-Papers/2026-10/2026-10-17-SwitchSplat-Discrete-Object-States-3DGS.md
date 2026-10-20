---
type: paper
created: 2026-10-20
updated: 2026-10-20
tags: [paper, 3DGS, gaussian-splatting, neural-rendering, SIGGRAPH-Asia, dynamic-scene, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.24812
---

# SwitchSplat: Learning Discrete Object States from Casually Captured Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SwitchSplat: Learning Discrete Object States from Casually Captured Scenes |
| **作者** | Yizheng Xie, Yalda Foroutan, George Shramko, et al. |
| **发表** | **SIGGRAPH Asia 2026 (Conference Papers)** — arXiv cs.CV/cs.GR (2026-10-17) |
| **链接** | [原文](https://arxiv.org/abs/2610.24812) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.24812 · ACM DOI: 10.1145/3829340.3842325 |
| **代码/项目** | https://switchsplat.github.io |
| **规模** | 19 页, 15 图, 8 表 |

---

## 核心贡献

> 首个能表达**离散物体状态（开/关）**的 3DGS 表示：通过 **base + slot 分解**，共享静态基底承载不变场景，每个 slot 独立承载一个可交互物体的两种二值状态；Gaussian 到 slot 的分配**完全可微**，因此状态几何可从视频中自动发现，无需人工标注。

1. **base + slot 分解** — 静态 base 建模不变场景；每个 slot 独立表示一个可交互物体的 on/off 两种状态。
2. **可微 slot 分配** — Gaussian 归属哪个 slot 的分配完全可微 → 模型直接从视频中发现每个状态的几何，无需人工标注。
3. **状态组合推理** — 推理时可自由组合各 slot 状态，从任意视角渲染**训练时从未出现过的状态组合**（这是 4DGS 等时间条件方法做不到的）。
4. **新 casual-capture 数据集** — 验证 novel-view 合成质量优于静态与动态基线。

---

## 技术方案

### 核心思想

**问题**: 现有 3DGS 假设静态世界；casual capture 中用户会开门、拨开关、移动物体 → 引入**离散状态变化**，当前框架无法建模。
**4DGS 等时间条件动态方法**把"何时观测到状态"与"场景处于什么状态"**混为一谈** → 只能重放见过的序列，不能组合任意物体配置。

**SwitchSplat 解法**:
- 把场景分解为 **共享静态 base** + **若干 slot**
- 每个 slot 独立承载一个可交互物体的两种二值状态（on/off）
- slot 分配可微 → 无需人工标注即可从视频发现状态几何
- 推理时自由组合 slot 状态，渲染任意（即使未见过的）状态组合

### 关键技术

| 技术 | 说明 |
|------|------|
| **base + slot 分解** | 静态基底 + 离散状态 slot 的结构化表示 |
| **二值状态 slot** | 每个 slot 持有某物体的 on/off 两种状态几何 |
| **可微 slot 分配** | Gaussian→slot 分配端到端可微，自动发现状态几何 |
| **组合推理** | 推理时任意组合 slot 状态，渲染未见过的组合 |
| **Casual-capture 数据集** | 新数据集，含自然交互的休闲拍摄 |
| **Novel-view 合成** | 静态与动态基线对比 |

---

## 公式

### base + slot 分解（结构示意）

```math
\mathcal{S} = \mathcal{B} \;\cup\; \bigsqcup_{k=1}^{K} \mathcal{S}_k^{\, s_k}
```

- $\mathcal{B}$：共享静态 base（不变场景）
- $\mathcal{S}_k^{s_k}$：第 $k$ 个 slot 的状态子集，$s_k \in \{0,1\}$ 表示 off/on

推理时按状态组合 $s = (s_1, \dots, s_K)$ 渲染：

```math
\mathbf{I}(s, \mathbf{v}) = \mathrm{Render}\!\big(\mathcal{B} \cup \textstyle\bigcup_k \mathcal{S}_k^{\,s_k},\; \mathbf{v}\big)
```

### 可微 slot 分配（Gaussian 归属）

slot 分配通过可微权重（soft assignment）实现，Gaussian 以概率/权重归属 slot：

```math
\Pi_{k} = \mathrm{Softmax}_k\big(\ell_{k}(\mathbf{g})\big), \quad \sum_k \Pi_k = 1
```

其中 $\ell_k$ 为第 $k$ 个 slot 的可微 logit（由 Gaussian 属性预测），训练时梯度回传使模型**自动发现**各状态的几何。

---

## 代码片段

论文未在摘要中提供代码。依据 base+slot 分解推断的核心结构（伪代码）：

```python
# SwitchSplat — base + slot 表示（伪代码）
class SwitchSplatModel(nn.Module):
    def __init__(self, n_slots, n_states=2):
        # 共享静态 base：标准 3DGS 集合
        self.base_gaussians = nn.Parameter(...)      # (N_base, 59)  3DGS 属性
        # 每个 slot 独立持有该物体的 on/off 两态几何
        self.slot_gaussians = nn.Parameter(...)      # (K, 2, N_slot, 59)
        # 可微 slot 分配 logits（由 Gaussian 属性 → slot 权重）
        self.slot_logits = nn.Linear(feat_dim, n_slots)

    def forward(self, view, slot_states):
        """
        slot_states: (K,) 每个 slot 的二值状态 {0:off, 1:on}
        """
        # 1. 按状态选择每个 slot 的对应态几何
        selected = gather_by_state(self.slot_gaussians, slot_states)  # (K, N_slot, 59)

        # 2. 合并 base + 选中 slot → 全场景 Gaussian 集合
        gaussians = cat([self.base_gaussians, flatten(selected)], dim=0)

        # 3. 标准 3DGS 光栅化
        image, depth = rasterize_3dgs(gaussians, view)

        return image, depth
```

```python
# 训练：从视频中自动发现状态几何（slot 分配可微）
for step in range(num_steps):
    # 采样一个训练视角 / frame
    image_gt, view = sample_frame(dataset, step)

    # 自由组合 slot 状态（可采样训练中观测到的状态）
    slot_states = sample_states(batch)   # (B, K) in {0,1}

    # 前向：base + 对应状态 slot → 渲染
    image_pred = model(view, slot_states)

    # 像素级监督 + 重建损失
    loss = l1(image_pred, image_gt) + lambda_ssim * (1 - ssim(image_pred, image_gt))
    loss.backward()   # 梯度回传 → slot 分配 logits 自动学习状态几何
```

---

## 实验结论

- **数据集**: 新的 casual-capture 数据集（含自然交互：开门、开关、移动物体）
- **基线**: 静态 3DGS、动态（时间条件）方法如 4DGS
- **结果**:
  - Novel-view 合成质量**优于静态与动态基线**
  - 独特支持**渲染训练中从未出现过的状态组合**（基线无法做到）
  - 无需人工状态标注即可自动发现各状态几何

---

## 局限性

| 项 | 说明 |
|----|------|
| **状态类型** | 面向**离散二值状态**（on/off）；不适用于连续状态变化（开门角度） |
| **交互范围** | casual capture 尺度，未必适用于大规模/高精度场景 |
| **渲染效率** | 沿用 3DGS 光栅化，未涉及新的加速结构；未见实时性承诺细节 |
| **代码** | 摘要页仅给项目页，代码是否公开需访问 https://switchsplat.github.io |
| **依赖 base 假设** | 静态 base 假设大部分场景不变，对高度动态场景可能不足 |

---

## 相关工作 (本知识库内)

- [[2026-10-19-X-Splat-Joint-RGB-Xray-3DGS]] — X-Splat: 统一 RGB + X-ray 3DGS（SIGGRAPH Asia 2026，同期）
- [[2026-10-12-SplatQ-Pruning-3DGS-Quadratic-Selection]] — 3DGS 剪枝
- 3DGS 相关基础笔记（MCMC densification / 剪枝 / 动态 3DGS / 4DGS）

### 同期 SIGGRAPH Asia 2026 3DGS 论文

| 论文 | 方向 |
|------|------|
| **SwitchSplat** (Oct 17) | 离散物体状态（on/off）分解 |
| **X-Splat** (Oct 16) | 联合 RGB + X-ray 重建 |
| **Stable Signer V3** (Oct 18) | 4D 可变形 primitive splatting 数字人 |

---

## 实现建议

- **实现难度**: ⭐⭐⭐ (中)
  - 基于现有 3DGS 代码库（GSplat / 原生 3DGS）扩展
  - 核心改动：参数结构（base + slots）+ 可微 slot 分配 + 状态组合推理
- **预期性能**:
  - 沿用 3DGS 光栅化 → 训练/推理速度与同规模 3DGS 相当
  - NVS 质量优于静态与动态基线（论文报告）
- **适用场景**:
  - ✅ 可交互场景的 3D 重建（智能家居、游戏场景状态切换）
  - ✅ 需要"组合未见状态"的资产生产（一次采集，多状态复用）
  - ⚠️ 连续动画/形变不适用（那是 4DGS/形变 splatting 的领域）
- **优先级**: **中高**
- **行动**: 传递给 @墨鱼丸 (moyuwan)
  1. 评估在现有 3DGS 管线中增加 base+slot 分解与可微分配的改造成本
  2. 探索 slot 状态是否可扩展到多值/连续（开门角度）以覆盖更广交互
  3. 与 [[2026-10-19-X-Splat-Joint-RGB-Xray-3DGS]] 对比：多模态输入 vs 结构化状态分解，两种正交设计可组合
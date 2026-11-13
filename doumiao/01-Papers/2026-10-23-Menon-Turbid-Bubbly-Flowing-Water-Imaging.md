---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, underwater-imaging, turbid-water, optical-flow, image-restoration, physics-optics]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.32646
---

# Computational Imaging through Turbid, Bubbly and Flowing Water near the Telescope

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Computational imaging through turbid, bubbly and flowing water near the telescope |
| **作者** | Rajesh Menon 等 |
| **发表** | arXiv 2026-10-23（31.9 MB），physics.optics / cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2610.32646) |
| **DOI** | [10.48550/arXiv.2610.32646](https://doi.org/10.48550/arXiv.2610.32646) |
| **代码** | 未公开（但提及有代码发布） |

---

## 核心贡献

> 恢复网络通常只在"显示图像"上打分，与真实物理观测脱节。本文引入一个**实测数据集**：望远镜透过物镜前 45 mm 处的 25 mm 水层，在 7 种「流场 × 气泡 × 浑浊度」组合下拍摄显示图像与真实物体，并以清水录制为第二参考。

1. **实测数据集**：真实测量（非纯合成）的水下浑浊/气泡/流动成像，配备清水参考。
2. **物理解释**：悬浮物把光散射到 1.3° 视场之外，因此浑浊度主要**降低对比度**（Siemens 星上降 4.4–4.8 倍）。
3. **反直觉的结论**：直接对原始帧做分类，效果与恢复后的图像相当；用数字源或清水参考打分会**反转原始帧与恢复图像的排序**。
4. **可落地的简化管线**：帧平均 → 直接对原始帧分类 → 用「实测 + 合成」配对训练的网络做恢复。

---

## 技术方案

### 核心思想

冲浪区（surf zone）或船尾浪后的相机会透过**浑浊的、含气泡的、流动的水**（靠近镜头）拍摄。已有恢复网络的问题在于**评估基准错位**——只在显示图像（displayed images）上评分，而真实需求是穿过真实水体观测。

**核心物理机制**：悬浮颗粒把光散射到 **1.3° 视场之外**，所以浑浊度的主要后果不是"模糊"，而是**对比度衰减**（Siemens 星上 4.4–4.8 倍）。这一认识决定了恢复策略应为**去散射/去雾**而非去模糊。

### 关键技术

| 技术 | 说明 |
|------|------|
| **实测数据集** | 望远镜物镜前 45 mm 处放 25 mm 水层；7 种流场/气泡/浑浊度组合；另录清水作为第二参考 |
| **显示图像 + 真实物体双目标** | 两种拍摄目标（屏幕显示图像 vs 实物）构成对照 |
| **多帧平均** | 8 帧平均 → SSIM 相对单帧提升 **0.032**；学习型帧融合增益甚微 |
| **合成训练配对** | 加入合成训练对后，显示图像分数不变，但**恢复后的 Siemens 星与清水记录的相关性从 <0.5 提升到 >0.9** |
| **跨域泛化** | 这些网络**无需重训**即可改善普通水下照片；仅用实测配对训练则失败 |
| **西门子星（Siemens star）** | 标准 MTF 靶标，用于量化对比度损失 |

---

## 公式

```math
% 浑浊介质中的直接透射项与散射项（简化）
I(\lambda)=\underbrace{I_0(\lambda)e^{-\tau(\lambda)}}_{\text{direct (contrast)}}
+\underbrace{I_{\text{scat}}(\lambda)}_{\text{scattered out of FOV}}

% 对比度衰减（Siemens 星）
C = C_0 \cdot e^{-\tau}, \quad \tau = \text{消光系数}\times\text{水层厚度}
% 实测：25 mm 水层 → 对比度降 4.4–4.8 倍

% 多帧平均的 SSIM 增益
\mathrm{SSIM}_{\text{avg 8 frames}}-\mathrm{SSIM}_{\text{single}} = +0.032
```

### 代码片段

```python
# 帧平均去散射（基础管线）+ 训练配对生成
def multi_frame_average(frames, weights=None):
    """8 帧平均可提升 SSIM 0.032；学习型融合增益甚微"""
    return np.average(frames, axis=0, weights=weights)

def build_training_pairs(measured_scenes, synthetic_generator):
    """实测配对 + 合成配对联合训练：
       显示图像分数不变，但 Siemens 星与清水记录相关性 <0.5 -> >0.9"""
    pairs = list(measured_scenes) + list(synthetic_generator())
    return pairs

# 分类：直接用原始帧，不做恢复
def classify(frames, model):
    return model(multi_frame_average(frames))   # 原始帧分类 96.8%
```

---

## 实验结论

- **数据集**: 自建实测数据集 —— 25 mm 水层 @ 45 mm，7 种流场/气泡/浑浊度组合，清水参考 + 目标为显示图像与实物
- **基线**: 单帧恢复、学习型帧融合、线性/传统恢复网络、仅实测配对训练、仅合成配对训练
- **结果**:
  - 浑浊度使 Siemens 星对比度**降低 4.4–4.8 倍**（光被散射出 1.3° 视场）
  - 8 帧平均使 SSIM **+0.032**；学习型帧融合**增益很小**
  - **单帧原始图像即支持五类识别（96.8%）**，与恢复图像相当
  - 加入合成训练对：显示图像分数不变，但恢复后的 Siemens 星与清水记录的相关性从 **<0.5 → >0.9**
  - 用合成+实测配对训练的网络**无需重训**即可改善普通水下照片；仅用实测配对训练则**失败**
  - **对数字源或清水记录打分会反转原始帧与恢复图像的排序** → 评估基准的选择至关重要

---

## 局限性

- 特定波长/特定水层厚度（25 mm）下的结论，**未给出普适标定曲线**
- 训练数据以合成为主、实测为辅，实测配对不足时泛化受限（仅实测训练失败）
- 未涉及三维水体或非近场浑浊
- 水下恢复的"真值"定义本身有歧义（本文的贡献正是指出这点）
- 未公开代码（虽文中提及将发布）

---

## 相关工作

- [[2026-11-13-Sancho-Rath-Manzi-Chang-Bermano-Nowrouzezahrai-Gross-Papas-Neural-Render-Proxies]]
- [[2026-11-13-Julin-Xie-Bal-Sakashita-Niinuma-Jeni-ReCan-GS-Distractor-Free-4DGS]]
- [[2026-10-15-Physics-Shaped-Underwater-Image-Restoration-Audit]]
- [[Volume-Rendering]]
- [[Underwater-Imaging]]

---

## 实现建议

- **实现难度**: 中（需搭建实测捕获装置 + 合成数据生成器 + 配对训练）
- **预期性能**: SSIM +0.032（帧平均）；Siemens 星相关性 >0.9（合成+实测混合训练）
- **适用场景**: 近镜头浑浊水体成像；水下巡检/生物观测；浅水区视觉
- **对流体渲染的启示**:
  - **散射出视场 → 对比度衰减**是流体介质渲染（水下体积光）的关键物理：体积渲染积分中"散射到视野外"的能量应视为**对比度损失**而非模糊，这直接影响单次散射/多次散射的近似策略
  - **合成 + 实测混合训练**是流体渲染数据稀缺的通用解法（对应 [[2026-11-13-Julin-Xie-Bal-Sakashita-Niinuma-Jeni-ReCan-GS-Distractor-Free-4DGS]] 用合成 SmokeSeer + 真实 iPhone 采集）
  - **评估基准反转**这一发现警示：流体渲染的感知质量评估必须明确"参考真值"是显示图像还是物理真值，否则结论可能反向

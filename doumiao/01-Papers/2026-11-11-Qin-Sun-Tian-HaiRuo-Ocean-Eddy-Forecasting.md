---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, ocean-rendering, eddies, foundation-model, satellite-altimetry, forecasting, cs.LG]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.14136
---

# HaiRuo: Forecasting Ocean Eddies as Fields and Objects with a Satellite-Altimetry Foundation Model

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HaiRuo: Forecasting Ocean Eddies as Fields and Objects with a Satellite-Altimetry Foundation Model |
| **作者** | Xukun Qin, Haochen Sun, Yuyang Tian, Ge Chen — **北京大学 / 上海人工智能实验室** |
| **类别** | cs.LG, cs.CV |
| **发表** | arXiv preprint (cs.LG, cs.CV), 2026-11-10 |
| **链接** | [arXiv:2611.14136](https://arxiv.org/abs/2611.14136) |
| **DOI** | — |
| **代码** | **✅ https://github.com/xkqin/HaiRuo**（开放权重 checkpoint + 代码 + project page） |
| **分类** | 海洋渲染 / 涡旋预测 / 基础模型 / 遥感 |

---

## 核心贡献

> **HaiRuo 同时把海洋中尺度涡"当场"也"当物体"来预测**：一次前向 → 15 天海面高度场 + 地转流场 + 每日涡旋掩膜 + 今日每个涡旋的轨迹。**15 天涡旋中心误差 25.2 km（vs 基线 30.6 km，−18%）**，在**全球全海域**预注册评估中**全面优于 14 个方法**。

1. **问题：涡旋追踪依赖"事后启发式"**
   - 中尺度涡 (mesoscale eddy) 携带海洋大部分动能，输运热、盐、营养盐；
   - 但"两周后涡旋在哪"仍靠海洋模式 + **后置追踪启发式 (post-hoc tracking heuristics)** 读出；
   - 追踪启发式在涡旋合并/分裂/涡旋-流轴相互作用时易失效。

2. **双组件分工**
   - **(1) HaiRuo-1B** —— **10.5 亿参数开放权重基础模型**；
     - 在 **24 年全球卫星测高观测**上**无标签预训练**；
     - 输出 **15 天物理场 + 涡旋掩膜**；
     - 增益：同解码器下 **场精度 +0.14**、**mIoU +1.1 点**；冻结时 15 天中心误差 **再降 1.2 km**（从头训练则 1.35 km）。
   - **(2) XuanJi** —— **拉格朗日物体解码器**；
     - 在每个涡旋的**随动极坐标系 (co-moving polar frame)** 中采样预报场；
     - **三轮前瞻**精化 15 天路径；
     - 增益：HaiRuo-1B 上 **−2.5 km**（联合微调 2.9 km）；通过**物体注意力**跨 6 个已发表骨干再降 **2.5–3.3 km**。

3. **全球预注册评估（关键方法论贡献）**
   - **一个预注册协议**评估**整个全球海洋**（而非只在标注区域）；
   - 在**所有端点指标上优于 14 个方法**；
   - **优势保持在标注区域之外**，且**穿越 ENSO 两个阶段**保持；
   - 复现了**西向漂移、50–60°S 向东反转、极向气旋/反气旋偏转**。

4. **管线级误差削减**
   - 经一个固定 tracker 追踪 10 天：**预报场**使 WenHai 与 XiHe 的涡心误差**降低 37–43%**（−2.8 km vs 第 0 天，而它们**退化 +4.3–8.7 km**）；**物体轨迹**使管线误差**全球降低 77–78%**。

---

## 技术方案

### 核心思想

**"场"与"物体"是同一现象的两种表示**：
- **场表示**：把涡旋并入连续的海面高度场（Eulerian）→ 便于与海洋学/数值模式耦合；
- **物体表示**：把涡旋视为离散实体（Lagrangian）→ 便于追踪、身份保持、生命周期。

多数方法只做其一。HaiRuo 的做法是**分工**：
- 基础模型负责**物理场 + 掩膜**（无需显式对应，天然处理合并/分裂）；
- 拉格朗日解码器负责**个体轨迹**（在随动坐标系中采样，天然保持身份）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **HaiRuo-1B (1.05B params, open-weight)** | 24 年卫星测高无标签预训练 |
| **XuanJi Lagrangian object decoder** | 随动极坐标系采样 + 3 轮前瞻精化 |
| **Co-moving polar frame sampling** | 在涡旋自身坐标系中采样预报场 → 轨迹稳定 |
| **Object attention across backbones** | 物体级注意力，可叠加到 6 个已发表骨干 |
| **Pre-registered global evaluation** | 预注册 + 全球全海域评估，报告标注区外表现 |
| **ENSO phase robustness** | ENSO 两个阶段均保持优势 |
| **Fixed-tracker evaluation** | 用同一固定 tracker 评估预报场（隔离 tracker 差异） |

---

## 公式

```math
% 地转流（涡旋运动学基础）
\mathbf{u}_g = \frac{1}{f}\ \hat{\mathbf{k}} \times \nabla \eta,
\qquad f = 2\Omega\sin\varphi\ \text{(科氏参数)}

% 涡旋掩膜与中心（随动坐标系中的位置积分）
\mathbf{x}(t) = \mathbf{x}(t_0) + \int_{t_0}^{t} \mathbf{u}_g\big(\mathbf{x}(t'),t'\big)\,dt'

% 预报场中的涡旋识别
M(\eta, u_g) \in \{0,1\},\qquad
\mathbf{c} = \arg\max_{M=1} \mathbf{u}_g
```

---

## 代码片段

```python
# 概念伪代码：HaiRuo 双组件推理
def forecast(sat_30d, lead_days=15):
    # (1) 基础模型：30 天海面高度图 → 15 天物理场 + 涡旋掩膜
    fields, masks = HaiRuo_1B(sat_30d)      # eta, geostrophic_vel, daily masks

    # (2) 拉格朗日物体解码器：在随动极坐标系中采样并前瞻精化
    trajectories = {}
    for eddy in alive_eddies(masks[0]):
        frame = co_moving_polar_frame(eddy, fields)
        for rnd in range(3):                # 三轮前瞻精化
            traj = XuanJi(frame, masks, lead_days, round=rnd)
            frame = recentre(frame, traj)   # 用新轨迹重设随动坐标系
        trajectories[eddy.id] = traj

    return fields, masks, trajectories
```

---

## 实验结论

- **数据**：**24 年全球卫星测高**（无标签预训练）；预注册全球评估；
- **基线**：**14 个已发表方法**（含 WenHai、XiHe 等 tracker/预报方法）；
- **结果**：
  - **15 天涡心误差 25.2 km vs 30.6 km（−18%）**，在所有端点指标上**优于 14 个方法**；
  - 优势**保持于标注区域之外**，且**穿越 ENSO 两阶段**保持；
  - 复现**西向漂移、50–60°S 向东反转、极向气旋/反气旋偏转**；
  - 固定 tracker 10 天评估：**预报场**使 WenHai/XiHe 涡心误差 **−37~43%**（它们自身退化 **+4.3~8.7 km**）；**物体轨迹**使管线误差 **全球 −77~78%**；
  - 物体注意力叠加到 6 个已发表骨干，再降 **2.5–3.3 km**。

---

## 局限性

- 依赖**卫星测高**，空间分辨率有限（涡的细结构不可见）；
- **涡旋"物体"的定义依赖掩膜生成规则** → 跨研究可比性受限；
- 15 天预报在**强非线性涡-流轴相互作用**与**极端 ENSO** 事件下的表现未详述；
- 论文主攻**海洋科学/预报**，**渲染相关未涉及**（面向渲染的价值见下）。

---

## 相关工作

- [[2026-10-30-Broadband-Water-Wave-NLS]] — 宽频带水波谱
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性终态谱
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] — 水体动画
- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]] — 涡统计

---

## 实现建议

- **实现难度**：🟡 中（开放权重 + 代码；需 GPU 推理）
- **预期性能**：一次前向输出 15 天场 + 掩膜 + 轨迹；15 天涡心误差 ~25 km
- **适用场景**：
  - ✅ **海洋/湖面渲染的涡旋结构来源**：给出**可信的多尺度涡旋场与轨迹** → 驱动洋流贴图流速场、涡旋泡沫拖尾、离岸流着色
  - ✅ **大尺度水体动画的"物理真值"参考**（15 天尺度）
  - ✅ **海洋场景的长期演化驱动**（季节性洋流变化）
  - ⚠️ 高频局部涡结构（尺度 < 卫星分辨率）仍需叠加本地湍流模型
  - ❌ 不适用于淡水/室内水体（域外的海洋涡统计）
  - ❌ 实时逐帧海洋模拟（这是预报模型，非实时模拟器）

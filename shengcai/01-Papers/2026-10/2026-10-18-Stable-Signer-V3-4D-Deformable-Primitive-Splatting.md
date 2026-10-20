---
type: paper
created: 2026-10-20
updated: 2026-10-20
tags: [paper, 3DGS, gaussian-splatting, splatting, avatar, SIGGRAPH-Asia, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.24926
---

# Stable Signer V3: 4D Deformable Primitive Splatting for Sign Language Production

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stable Signer V3: 4D Deformable Primitive Splatting Is All You Need for Sign Language Production |
| **作者** | Sen Fang, Liwei Che, Dimitris N. Metaxas (Rutgers University) |
| **发表** | arXiv cs.CV/cs.GR (2026-10-18) |
| **链接** | [原文](https://arxiv.org/abs/2610.24926) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.24926 |
| **代码/项目** | https://signerx.github.io/Stable-Signer-V3 |
| **规模** | 12 图, 10 表 |

---

## 核心贡献

> 面向手语数字人的交互式高分辨率 avatar，基于 **4D 可变形 primitive splatting**，通过三个模块（共享面部 primitive、test-time 身体 primitive、test-time 隧道超分）显著降低面部/身体几何误差与高分辨率 RGB 重建误差，同时保留交互式流式播放。

1. **Shared Face Primitive Splatting** — 引入可迁移的超二次曲面（superquadric）primitive，增强面部表情控制（解决表情受限问题）。
2. **Test-Time Body Primitive Splatting** — 学习身份专属的"虚拟肌肉层"，更忠实地表达身体形变（解决身份相关形变不准问题）。
3. **Test-Time Tunneling Super-Resolution (TunnelingNet)** — 恢复身份专属高分辨率细节（解决细节丢失问题）。
4. **Test-time 优化一次，推理零开销** — 两个 test-time 模块按身份各优化一次，推理完全从存储的身份参数运行。

---

## 技术方案

### 核心思想

针对现有手语 avatar 的三个局限：
- 面部表情受限
- 身份相关的身体形变不准确
- 细节外观丢失

**方案**：4D 可变形 primitive splatting + 三个改进模块。关键设计是 **test-time optimization**：身体 primitive 与隧道超分都在推理前按身份优化一次，之后推理仅用存储参数 → 保留交互式流式渲染。

### 关键技术

| 技术 | 说明 |
|------|------|
| **4D Deformable Primitive Splatting** | 基座：四维可变形 primitive 的 splatting |
| **超二次曲面 primitive** | superquadric 基元，表达面部表情 |
| **Shared Face Primitive** | 跨身份共享、可迁移的面部 primitive |
| **虚拟肌肉层** | 身份专属身体形变表示（Test-Time 优化） |
| **TunnelingNet** | 隧道式超分网络，恢复高分辨率细节（Test-Time 优化） |
| **Test-time 优化** | 按身份优化一次，推理时零额外开销 |
| **交互式流式** | 优化后保留 streaming 能力 |

---

## 公式

### 虚拟肌肉层形变（Test-Time Body Primitive，概念式）

身份专属形变由"虚拟肌肉"驱动，可表示为对 primitive 施加形变场：

```math
\mathbf{x}' = \mathbf{x} + \sum_{m=1}^{M} \alpha_m(\mathbf{x})\,\mathbf{d}_m
```

其中 $\mathbf{d}_m$ 为第 $m$ 块"肌肉"的位移场，$\alpha_m(\mathbf{x})$ 为其空间权重；$\alpha_m, \mathbf{d}_m$ 在 test-time 按身份优化确定。

### 超二次曲面 primitive（面部）

```math
F(u,v) : \left|\frac{u}{a}\right|^{n_1} + \left|\frac{v}{b}\right|^{n_2} = 1
```

指数 $n_1, n_2$ 控制 primitive 形状，用于表达不同面部表情；形状参数在多个身份间共享（shared），具体权重按身份适配。

---

## 代码片段

论文未在摘要页提供代码。依据方法推断的核心流程（伪代码）：

```python
# Stable Signer V3 — Test-Time 优化 + 推理（伪代码）

# ---------- 阶段 1: Test-Time 优化（每个身份一次）----------
def test_time_optimize(sign_id, capture_data):
    # Test-Time Body Primitive: 学身份专属"虚拟肌肉层"
    muscle_weights, muscle_dirs = fit_virtual_muscles(
        identity=sign_id, data=capture_data
    )
    # Test-Time Tunneling Super-Resolution: 学身份专属高分辨率细节
    tunnel_net = TunnelingNet()
    train_tunneling_superres(tunnel_net, sign_id, capture_data)

    # 存储身份参数（推理时只用这些）
    save_identity_params(sign_id, muscle_weights, muscle_dirs, tunnel_net)
    return sign_id

# ---------- 阶段 2: 推理（交互式流式，实时）----------
def render(sign_id, stream_frame):
    # 从存储的身份参数加载（无额外优化）
    params = load_identity_params(sign_id)

    # 4D 可变形 primitive splatting 渲染
    primitives = shared_face_primitives + \
                 deform_body_primitives(params.muscle_weights, params.muscle_dirs)
    splats = splat_primitives(primitives, stream_frame)

    # 隧道超分恢复高分辨率细节
    hr_rgb = params.tunnel_net(super_resolve(splats))
    return hr_rgb  # 交互式 streaming
```

---

## 实验结论

- **数据**: 10 个手语者身份
- **评估**: held-out evaluation（留出测试）
- **结果**:
  - 面部几何误差降低 **71.4%**
  - 身体边界误差降低 **35.1%**
  - 高分辨率 RGB 重建误差降低 **24.2%**
- **实时性**: 保留交互式流式（interactive streaming）

---

## 局限性

| 项 | 说明 |
|----|------|
| **应用面窄** | 专注手语 avatar，属于数字人子领域，非通用渲染技术 |
| **身份专属优化** | 需为每个新个体做一次 test-time 优化（预计算成本） |
| **训练数据** | 依赖每位手语者的多视角/高分辨率采集数据 |
| **代码** | 摘要页仅给项目页，开源状态需访问项目主页确认 |
| **渲染机制** | 沿用 primitive splatting，未提出新的加速/光栅化结构 |

---

## 相关工作 (本知识库内)

- [[2026-10-17-SwitchSplat-Discrete-Object-States-3DGS]] — 同期 3DGS 结构化状态分解（SIGGRAPH Asia 2026）
- [[2026-10-19-X-Splat-Joint-RGB-Xray-3DGS]] — X-Splat: 联合 RGB + X-ray 3DGS（SIGGRAPH Asia 2026）
- 3DGS / 动态 splatting / primitive-based splatting 相关基础笔记

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ (较高)
  - 需要 4D splatting、superquadric primitive、TunnelingNet 超分等多项技术
  - Test-time 优化流程工程量大
- **预期性能**:
  - 面部几何误差 ↓71.4%，身体边界 ↓35.1%，HR RGB ↓24.2%
  - 保留交互式流式
- **适用场景**:
  - ✅ 手语翻译 / 无障碍 avatar
  - ✅ 高保真数字人（身份专属 + 高分辨率）
  - ⚠️ 通用渲染管线价值有限（高度面向 avatar）
- **优先级**: 中（非通用渲染技术）
- **行动**: 不传递 @墨鱼丸；归档为 **4D splatting 数字人** 方向参考
---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, differentiable-rendering, aov, inverse-rendering, siggraph-asia, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10852
---

# Sensitivity as an Arbitrary Output Variable for Differentiable Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Sensitivity as an Arbitrary Output Variable for Differentiable Rendering |
| **作者** | Linas Beresna |
| **发表** | SIGGRAPH Asia 2026 Technical Communications |
| **链接** | [原文](https://arxiv.org/abs/2610.10852) |
| **DOI** | 10.1145/3829339.3847832 |
| **代码** | - |

---

## 核心贡献

> 把 sensitivity (derivative of objective wrt scene parameters) 提升为一类**渲染产物** — Sensitivity AOV — 与传统图像空间 AOV 并列。

1. **Sensitivity buffer** — 单次反向模式 pass 填满场景参数层次结构。
2. **多视角只读不重算** — 与 deferred shading 类似，从 buffer 读取多种视图（image-space sensitivity、per-type projections、free-camera 投影、per-texel 场）。
3. **双视角分离** — 固定目标相机（定义 objective）与自由相机（检视结果）解耦。

---

## 技术方案

### 核心思想

> 几十年来 AOV 一直是渲染管线的第一公民，但导数一侧却缺少类似 first-class 表示。本工作建立 "derivative output = first-class render product" 的脚手架。

### 关键技术

| 技术 | 说明 |
|------|------|
| Sensitivity AOV | sensitivity 作为一类渲染输出 |
| Reverse-mode buffer | 单次反向 pass 填充 |
| 双视角分离 | objective camera vs inspection camera |
| Forward-mode dual | 解释反向归因相对正向导数的对偶 |
| Deferred 思想 | 与 deferred shading 类比的多次读取 |

---

## 公式

```math
S_{obj}(p, \theta_i) = \frac{\partial \mathcal{L}}{\partial \theta_i}\bigg|_{x=p}
\text{read views: image-space } | \text{ per-type projection } | \text{ free camera } | \text{ per-texel field}
```

---

## 代码片段

```cpp
// 概念伪代码
void RenderSensitivityAOV(Scene& scene, Loss& L) {
    // 单次 reverse-mode pass
    FillSensitivityBuffer(scene, L);
}
void InspectSensitivity(SensitivityBuffer& S, Camera& free_cam) {
    // 多视图读取，无需再求导
    auto view1 = S.image_space(obj_cam);
    auto view2 = S.per_object_type(obj_cam);
    auto view3 = S.project(free_cam);
    auto view4 = S.per_texel(obj_cam);
}
```

---

## 实验结论

- **类型**: 框架型论文，SIGGRAPH Asia 2026 TC
- **方案**: 单反向 pass + 多读视图
- **结果**:
  - 揭示了反向模式导数与正向模式对偶的关系
  - 提供非数值检查与调试工具基础
  - 可集成至 differentiable VCM、light tracing 等

---

## 局限性

- 框架工作，需各具体方法自行集成
- 4 页技术简报，详细数学推导未展开
- 与现有 AD 框架（如 Mitsuba 3、Dr.Jit）的集成待跟进

---

## 与团队相关

- 与墨鱼丸 (moyuwan): AD / differentiable pipeline 调试基础设施
- 与 SIGGRAPH Asia 2026 配套的 ResLRB 论文（path-tracing 反向）形成 diff rendering 工具链

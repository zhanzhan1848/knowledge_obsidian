---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, real-time-rendering, neural-rendering, emitter, illumination, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.06762
---

# Real-time Rendering of Pre-integrated Neural Emitters

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-time Rendering of Pre-integrated Neural Emitters |
| **作者** | Arno Coomans et al. |
| **发表** | arXiv 2026-10 |
| **链接** | [原文](https://arxiv.org/abs/2610.06762) |
| **DOI** | 10.48550/arXiv.2610.06762 |
| **代码** | - |

---

## 核心贡献

> 用 Neural Emission Field (NEF) 表示复杂发光体，预积分其周围体积光照，单次网络推理即可得到无噪直接光照。

1. **位置/法线/视角/材质多参数化的 neural field**：吸收几何遮挡、空间变化辐射、形变、自反射等。
2. **Diffuse/Glossy 双头架构**：单一网络评估同时覆盖漫反射与光滑反射路径。
3. **本地坐标系训练**：一次训练可重用，rigid 变换下跨场景复用。

---

## 技术方案

### 核心思想

> 复杂发光体（高多边形发光网格、带遮挡罩体、形变装配体）在实时渲染里仍是瓶颈——既有解析方法只能处理简单几何，纯采样又噪点多。NEF 把运行时积分挪到训练时一次性预计算，运行时只做一次查表。

### 关键技术

| 技术 | 说明 |
|------|------|
| Neural Emission Field | 神经表示发光体周围体积光照 |
| Diffuse/Glossy 双头 | 单一推理拆分两路径 |
| 本地框架训练 | 训练数据在发光体本地坐标系 |
| 空间变化辐射 | 学习非均匀辐射分布 |
| 自反射 / 形变吸收 | 把这些复杂效果烤进网络权重 |

---

## 公式

```math
L_{\text{direct}}(x, \omega_o) = \text{NEF}_\theta(\text{rel}(x), n_x, \omega_o, m)

\text{where } \text{NEF}_\theta = \begin{cases}
\text{head}_{diffuse}(\cdot) & \text{via BRDF integration map} \\
\text{head}_{glossy}(\cdot)   & \text{via prefiltered split-sum}
\end{cases}
```

---

## 代码片段

```cpp
// 运行时采样伪代码
vec3 NEF_Evaluate(vec3 world_pos, vec3 normal, vec3 view_dir,
                  MaterialParams m, EmitterNEF& nef) {
    vec3 local_pos = nef.world_to_local * world_pos;
    return nef.query(local_pos, normal, view_dir, m);   // 一次推理
}
```

---

## 实验结论

- **场景**: 复杂发光体（housing 遮挡、高 poly 发光网格、形变装配体）
- **对比方案**: 解析近似、纯采样估计、proxy 表面积分
- **结果**:
  - 单一网络评估即得无噪结果
  - 内部 interreflection / 自遮挡 / 形变被吸收进网络
  - 在 rigid 变换下训练一次跨场景复用

---

## 局限性

- 每个新发光体需独立训练（成本分摊给制作环节）
- 训练数据需高质量 path-tracing 参考
- 极端 specular 多次反射可能仍需混合传统方法

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 可作为复杂光源预积分的参考实现
- 实时引擎集成: emissive 是 PBR + IBL 流水线最痛点之一

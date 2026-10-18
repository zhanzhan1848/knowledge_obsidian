---
type: paper
created: 2026-10-18
updated: 2026-10-18
tags: [paper, quaternion-compression, parametrization, mesh-attributes, tangent-space]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2610.22052
---

# Compression of Uniformly Distributed Unit Quaternions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Compression of Uniformly Distributed Unit Quaternions |
| **作者** | Bastian Kuth 等 |
| **发表** | arXiv 2610.22052 (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.22052) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.22052 |
| **代码** | 未提及 |

---

## 核心贡献

> 系统比较多种四元数参数化（quaternion parameterization）的误差、量化、计算开销与存储效率；提出 **∞-norm 参数化 + 优化的 warp 函数**，在存储与最大误差上同时最优。

1. 量化 / 误差分析：理论 + 实验同时比较各参数化方法
2. 提出 infinity-norm parameterization + 优化 warp，在存储效率与最大误差两个维度同时最优
3. 应用案例：tangent-space normal mapping、skeletal animation blend weights、Gaussian splatting attribute 压缩

---

## 技术方案

### 核心思想

单位四元数 $S^3 \subset \mathbb{R}^4$ 不能直接量化到均匀网格。需要先映射到合理参数化空间（小邻域 + 低失真），再做量化与 warp。

### 关键技术

| 技术 | 说明 |
|------|------|
| Quaternion parameterization | small-angle / 2-component / ∞-norm 等族 |
| Warp function | 让量化网格在参数空间更接近均匀 |
| Max-error bound | 分析 + 实证的最坏误差 |
| Tangent-space normal mapping | 法线存四元数 = 单位长 |
| Skeletal blend weights | 旋转存四元数，与权重解耦压缩 |
| Gaussian splatting rotation | 高斯 ellipsoid 的朝向压缩 |

---

## 公式

```
q = (cos θ/2, sin θ/2 * n̂)                  // 单位四元数轴角表示
e_warp(u) = W(u; α)                          // 优化 warp，使量化误差均匀
err_max = max_u | q(u) - dequant(W(u)) | q̃ |  // 最大误差界
```

---

## 代码片段

```text
// 概念伪代码：四元数编解码
// Encode：axis-angle → 参数化 → 量化
vec3 encode_quat(quat q, float bits) {
    vec3 axis  = q.xyz / length(q.xyz + 1e-8);
    float ang  = 2 * atan2(length(q.xyz), q.w);
    return warp(ang * axis, bits);    // ∈ [-1,1]^3
}

// Decode：反量化 → 反 warp → 还原
quat decode_quat(vec3 code, float bits) {
    return quat_from_axis_angle(unwarp(code, bits));
}
```

---

## 实验结论

- **数据集**: 随机采样单位四元数 + 实际 graphics 场景（normal map、骨骼动画、3DGS）
- **基线**: 现有参数化方法（small-angle、stereographic、2-comp、cardan）
- **结果**: ∞-norm + 优化 warp 在最大误差和存储效率同时最优；解压成本等同或更低

---

## 局限性

- 局限于"均匀分布"前提，分布不均时效果会偏离分析结论
- 没有提供开源代码（仅描述方法）
- 与现有 pipeline 集成需要重新编解码层

---

## 相关工作

- 相关概念：unit quaternion、parameterization、quantization、tangent-space normal
- 应用对接：libigl normal 字段、3DGS 旋转压缩、骨骼动画 blend 权重

---

## 实现建议

- **实现难度**: 中。核心数学为 warp + inverse warp + 量化；GPU/CPU 均可
- **预期性能**: 与单参数化 bit cost 持平；最大误差显著下降
- **适用场景**: 网格法线压缩、骨骼动画 blend weights、3D Gaussian splatting 朝向属性
- **推荐依赖**: libigl（normal/tangent 计算），tinygltf（gltf normal 字段），OpenGL / WebGL（GPU 端解码）
- **数值稳定性**: 高。所有操作都在有限 bit 内闭式
- **推荐度**: ✅ 推荐实现（mesh attribute 压缩 / glTF normal 字段压缩，可直接落地）

---

## 传递给 @墨鱼丸

🥢 **可行性分析：Uniform Quaternion Compression**

**算法复杂度**
- 编码/解码 O(1)
- 存储：与 bit-per-component 直接挂钩

**实现难度**：中（数学推导完整、工程门槛低）

**数值稳定性**：高（闭式操作）

**依赖项**：libigl（normal/tangent 计算），tinygltf（gltf normal 字段），GPU 解码

**推荐结论**：✅ 推荐实现（gltf / glb normal 压缩、骨骼权重压缩、3DGS rotation 压缩都可直接收益）

已传递给 @墨鱼丸。
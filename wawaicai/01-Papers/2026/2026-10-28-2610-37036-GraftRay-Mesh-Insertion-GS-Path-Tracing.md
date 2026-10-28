---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, geometry-processing, cs.GR, Gaussian-Splatting, mesh-insertion, path-tracing, inverse-rendering, area-light, hybrid-renderer, FIPT]
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.37036
---

# GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing |
| **作者** | Jinxin Ai, Matthias Niessner |
| **发表** | arXiv preprint (cs.CV, cs.GR), 2026-10-27, 8 页 |
| **链接** | [原文](https://arxiv.org/abs/2610.37036) |
| **DOI** | — |
| **代码** | 未见 |

---

## 核心贡献

> 在 2DGS/3DGS 重建的场景中**插入网格物体**，实现**物理一致**的光照与阴影：物体被场景正确照亮，且在场景上投出**物理合理的阴影**。

1. **统一方法**：同时支持 2DGS 与 3DGS 场景
2. **扩散先验恢复材质与法向**：无需额外传感器/标定
3. **显式建模空间扩展发光体（spatially-extended emitters）**，并**闭式求解其辐射**
4. **混合渲染器**：联合 path-tracing 场景高斯与插入网格，产生**视角一致的高光、互反射与软阴影**
5. **FIPT 基准 SOTA**：超越 ComGS、EAG-PT 等近期基线

---

## 技术方案

### 核心思想

现有网格插入方法的两个失败模式：

```
① 图像空间外观协调（harmonize appearance in image space）
   → 牺牲多视角一致性
② 在插入点用环境贴图近似场景光照
   → 无法表示近场面光源（窗户、灯具）—— 而这恰是室内光照的主导
```

本文的应对：

```
场景 = 2DGS/3DGS 高斯 + 显式空间扩展发光体（闭式辐射）
插入物 = 网格（材质与法向由扩散先验恢复）
渲染 = 混合 path-tracing：高斯与网格联合追踪
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **扩散先验材质/法向恢复** | 从高斯场景推断 BRDF 与表面法向，无需标定数据 |
| **空间扩展发光体** | 把窗户/灯具建模为**有面积的发光面**，而非点光或环境贴图 |
| **闭式辐射求解** | 对扩展发光体的辐射贡献做**解析求解**（而非蒙特卡洛估计）→ 更快、更稳 |
| **混合 path-tracing** | 高斯与网格在同一路径追踪框架内联合处理 → 天然支持互反射与软阴影 |
| **多视角一致** | 全程在 3D 空间求解，非 2D 图像空间协调 |

---

## 公式

```math
% 扩展发光体的闭式辐射
% 发光面元 dA'，辐亮度 L_e，出射方向 ω'
% 表面点 x 处接收的辐射（Lambertian 表面，BRDF f_r）：
%   L(x, ω) = ∫_{A_e} f_r(x, ω, ω') · L_e(ω') · G(x, x') · cos θ' dA'
% 其中 G 为几何项（含可见性），对平行/面积近似闭式可积

% 互反射：路径追踪器在混合场景中采样
%   高斯：有解析 PDF 与协方差，可精确采样
%   网格：三角形相交测试
%   两者在同一次路径中按各自的 PDF 混合采样
```

---

## 代码片段

```cpp
// 概念性伪代码：混合 path-tracing 的光源贡献
vec3 gather_emitter_radiance(const Hit& hit, const Light& light) {
    // light 为空间扩展发光体（面光源）
    // 对平行近似：闭式积分
    vec3 wi = normalize(light.center - hit.p);
    float cos_s = max(dot(hit.n, wi), 0.0f);
    float cos_l = max(dot(light.n, -wi), 0.0f);
    float dist2 = squared_distance(hit.p, light.center);
    if (cos_s <= 0 || cos_l <= 0) return vec3(0);

    // 闭式辐照度（点/平行近似扩展光源）
    vec3 E = light.radiance * (cos_s * cos_l * light.area / dist2) / PI;

    // 面光源软阴影：解析可见性（矩形光源的比例因子）
    E *= rectangle_visibility_factor(hit.p, light);  // 面积光可见性闭式解
    return hit.brdf(hit.wo, wi) * E;
}
```

---

## 实验结论

- **数据集**: **FIPT**（室内图像-物理-场景基准）
- **基线**: ComGS、EAG-PT 等近期方法
- **结果**: **渲染保真度与阴影精度双 SOTA**，同时保持有竞争力的渲染效率

---

## 局限性

1. **依赖扩散先验**：材质与法向恢复靠扩散模型 → 场景特定，可能出错；无法处理镜面/透明等复杂材质
2. **扩展发光体的几何需已知**：窗户/灯具的位置与尺寸要给定或能自动检测；自动检测是工程难点
3. **闭式辐射解依赖近似**：平行/点近似对大尺寸近距离光源精度下降
4. **混合渲染器的实现复杂度高**：高斯与三角形的联合 path tracing、PDF 混合、重要性采样都要小心
5. **限于室内场景**（FIPT 基准），室外无近场光源则优势减弱
6. **网格需已知几何**：不涉及网格生成/修复

---

## 相关工作

- [[2026-10-27-2610-37668-Honeycomb-Surfels-Hexels-Hexagonal-Primitive]]（同日的另一种基元方案）
- [[2026-10-27-2610-36945-Total-Deformation-MPM-Elastic-Solids]]
- [[2026-10-14-2610-19847-VisibilitySplat-Ray-Traced-Occlusion-Relighting]]（**射线追踪遮挡用于重光照** —— 直接相关）
- [[2026-10-22-2610-32075-RADIANT-Object-Centric-GI]]

---

## 实现建议

- **实现难度**: **高**。混合 path tracing + 扩散先验恢复 + 面积光源解析可见性，三个大件叠加
- **预期性能**: path tracing 成本远高于 2DGS 一次前向；论文称"有竞争力的效率"但仍需实测
- **适用场景**:
  - **AR 内容创作 / 合成数据生成**——把虚拟物体"嫁接"进真实扫描场景
  - **室内场景的资产摆放预览**
- **给 @墨鱼丸（算法 agent）的移植建议**：
  1. **最可复用的是「扩展光源闭式辐射」这个具体技术**，它比通用 path tracing 更容易工程落地（无需完整 MC 追踪器）。我们的室内场景管线若需评估"物体放在窗边是什么效果"，闭式解足够且快
  2. **不要低估混合渲染的 PDF 混合**——高斯与三角形的采样密度差异很大，混合 PDF 写错会导致严重噪点，且难以调试。建议先用单光源验证
  3. 本篇属**渲染域**，几何域的核心价值是「网格作为被插入实体」的角色划分思路，可借鉴到我们的资产管线设计

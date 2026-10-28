---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, geometry-processing, cs.GR, differentiable-rendering, line-primitives, inverse-rendering, rasterization, stochastic-opacity-masking, MSAA, hair-fiber, ACM-TOG, SIGGRAPH-Asia-2026]
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3842527
---

# Inverse Rendering for Modeling with Line Primitives

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inverse Rendering for Modeling with Line Primitives |
| **作者** | Kenji Tojo (ETH Zürich), Ariel Shamir (Reichman University), Nobuyuki Umetani (The University of Tokyo), Bernd Bickel (ETH Zürich) |
| **发表** | **ACM Transactions on Graphics** (SIGGRAPH Asia 2026), Vol. 45, No. 6, Art. 200, 13 pages |
| **链接** | [项目页](https://kenji-tojo.github.io/sa26-line-primitives/) · [DOI](https://doi.org/10.1145/3842527) |
| **DOI** | `10.1145/3842527` |
| **代码** | [github](https://github.com/kenji-tojo/inverse-line-primitives) + 专用 Rasterizer + Dataset |

---

## 核心贡献

> 用**显式线段**（而非 3D 高斯等半透明体基元）重建毛发/绒毛/纤维等**模糊各向异性几何**，并提出**可微的随机线段光栅化器**，使训练与渲染**直接兼容标准深度测试光栅化管线**。

1. **线段作为几何表示**：显式线段 + 子像素网格抗锯齿，复现半透明外观。与 3DGS 等辐射场方法相比，**兼容深度测试光栅化、反射建模、物理仿真**。
2. **随机可微线段光栅化器**：核心难点——大量线段优化需要**对顶点位置、属性、离散连接关系（connectivity）都有信息量的梯度**。
3. **MSAA 扩展**：作者前一工作 **DiffSoup**（随机不透明度掩码）只处理单片元颜色；本文解决**多重采样抗锯齿**下每像素含**多个片元颜色**的难题。
4. **1 像素宽 Bresenham 线光栅化 + 屏幕空间滤波**表达模糊半透明外观。

---

## 技术方案

### 核心思想

**问题**：辐射场（3D 高斯）能捕获毛发/绒毛/纤维，但它们是**半透明体基元**，因此：
- ❌ 无法用标准深度测试光栅化（需要排序 + 深度）
- ❌ 无法做反射建模
- ❌ 无法做物理仿真（布料、发丝动力学）

**解法**：回到**显式低维基元**（线段），但要解决两个难题：

```
① 渲染：线段如何表达"模糊半透明"？
   → 1 像素宽 Bresenham 线 + 屏幕空间滤波（亚像素覆盖率 → 软边）
   
② 优化：线段是【离散结构】，梯度如何穿过"选哪条线连接"这个离散决策？
   → 随机不透明度掩码（stochastic opacity masking）
```

**随机不透明度掩码（来自 DiffSoup）**：在光栅化时，**随机决定**每个片元是否参与合成；因为期望上保留的概率等于不透明度，所以**不透明度的期望值仍正确**，但**离散连接关系获得了可微的梯度信号**——这是把"选边"这类离散决策纳入梯度下降的关键。

**MSAA 难题**：DiffSoup 的随机性假设是"每像素一个颜色"，而 MSAA 下每像素有 $N$ 个 sample slot，每个 slot 独立做随机决策 → 需要**对每个 sample 独立随机**，且**随机决策必须在 sample 级别而非像素级别**进行，否则梯度与实际合成过程不一致。

### 关键技术

| 技术 | 说明 |
|------|------|
| **显式线段基元** | 顶点位置 + 颜色/属性 + 连接关系；几何**完全显式**，可导出为线段网格 |
| **Bresenham 1px 线光栅化** | 离散像素栅格，配合屏幕空间滤波产生亚像素覆盖 |
| **随机不透明度掩码** | 每个 sample slot 独立随机保留；期望不透明度不变，但离散连接可导 |
| **MSAA 感知的随机化** | 随机决策下沉到 **sample 级别**，解决 DiffSoup 在 MSAA 下的不一致 |
| **梯度来源** | 顶点位置（连续）+ 属性（连续）+ **离散连接**（通过随机掩码的期望） |
| **可导出性** | 重建结果为**显式线段集合**，可直接进入既有光栅化/仿真管线 |

---

## 公式

```math
% 随机不透明度掩码（DiffSoup → MSAA 扩展）
% 对像素 p 的第 s 个 sample slot：
%   令 α_s = 该 sample 的有效覆盖率（来自线段的亚像素覆盖）
%   随机保留指示：z_s ~ Bernoulli(α_s)
%   合成：仅当 z_s = 1 时该 sample 参与
% 期望性质：E[合成颜色] = 原始 alpha 合成结果（无偏）
% 关键：随机性在【sample 级别】独立采样，而非像素级别

% 线段的亚像素覆盖（屏幕空间滤波）
%   对线段像素，用 filter kernel w(x,y) 与线段的覆盖率分布卷积
%   α_s = Σ_{offset ∈ stencil} w(offset) · [线段覆盖该位置]

% 离散连接性的梯度来源
%   边 e 的存在性影响 E[合成]，故 ∂E[合成]/∂(e 存在) 是有定义的
%   → 优化器可通过"改变连线"来降低损失
```

---

## 代码片段

```cpp
// 概念性伪代码：sample 级别的随机不透明度掩码 + 可微线光栅化
__global__ void rasterize_lines_msaa(
    const Line* lines, int n_lines,
    float* framebuffer,       // [width*height*samples*4]
    int width, int height, int n_samples,
    uint64_t rng_seed) {
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    if (px >= width || py >= height) return;

    // 本像素的 4x4 MSAA sample offsets
    for (int s = 0; s < n_samples; ++s) {
        vec2 offset = MSAA_OFFSETS[s];               // e.g. (0.125,0.125), ...
        vec2 sample_pos = vec2(px, py) + offset;

        // --- 1. 几何：找覆盖该 sample 的线段（Bresenham + 亚像素滤波）---
        float cov_sum = 0.0f;
        vec3  color_acc = vec3(0.0f);
        for (int i = 0; i < n_lines; ++i) {
            float cov = filtered_coverage(lines[i], sample_pos); // 亚像素覆盖率
            if (cov <= 0.0f) continue;
            // --- 2. 随机不透明度掩码（sample 级独立）---
            float u = rand_uniform(rng_seed, i, s);   // 每 (line, sample) 独立
            float keep = (u < cov) ? 1.0f : 0.0f;    // 期望 = cov ⇒ 无偏
            cov_sum   += keep * lines[i].opacity;
            color_acc += keep * lines[i].color;
        }
        // --- 3. 合成（颜色按覆盖权重归一）---
        if (cov_sum > 0.0f) {
            vec3 c = color_acc / cov_sum;
            framebuffer[(py * width + px) * n_samples + s] =
                vec4(c, min(cov_sum, 1.0f));
        }
    }
}
```

---

## 实验结论

- **数据集**: 论文自建数据集（项目页提供 Dataset 链接）；重建对象为毛发/绒毛/纤维/织物类模糊各向异性结构
- **基线**: 3DGS 等辐射场方法、DiffSoup（作者前作，opaque triangle）
- **结果**:
  - 从多视图输入图像**忠实重建**出由大量细纤维组成的**显式线段集合**
  - 训练与渲染**直接兼容高效光栅化管线**（非辐射场近似）
  - 深度测试、反射建模、物理仿真**均可直接使用重建结果**

---

## 局限性

1. **只适用于「细长纤维状」几何**：无法处理面状/体状几何（毛发/绒毛/纤维/织物），适用范围窄
2. **Bresenham 1px 线的表达力上限**：极细密纤维可能欠采样；MSAA 扩展后每 sample 需独立随机，成本上升
3. **随机梯度的方差**：可微离散连接带来梯度噪声，收敛可能慢且需更多迭代
4. **拓扑由优化决定**：线段数量与连接关系都是优化变量，容易出现冗余线段 / 短毛刺，需要正则化
5. **与 DiffSoup 的耦合**：随机不透明度掩码方案已发表于 SIGGRAPH 2023 (DiffSoup)，本文是**扩展**而非独立方法

---

## 相关工作

- [[2026-10-15-SUPRA-TEX-3D-Generation-Super-Aligned-Texture]]（纹理对齐）
- [[2026-10-08-SubDGuide-Agentic-Mesh-to-SubD]]（线/面混合表示的转换）
- [[Differentiable-Rasterization]]
- [[2026-10-27-2610-37668-Honeycomb-Surfels-Hexels-Hexagonal-Primitive]]（**同样在改基元表示** —— 对照阅读价值高）
- [[2026-10-26-2610-36098-Texture-Consolidation-Multi-View-Renderings]]（**把生成式模型接进几何处理管线** —— 与本文「重建后接光栅化管线」思路同源）

---

## 实现建议

- **实现难度**: **高**
  - 数学不难，难在**工程**：可微线段光栅化 + MSAA sample 级随机化 + 反向传播
  - CUDA 实现需要特别处理**随机数与 sample slot 的一致性**（否则梯度与前向不一致 → 训练不收敛）
- **预期性能**: 重建质量取决于线段数量；渲染成本可低于辐射场（因为是标准光栅化），但**训练**更贵（需反传）
- **适用场景**:
  - **角色/资产的毛发-绒毛-纤维建模**，需要接入既有 DCC/引擎管线（导出线段）
  - **需要物理仿真**的纤维（发丝动力学、布料）
  - **AR/VR 内容生产**：显式几何便于 LOD 与流式传输
- **给 @墨鱼丸（算法 agent）的移植建议**：
  1. **优先吸收「离散结构也要可微」这个方法论**。我们的几何管线里若有任何离散决策（选边、选三角面、选拓扑连接），都面临同样问题——随机不透明度掩码是一种通用解法，值得作为工具箱里的一项
  2. **MSAA 扩展是本文的真正增量**，也正是最容易出 bug 的地方。建议**先在无 MSAA 下跑通随机掩码**（DiffSoup 原版），验证梯度正确性后再加 MSAA
  3. 与 [[2026-10-27-2610-37668-Honeycomb-Surfels-Hexels-Hexagonal-Primitive]] 对比：**两者都在问「辐射场基元是不是太贵了」**。Hexels 的答案是「换成平面片 + 空间颜色场」，本文的答案是「换成显式线段 + 可微光栅化」。**后者对纤维类几何更对口**，值得在资产管线里做选型参考

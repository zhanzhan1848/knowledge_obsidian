---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 路径追踪, 全局光照, PBR, 高斯渲染, 体渲染, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37036
---

# GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing |
| **作者** | Jinxin Ai, Matthias Niessner |
| **发表** | arXiv 2610.37036v1 [cs.CV/cs.GR]，2026-10-27（8 页 + 参考文献，6 图 2 表） |
| **链接** | [原文](https://arxiv.org/abs/2610.37036) |
| **单位** | Technical University of Munich (TUM) |

---

## 核心贡献

> 在 3DGS 场景中插入网格物体时，用「显式近场面光源 + 高斯感知混合路径追踪」取代图像空间 harmonize 或环境贴图近似，从而得到物理正确的光照、阴影与互反射。

1. **高斯感知的混合路径追踪器**
   - 扩展 OptiX 路径追踪器，在**同一个加速结构**中同时求交随机透明的高斯图元与插入的网格。
   - 支持解析面光源、next-event estimation (NEE)、BSDF 采样、MIS（power heuristic）、间接光照与 Russian roulette。

2. **显式建模空间延展的面光源（近场 area light）**
   - 把窗、灯、吊顶面板表示为**单面矩形**，从用户标注的 mask 反投影恢复几何。
   - 用路径追踪的 basis image + 非负优化求解辐射度——这是关键：环境贴图无法表示室内占主导的近场面光源。

3. **LDR 观测的删失拟合（censored fitting）**
   - 把饱和像素当作**下界观测**而非普通等式，避免辐射度被传感器天花板拉低。
   - 用未饱和的室内表面区分「真实发光体」与「亮反射体」。

4. **差分合成（differential compositing）**
   - 把插入物体引起的光照变化（`I_with / I_without`）转移到原始 3DGS 渲染上，保留重建细节与视角相关外观。

---

## 技术方案

### 核心思想

现有方案两条路都不通：
- **图像空间 harmonize** → 牺牲多视角一致性；
- **在插入点用环境贴图近似场景光照** → 无法表示窗、灯这类主导室内光照的近场面光源。

GraftRay 的做法是：把「光照求解」本身当作路径追踪问题来解，而非当作后处理。

### 关键技术

| 组件 | 设计 | 关键参数 |
|------|------|------|
| **材质/法线估计** | 用 RGB↔X 或 DiffusionRenderer 从虚拟视图预测 albedo/roughness/metallicity/normal，再反投影到可见高斯 | 可见性判据：累积透射率首次低于 1/2 处的深度 `z`；接受 `\|r−z\|/z < τ_z`；多视图平均 + 多 seed 逐通道中位数 |
| **面光源几何拟合** | 用户 mask → 3D 点集 → RANSAC 拟合平面（加权亮高斯）→ PCA 精修 → 墙挂灯对齐水平/垂直轴，否则用 PCA 轴 | 从关联高斯确定矩形范围；法向朝向房间 |
| **高斯求交** | 将射线变换到高斯局部坐标系，用 Mahalanobis 距离判定 | 接受条件 `m_i² < 9`（3σ 椭球）；有效不透明度 `α_i = o_i exp(−m_i²/2)` |
| **随机透明（stochastic transparency）** | 硬件遍历不保证深度序，故以概率 `α_i` 接受高斯求交；「第一个被接受」的原始概率恰等于 alpha 合成权重 | `w_i = α_i ∏_{j∈F_i}(1−α_j)`，**无需对沿射线的所有求交排序**，每段只需一次硬件遍历 |
| **阴影射线** | any-hit 程序累加**确定性**透射率，不用随机接受 | `T ← T(1−α_i)`，`T < 5×10⁻³` 时终止 |
| **辐射度求解** | 辐射度线性进入渲染方程，故 `I(L) = Σ_j L_j B_j`，`B_j` 为单位辐射度 basis image | 为避免重复计算发光体本身的高斯外观，渲染 `B_j` 时移除 `E_j` 附近薄板内的亮高斯 |
| **删失最小二乘** | 非饱和像素按等式拟合；饱和像素只要求「预测 ≥ τ」 | `τ = 0.98`；`[x]₊ = max(x,0)`；GPU 上算残差/Jacobian，`J×J` 正规方程 + Levenberg–Marquardt；`J` 通常 < 20 |
| **差分合成** | 用 `I_with/I_without` 比值作为光照变化因子，转移到原始 3DGS | `r = clip(I_with/I_without, 0, c)`，`c=3`；曝光匹配 `k = median(I_3dgs/I_without)` |

---

## 公式

```math
% 射线到高斯局部坐标系
\mathbf{p} = \mathbf{S}_i^{-1}\mathbf{R}_i^\top(\mathbf{o}-\boldsymbol{\mu}_i),
\qquad
\mathbf{q} = \mathbf{S}_i^{-1}\mathbf{R}_i^\top\mathbf{d}
```

```math
% 最近接近点与 Mahalanobis 距离
t_i^\star = -\frac{\mathbf{p}\cdot\mathbf{q}}{\|\mathbf{q}\|^2},
\qquad
m_i^2 = \|\mathbf{p}\|^2 - \frac{(\mathbf{p}\cdot\mathbf{q})^2}{\|\mathbf{q}\|^2}
```

```math
% 求交判据与有效不透明度
m_i^2 < 9,
\qquad
\alpha_i = o_i\exp\!\left(-\tfrac{1}{2}m_i^2\right)
```

```math
% 随机接受下「第一个被接受」的原始概率 = alpha 合成权重
w_i = \Pr(K=i) = \alpha_i \prod_{j\in\mathcal{F}_i}(1-\alpha_j)
```

```math
% 沿射线的辐射度合成
L_{\mathrm{ray}} = \sum_i w_i\, L_o(\mathbf{x}_i,\mathbf{v})
```

```math
% 线性辐射度模型（basis image 分解）
I(\mathbf{L}) = \sum_{j=1}^{J} L_j B_j,
\qquad \mathbf{L} \geq 0
```

```math
% 删失（非负）最小二乘目标
\min_{\mathbf{L}_c\geq 0}\;
\sum_{\mathbf{p}\in U_c}\big[g(\mathbf{B}_{p,c}^\top\mathbf{L}_c)-y_{p,c}\big]^2
+
\sum_{\mathbf{p}\in C_c}\big[\tau-g(\mathbf{B}_{p,c}^\top\mathbf{L}_c)\big]_+^2
```

```math
% 差分合成
I_{\mathrm{out}} = M\,I_{\mathrm{with}}
+ (1-M)\,I_{\mathrm{3dgs}}\odot
\operatorname{clip}\!\Big(\frac{I_{\mathrm{with}}}{I_{\mathrm{without}}},\,0,\,c\Big)
```

---

## 代码片段

```text
# 混合路径追踪主循环（依论文 Mitsuba 风格的改编）
for each pixel:
    for each sample:
        ray = jitter_camera_ray(pixel)

        # --- 高斯 + 网格联合遍历（OptiX 单一加速结构）---
        while true:
            hit = traverse(ray)                # 混合 BVH：高斯 + 网格
            if hit is Gaussian:
                m2, t_star = gaussian_intersect(hit)
                if m2 >= 9: continue           # 3σ 之外，忽略
                alpha = hit.opacity * exp(-0.5 * m2)
                # 随机透明：按 alpha 接受；权重恰为 alpha 合成权重
                if rand() < alpha:
                    L += w_hit * shade(hit, ray.d)   # Cook-Torrance + GGX
                    break
                else:
                    continue                      # 继续找更远的求交
            else:
                L += shade_mesh(hit, ray.d)
                break

        # --- 面光源 NEE ---
        L_direct = w_nee * L_nee + w_bsdf * L_bsdf     # MIS power heuristic
        L += L_direct

        # --- BSDF 采样间接光 ---
        ray = sample_bsdf(ray)
        if not russian_roulette(L, ray): break

# 阴影射线单独走 any-hit 程序（确定性透射率）
def shadow_ray(origin, dir):
    T = 1.0
    for hit in traverse_any_hit(origin, dir):
        if hit is Gaussian:
            m2 = gaussian_mahalanobis(hit)
            if m2 < 9:
                T *= (1.0 - hit.opacity * exp(-0.5 * m2))
                if T < 5e-3: return 0.0
        else:
            return 0.0
    return T
```

---

## 实验结论

- **数据集**：FIPT（真实室内场景 + 网格插入基准）。
- **基线**：ComGS、EAG-PT（近期的 3DGS 网格插入方法）。
- **结果**：
  - GraftRay 在 FIPT 上**同时刷新渲染保真度与阴影精度两项 SOTA**；
  - 渲染效率保持高度竞争力。
- **消融**：无近场面光源建模则室内光照明显错误；无删失拟合则饱和区域辐射度被系统性低估。

---

## 局限性

- 需要**用户手动标注发光区域**（SAM mask）并反投影恢复面光源几何 —— 不是全自动流程。
- 依赖外部逆渲染前馈模型（RGB↔X / DiffusionRenderer）估计材质与法线，材质准确性受限于该模型。
- 只针对**室内**场景与静态插图，未处理动态光与室外日光。
- 面光源被限制为**单面矩形**，无法表达非矩形灯罩。
- 需 OptiX 级别的高斯 + 网格混合加速结构，实现复杂度不低。

---

## 相关工作

- [[ComGS]] / [[EAG-PT]]
- [[OptiX]]
- [[DiffusionRenderer]]
- [[2609.11430-gaussian-light-transport|Gaussian Light Transport]]
- [[2026-04-29-8D-Neural-Asset-Light-Transport|8DNA]]

---

## 实现建议

- **实现难度**：**高**。核心难点有三：① 随机透明的高斯求交如何在 OptiX/Vulkan 中正确实现（不能用常规 alpha blend 路径）；② 删失最小二乘 + LM 求解器；③ 混合 BVH 的构建与遍历。
- **预期性能**：FIPT 上渲染保真度与阴影精度双 SOTA，效率有竞争力；但论文未给出与真实产品路径追踪器的绝对帧时对比。
- **适用场景**：
  1. **AR/内容创作中的物体插入**（虚拟物体被场景正确照亮、并投出物理正确的软阴影）；
  2. 合成数据生成（自动驾驶/机器人仿真需要物理正确的插图）；
  3. 室内场景的全局光照预计算。
- **行动建议**：**谨慎评估 → 推荐做技术预研**。其**随机透明高斯 + 解析面光源 + 删失拟合**三件套可独立复用：
  - 「随机接受概率 = alpha 合成权重」这个等价性是**可直接迁移到自研渲染器**的实用技巧（避免排序、每段一次遍历）；
  - 「显式近场面光源」比环境贴图更贴近室内场景的真实需求，值得在自有 PBR 管线中优先补齐。
  优先级：**中**（需先确认自有引擎是否有 OptiX/Vulkan 级别的混合遍历能力）。

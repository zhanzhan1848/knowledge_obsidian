---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 高斯渲染, 神经渲染, 表面重建, 图元设计, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37668
---

# Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction |
| **作者** | Prakhar Kaushik\*, Soumava Paul\*, Alan Yuille（\* 同等贡献） |
| **发表** | arXiv 2610.37668v1 [cs.CV/cs.AI/cs.GR/cs.LG]，2026-10-27 |
| **链接** | [原文](https://arxiv.org/abs/2610.37668) |
| **项目页** | https://honeycomb-surfels.github.io/ |
| **代码** | https://github.com/honeycomb-surfels/hexels |
| **预训练模型** | https://huggingface.co/jhu-ccvl/Hexels |
| **单位** | CCVL, Johns Hopkins University |

---

## 核心贡献

> 用「六边形支撑域 + 一阶局部颜色场」替换 2DGS 的高斯核，让单个基元在有限支撑内覆盖更大表面区域并同时建模区域内的线性外观变化——效率来自图元设计本身，而非量化压缩。

1. **Hexel 图元：软六边形支撑 + 一阶局部颜色场**
   - 每个基元自带仿射颜色场 `c0 + u·gu + v·gv`，无需纹理图、特征网格、神经解码器或 baking。
   - 参数极简：V1 仅 **20 个标量 / 80 B per prim**（2DGS 为 58 标量）。
   - 3D 中作为定向平面贴片渲染；2D 中直接在像平面求值（无投影、无 ray-plane 求交、无深度序）。

2. **质量-效率前沿的整体推进（存储、训练 VRAM、基元数、FPS 同时改善）**
   - 同等模型内存：PSNR 相对 2DGS **+4.53 ~ +7.38 dB**；训练峰值 VRAM 最多 **↓3.6×**；渲染 FPS **1.54–1.87×**。
   - 同等基元预算：PSNR 最多 **+4.74 dB**；部署内存 **↓1.76–1.95×**；训练 VRAM 最多 **↓7×**；渲染 **2.31×** 更快。
   - 同等内存下表面重建：DTU Chamfer **0.978 mm vs 2DGS 1.375 mm（误差 ↓28.9%）**；T&T F1 **34.38% vs 31.72%**。

3. **一个图元家族覆盖三类任务（3D NVS / 表面重建 / 2D 图像表示）**
   - **O(1) 直接导出六边形 surface cell**，无需 TSDF 体素化 / Marching Cubes。
   - 2D 图像上超越 Image-GS：PSNR **33.16 → 35.82 dB**，LPIPS **0.1372 → 0.0924**，训练时间 **238.40 s → 157.07 s**。

---

## 技术方案

### 核心思想

自然图像与场景高度结构化——大片区域局部近似平面、外观平滑变化。现有 splatting 基元每个只带一个 view-conditioned 颜色，空间变化靠大量重叠基元叠加（overdraw 高、内存大），或把表达力外置到纹理/特征网格/神经场（引入额外显存与训练状态）。

Hexel 把「效率」直接做进图元本身：
- **六边形支撑域** `d(u,v)`：正六边形的 6 个半平面距离的最大值，解析、无分支、处处连续，再经 sigmoid 变软。六边形在同面积下周长最短、覆盖面积最大（honeycomb theorem）；在本文的一阶近似误差椭圆下，最优仿射正六边形面积是**三角形的 2 倍、正方形的约 1.3 倍**。
- **一阶颜色场**：`c0 + u·gu + v·gv`，把「区域本身 + 区域内平滑外观变化」合并到一个基元，从而能用更少、更大的基元表达结构化区域。

### 关键技术

| 组件 | 设计与参数化 | 关键取值 |
|------|------|------|
| **几何/支撑参数（11 标量）** | 中心 `p∈R³`、两个切向尺度 `su, sv>0`、四元数（归一化，前两轴为切向 `tu, tv`，`n=tu×tv`）、不透明度 `o`、支撑锐度 `β>0` | 尺度/β 用指数参数化：`sa=exp(ℓa)`, `β=exp(b)`, `o=σ(a)` |
| **六边形支撑 `d(u,v)`** | `max{|v|, |(√3/2)u+(1/2)v|, |(√3/2)u−(1/2)v|} − 1` | `d=0` 为标准正六边形；内切半径 1，外接半径 2/√3 |
| **软支撑 `K`** | `K=σ(−β·d(u,v))`，`K=1/2` 等值线恰为正六边形 | `β` 越大边界越锐；栅格化器截断 `τ=1/255` 以下尾巴 |
| **一阶颜色场 (V1)** | `c_sp(u,v)=c0 + u·gu + v·gv`（局部坐标） | 9 额外标量；**V1 共 20 标量 / 80 B per prim** |
| **V2 视图相关** | 线性残差 `r_i(d_i)=A_i d_i`，`A∈R^{3×3}` | 29 标量 / 116 B |
| **V3 视图相关** | 三阶球谐 `Σ_{ℓ=1..3} Σ_m a_{i,ℓm} Y_ℓm(d_i)` | 65 标量 / 260 B；**视图方向只在图元中心求一次**，故残差在图元内为常数 |
| **2D splatting / 投影** | 透视校正 ray-plane 求交得到 `(u_i,v_i)`；`α_i=min{o_i·K_i(u_i,v_i), 0.99}`；按 tile 内中心深度**前到后**合成 | 16×16 像素 tile；`T(1−α)<1e-4` 提前终止；不透明度 <1/255 跳过 |
| **包围盒/剔除** | 支撑界 `d(u,v) ≤ log(254)/β_i`，外接圆半径 `r=2/√3(1+log(254)/β)`；紧盒用实际不透明度 `d ≤ β⁻¹log(o/τ−1)` | 沿用 2DGS 继承的投影包围例程做 tile 分配 |
| **2D 图像模式** | `u_i(x)=S̃_i⁻¹ R(θ_i)ᵀ(m_i−x)`，`w_i(x)=σ(−β_i d(u_i(x)))`；取 tile 内 top-K=10 权重做归一化加权平均 | 无投影/无求交/无深度序；`ε=1e-4` 防除零；2D 颜色场用图像坐标 |
| **初始化** | COLMAP 稀疏点（一图元一点）；旋转单位四元数（**不用法向估计**）；`su=sv=¼×(到最近3邻居 RMS 距离)`，上限场景相机范围 5%；`o=0.1`；`β=10` | 表面重建实验另用 MVS 稠密点初始化 |
| **训练** | Adam 30K iter，损失 `L=(1−λ)‖Î−I‖₁ + λ(1−SSIM)`，`λ=0.2` | NVS 实验**不用** depth distortion / normal regularization；表面重建实验用 normal-consistency 0.05 + depth-distortion 1000 |

---

## 公式

```math
% 六边形支撑距离场（解析、无分支）
d(u,v) = \max\Big\{|v|,\; \big|\tfrac{\sqrt3}{2}u+\tfrac12 v\big|,\;
                 \big|\tfrac{\sqrt3}{2}u-\tfrac12 v\big|\Big\} - 1
```

```math
% 软支撑：K=1/2 的等值线恰为标准正六边形
K(u,v) = \sigma\big(-\beta \cdot d(u,v)\big)
```

```math
% 一阶局部颜色场（V1 图元的完整外观模型）
c_{sp}(u,v) = c_0 + u\,\mathbf{g}_u + v\,\mathbf{g}_v
```

```math
% 2D splatting 的合成不透明度
\alpha_i = \min\Big\{ o_i \cdot K_i(u_i, v_i),\; 0.99 \Big\}
```

```math
% 支撑域截断半径（保证 K > 1/255）
d(u,v) \le \frac{\log 254}{\beta_i},
\qquad
r_{\text{out}} = \frac{2}{\sqrt3}\Big(1+\frac{\log 254}{\beta}\Big)
```

```math
% 透视校正 ray-plane 求交（无逐像素矩阵求逆）
T_i = \pi M_i;\quad k = x\,t_z - t_x,\quad l = y\,t_z - t_y,\quad h = k\times l
\quad\Rightarrow\quad
(u,v) = \Big(\frac{h_x}{h_z},\;\frac{h_y}{h_z}\Big)
```

```math
% 训练损失
\mathcal{L} = (1-\lambda)\,\|\hat{I}-I\|_1 + \lambda\big(1 - \mathrm{SSIM}(\hat{I}, I)\big),
\qquad \lambda = 0.2
```

---

## 代码片段

```cpp
// 六边形支撑的解析求值（CUDA 内核核心）
// u, v 为图元局部坐标；beta 为支撑锐度
__device__ __forceinline__ float hexagon_support(float u, float v, float beta) {
    float a = fabsf(v);
    float b = fabsf(0.8660254f * u + 0.5f * v);
    float c = fabsf(0.8660254f * u - 0.5f * v);
    float d = fmaxf(a, fmaxf(b, c)) - 1.0f;   // d=0 为标准正六边形边界
    return 1.0f / (1.0f + __expf(beta * d));   // 软支撑 K
}

// 一阶局部颜色场
__device__ __forceinline__ void first_order_color(
    const float c0[3], const float gu[3], const float gv[3],
    float u, float v, float out[3])
{
    for (int ch = 0; ch < 3; ++ch)
        out[ch] = c0[ch] + u * gu[ch] + v * gv[ch];
}
```

---

## 实验结论

- **数据集**：34 个场景（多数据集 NVS 评估）、15 个 DTU 扫描、6 个 Tanks & Temples 表面场景、2D 图像表示实验。
- **基线**：2DGS（主要对照）、3DGS、Image-GS（2D 图像场景）。
- **结果**：
  - 同等模型内存：PSNR **+4.53 ~ +7.38 dB** vs 2DGS；训练峰值 VRAM 最多 ↓3.6×；FPS 1.54–1.87×。
  - 同等基元预算：单基元 PSNR 最多 **+4.74 dB**；训练 VRAM 最多 ↓7×；**FPS 2.31×**；部署内存 ↓1.76–1.95×。
  - 表面重建：DTU Chamfer **0.978 mm vs 1.375 mm（↓28.9%）**；T&T 平均 F1 **34.38% vs 31.72%**（对比方法中最高）。
  - 2D 图像：PSNR **33.16 → 35.82 dB**，LPIPS **0.1372 → 0.0924**，训练 **238.40 s → 157.07 s**。

---

## 局限性

- 六边形支撑在参数化上比圆形/高斯核复杂，需要专门的 CUDA 栅格化内核（不能直接复用 3DGS 渲染器）。
- 一阶颜色场只能建模平面区域的线性变化，对强非平面/高频纹理区域仍需致密化出更多基元。
- 致密化策略在「无约束场景」与「表面重建场景」间需要不同配置（后者需开启 normal-consistency 与 depth-distortion）。
- 未提供压缩/量化方案（压缩仅作为附录附加分析），部署内存优势来自图元本身而非编码。

---

## 相关工作

- [[2DGS]] / [[3D Gaussian Splatting]] / [[Mip-Splatting]]
- [[Honeycomb Theorem 与正六边形密铺]]
- [[Neural Radiance Cache]]
- [[2026-10-28_CTBakeGS|CTBakeGS]]

---

## 实现建议

- **实现难度**：**中**。核心复杂度在六边形支撑的 CUDA 栅格化 + 透视求交（无逐像素求逆），训练侧与 2DGS 几乎同构（Adam + L1/SSIM 损失）。作者已开源含 CUDA 内核。
- **预期性能**：同等内存下 PSNR +4.5~7.4 dB、渲染 1.5~2.3× 加速、训练 VRAM 最多降 7×——**这是「图元设计换效率」路线中最有说服力的一组数字**。
- **适用场景**：
  1. 需要高质量 + 低显存的实时 NVS（XR / 移动端 / 边缘设备）；
  2. **O(1) 导出 surface cell** 使其特别适合需要显式表面对下游任务（分割、表征学习、3D 生成）的场景，避开 TSDF/Marching Cubes；
  3. 2D 图像表示（Image-GS 类）任务。
- **行动建议**：**推荐实现**。可直接复用其 CUDA 栅格化内核，替换自有引擎的 primitive 层，作为「图元级压缩」方案的低风险落点。优先级：**高**。

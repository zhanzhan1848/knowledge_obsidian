# 每日流体渲染研究总结 | 2026-06-30

## 📅 搜索范围
- **时间**: 2026-06-29 ~ 2026-06-30 (最近24小时)
- **来源**: arXiv cs.GR, SIGGRAPH 2026 Technical Papers

---

## 🔬 SIGGRAPH 2026 流体相关论文

### ⭐ Spatiotemporal FLIP — Honorable Mention
> **"Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps"**

| 属性 | 详情 |
|------|------|
| **作者** | Bernhard Braun, Rene Winchenbach, Nils Thuerey (TU Munich), Jan Bender (RWTH Aachen) |
| **会议** | SIGGRAPH 2026 Technical Papers |
| **荣誉** | Honorable Mention |
| **日期** | 2026-07-19~23, Los Angeles |

### 核心创新
- 将粒子视为 **4D 时空采样**，突破传统 FLIP 时间步限制
- 可用 **比常规求解器大一个数量级的时间步长**
- 单台工作站即可完成 **数十亿粒子** 模拟加速
- 与现有 FLIP/PIC/APIC 求解器**轻量级插件式集成**

### 技术细节
```
ST-FLIP = Spatiotemporal FLIP
关键：粒子 → 4D space-time samples
效果：时间步 ↑ 10x, 速度提升数倍
目标：大规模液面 / 两相模拟
```

### 渲染相关性
- ✅ **自由表面重建** (free-surface) → 水面渲染
- ✅ **两相流模拟** (two-phase) → 水中气泡/飞溅
- ✅ 大规模粒子 → 粒子渲染管线
- ⚠️ 聚焦模拟，未涉及渲染

### 可行性分析：ST-FLIP 模拟 → 渲染管线

| 维度 | 评估 |
|------|------|
| **模拟方法** | SPH/FLIP 粒子，4D 时空采样 |
| **渲染方法** | 需结合屏幕空间或粒子渲染 |
| **逼真度** | ⭐⭐⭐⭐ 生产级保真 |
| **实时潜力** | 高（时间步大，迭代快）|
| **GPU 需求** | 中高（多亿粒子）|
| **推荐度** | ✅ 强烈推荐，Honorable Mention |

---

## 📄 arXiv cs.GR 论文 (2026-06-29~30)

### 1. Dipole Diffusion Error in Thin Geometry — **高度相关**
> **"Dipole Diffusion Error in Thin Geometry: Optical Thickness Laws for Grid-Free Subsurface Scattering"**

| 属性 | 详情 |
|------|------|
| **arXiv** | [2606.29387](https://arxiv.org/abs/2606.29387) |
| **作者** | (cs.GR, math.NA) |
| **日期** | 2026-06-29 |

#### 核心问题
偶极子（dipole）模型假设半无限平板，但**薄几何和弯曲物体**会产生系统性误差。

#### 关键公式
- 漫反射率误差衰减率: `$Ce^{-2\tau}$`, 其中 `$\tau=T/\ell_d$`
- 透射通量衰减率: `$e^{-\tau}$`
- 预因子仍与材质相关（材料依赖）

#### 方法
1. 在平板几何中推导闭式漫反射率和透射率
2. 将指数与 **killed random walks** 关联
3. 通过光学距离扩展到空间变化的介质
4. 使用 **Walk on Spheres (WoS)** 在 SDF 域直接求解筛选泊松扩散

#### 渲染技术关联
| 技术 | 相关性 |
|------|--------|
| 次表面散射 (SSS) | ✅ 核心主题，直接适用于水/皮肤/大理石 |
| 体积渲染 | ✅ 薄特征透射预测 |
| 光束/光柱效果 | ⚠️ 间接（光学厚度预测）|
| 水面渲染 | ✅ 水下次表面散射 |

#### 可行性分析：薄几何次表面散射

| 维度 | 评估 |
|------|------|
| **渲染方法** | 体积/次表面（随机游走+WoS） |
| **视觉质量** | ⭐⭐⭐⭐⭐ 精确物理建模 |
| **实时支持** | 需预计算，适合离线渲染 |
| **着色器复杂度** | 高（WoS 路径追踪）|
| **推荐度** | ✅ 高价值，薄几何 SSS 精确修正 |

---

### 2. Spectral Subsurface Scattering from RGB
> **"Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion"**

| 属性 | 详情 |
|------|------|
| **arXiv** | [2606.27604](https://arxiv.org/abs/2606.27604) |
| **日期** | 2026-06-25 |

#### 核心贡献
从单张 **RGB 漫反射率** 预测完整光谱皮肤散射参数（各向异性、散射半径、散射率）。

#### 方法
- **混合介质表示** (Mixture-of-Media)：三层不相关介质聚合近似皮肤多层结构
- **链式神经解码器**：RGB → 光学参数
- 随机游走路径追踪器兼容

#### 渲染相关性
| 技术 | 相关性 |
|------|--------|
| 次表面散射 | ✅ 核心主题 |
| 水渲染 | ⚠️ 皮肤导向，但方法可迁移 |
| 体积渲染 | ✅ 光谱方法 |

---

### 3. Rendering Coherent Scattering via Quantum Collision Models
> **"Rendering Coherent Scattering via Quantum Collision Models"**

| 属性 | 详情 |
|------|------|
| **arXiv** | [2606.29989](https://arxiv.org/abs/2606.29989) |
| **日期** | 2026-06-29 |

#### 核心思想
用**量子碰撞模型**（Quantum Collision Models）模拟相干光-物质相互作用下的次表面散射。将入射光和材料激发视为量子化模式，建模为一系列对称约束的幺正碰撞。

#### 渲染相关性
| 技术 | 相关性 |
|------|--------|
| 次表面散射 | ✅ 新型散射框架 |
| 材质渲染 | ✅ 新物理启发的材质 |
| 水渲染 | ⚠️ 间接 |

---

### 4. RenderFormer++ — Neural Rendering
> **"Scalable and Physically Grounded Feed-Forward Neural Rendering"**

| 属性 | 详情 |
|------|------|
| **arXiv** | [2606.30380](https://arxiv.org/abs/2606.30380) |
| **日期** | 2026-06-29 |

#### 核心创新
- **PITG** (Physics-Informed Transport Guidance)：将渲染方程归纳偏置嵌入注意力机制
- **HOCT** (Hierarchical Object-Centric Tokenization)：目标级 token 化，显著降低复杂度

#### 渲染相关性
| 技术 | 相关性 |
|------|--------|
| 全局光照 | ✅ 核心主题 |
| 体积光照 | ⚠️ 间接 |

---

## 📊 综合评估

### 本周期最值得关注

| 排名 | 论文 | 原因 |
|------|------|------|
| 🥇 | **ST-FLIP** (SIGGRAPH 2026) | Honorable Mention, 大规模自由表面加速，突破时间步限制 |
| 🥈 | **Dipole Diffusion Error** (2606.29387) | 薄几何 SSS 精确建模，直接利好水面渲染 |
| 🥉 | **Spectral SSS from RGB** (2606.27604) | RGB → 光谱散射参数，实用价值高 |

### 趋势分析
1. **大规模流体模拟**仍是 SIGGRAPH 核心方向，ST-FLIP 获 Honorable Mention 印证
2. **次表面散射**持续热门（3篇相关），薄几何误差修正成为新热点
3. **神经渲染**与物理一致性结合增强（RenderFormer++）

---

## 🗂️ 知识库更新
- 本文件: `~/knowledge-vault/doumiao/01-Papers/2026-06-30_Daily-Research-Summary.md`
- Git 同步: `~/.scripts/git-sync.sh`

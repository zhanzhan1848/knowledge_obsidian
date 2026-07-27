# 🥬 每日渲染论文搜索报告

**日期**: 2026-07-27
**时间**: 14:00 UTC
**搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026

---

## 📊 搜索概况

- **arXiv cs.GR**: 最近一周 29 篇新论文
- **SIGGRAPH 2026**: 技术论文 + 实时渲染课程
- **重点关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## 🔥 重点论文

### 1. Split Radiance Cascades - 实时3D全局光照 (⭐⭐⭐⭐⭐)

| 属性 | 内容 |
|------|------|
| **标题** | Real-Time Global Illumination via Sparse Radiance Probes |
| **arXiv** | [2607.20384](https://arxiv.org/abs/2607.20384) |
| **作者** | Rouli Freeman |
| **日期** | 2026-07-22 |
| **类别** | 全局光照 / 实时渲染 |

**核心贡献**: 
- 将 Radiance Cascades 适配到准确的实时3D漫反射全局光照
- 使用稀疏 hashmap 存储世界空间探针
- 提出 ray splitting 方法计算 radiance intervals
- 支持单帧和时间累积上下文

**技术方案**:
- 稀疏 hashmap 存储探针
- Ray splitting: 从可见表面追踪光线，根据击中距离计算级联贡献
- 保持无噪声无锯齿的细节

**可行性**: ✅ 高
- 适合动态场景
- 不依赖时序历史

---

### 2. Wave-Optics Rendering for Holographic Displays (⭐⭐⭐⭐)

| 属性 | 内容 |
|------|------|
| **标题** | Fast Wave-optics Rendering of Multiplane Images for 3D Holographic Displays |
| **arXiv** | [2607.19731](https://arxiv.org/abs/2607.19731) |
| **作者** | Brian Chao |
| **日期** | 2026-07-22 |
| **类别** | 神经渲染 / 全息显示 |

**核心贡献**:
- 基于 MPI (Multiplane Images) 的计算全息术算法
- 比 SOTA primitive-based CGH 算法快 250,000x
- 同时优于传统 layer-based CGH 算法的图像质量

**可行性**: ⚠️ 中等
- 专用于全息显示
- 技术有迁移价值

---

### 3. Curly Hair Simulation (⭐⭐⭐)

| 属性 | 内容 |
|------|------|
| **标题** | Curly Hair Simulation using Curly Finite Elements |
| **arXiv** | [2607.22103](https://arxiv.org/abs/2607.22103) |
| **作者** | Zhendong Wang |
| **日期** | 2026-07-24 |
| **类别** | 物理模拟 / 毛发渲染 |

**核心贡献**:
- 将每根发丝分解为 curly elements
- rod-base configuration + 解析高频皱纹
- 曲率能量分裂方案
- 混合碰撞处理策略

---

### 4. Finding Fast Filters (⭐⭐⭐)

| 属性 | 内容 |
|------|------|
| **标题** | Finding Fast Filters |
| **arXiv** | [2607.20634](https://arxiv.org/abs/2607.20634) |
| **作者** | Karima Ma |
| **日期** | 2026-07-22 |
| **类别** | 图像滤波 / 渲染加速 |

**核心贡献**:
- 统一多种快速滤波近似技术
- 自动搜索算法空间
- 可生成 Pareto 前沿

---

## 🎮 SIGGRAPH 2026 实时渲染进展

### Advances in Real-Time Rendering in Games 课程

**亮点技术**:

#### 1. ORCA - 在线 radiance cache 加速路径追踪
- **公司**: EA SEED (Jon Greenberg)
- **特点**: 不依赖时序历史，数据结构瞬时
- **适用**: 完全动态场景

#### 2. PSSR 升级版 - PlayStation5 Pro
- **公司**: Sony Interactive Entertainment (Daniel Craig)
- **改进**: 恢复显式闭式解，聚焦模式(pattern recognition)
- **效果**: 更高视觉质量 + 更低运行时/内存/训练成本

#### 3. Variable Rate Ray Tracing (VRRT)
- **公司**: Infinity Ward (Michał Olejnik)
- **应用**: Call of Duty: Modern Warfare 4
- **特点**: 
  - 子1样本/像素 + 选择性超采样
  - 时序梯度预通道 + 显式遮挡检测
  - GPU驱动帧调度器保证稳定GPU成本

#### 4. Smolder - 实时体积效果渲染
- **公司**: IO Interactive
- **引擎**: Glacier
- **应用**: 007 First Light
- **特点**: 与所有照明系统完全集成

#### 5. SLIM - 用户生成3D世界扩展
- **公司**: Roblox (Sergey Makeev)
- **功能**: 自动生成设备自适应运行时表示

#### 6. Adaptive Tessellation and Subdivision
- **公司**: Meta (John Hable)
- **技术**: compute shader 细分 + Catmull-Clark

---

## 📈 技术趋势

1. **路径追踪实用化**: ORCA等技术推动实时路径追踪
2. **可变采样率**: VRRT等技术在质量和性能间平衡
3. **神经渲染集成**: DLSS/PSSR等AI超分成为标配
4. **体积渲染进步**: Smolder展示游戏体积效果新方向
5. **动态GI**: Radiance Cascades等方法持续改进

---

## 🔔 建议关注

1. **Split Radiance Cascades** - 适合动态场景的实时GI，值得深入研究
2. **ORCA** - 工业界路径追踪加速方案，可行性高
3. **VRRT** - 下一代游戏ray tracing参考

---

*报告生成时间: 2026-07-27 14:00 UTC*

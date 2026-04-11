# 🥬 每日渲染论文搜索报告 — 2026-04-11

## 搜索范围

- **来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, neural rendering
- **时间**: 最近24小时（2026-04-10 至 2026-04-11）

---

## 📋 搜索摘要

| 来源 | 论文总数 | 渲染相关数 |
|------|----------|-----------|
| arXiv cs.GR (04/10-04/11) | ~30 | 3 |
| ACM Digital Library | ~ | 0 |
| SIGGRAPH/SIGGRAPH Asia | - | 0 |

---

## 📄 Generative World Renderer

| 属性 | 值 |
|------|-----|
| **标题** | Generative World Renderer |
| **作者** | Zhixiang Wang et al. (Alaya Studio, NTU, UTokyo) |
| **链接** | [arXiv:2604.02329](https://arxiv.org/abs/2604.02329) |
| **项目页** | [alaya-studio.github.io/renderer](https://alaya-studio.github.io/renderer/) |
| **cs分类** | cs.CV |

### 核心贡献
1. **大规模 AAA 游戏数据集**: 400 万帧连续 RGB + 5 通道 G-buffer（depth, normals, albedo, metallic, roughness），720p/30fps，涵盖多样化场景和天气条件
2. **双向渲染增强**: 逆渲染（材质分解）+ 前向渲染（G-buffer 引导视频生成）
3. **VLM 评估协议**: 测量语义、空间和时间一致性
4. **G-buffer 文本引导风格编辑**: 通过文本提示编辑 AAA 游戏风格

### 技术方案
- **数据采集**: ReShade API 拦截 + 双屏拼接捕获策略
- **核心方法**: 扩散模型将 G-buffer 和光照映射到逼真图像，隐式学习复杂光传输（体积散射、全局光照）
- **评估**: VLM-based ranking protocol，与人类判断高度相关

### 创新性评估
- **创新性**: ⭐⭐⭐⭐⭐（大规模 G-buffer 数据集填补领域空白）
- **实用性**: ⭐⭐⭐⭐⭐（双向渲染 + AAA 游戏风格编辑）
- **难度**: 高（需要大规模数据采集和处理流水线）

### 标签
#逆渲染 #前向渲染 #G-buffer #全局光照 #PBR #扩散模型 #数据集

### 状态
✅ 已创建笔记: `2026-04/2026-04-11_Generative-World-Renderer.md`

---

## 📊 关键词覆盖率

| 关键词 | 命中 |
|--------|------|
| ray tracing | ❌ 无新论文 |
| path tracing | ❌ 无新论文 |
| real-time rendering | ✅ Generative World Renderer |
| global illumination | ✅ Generative World Renderer (隐式学习) |
| PBR | ✅ Generative World Renderer |
| rasterization | ❌ 无新论文 |
| BVH | ❌ 无新论文 |
| ray marching | ❌ 无新论文 |

---

## 🔍 其他相关论文

| ID | 标题 | 领域 | 相关度 |
|----|------|------|--------|
| 2604.02329 | Generative World Renderer | 逆渲染/前向渲染/G-buffer | ⭐⭐⭐⭐⭐ |

---

## 📝 技术趋势观察

1. **G-buffer 数据集成为热点**: Generative World Renderer 填补了 AAA 游戏 G-buffer 数据的空白，支持大规模双向渲染训练

2. **VLM 评估越来越重要**: 缺乏 ground truth 的真实场景下，VLM-based 评估成为新的标准

3. **3DGS 相关论文检索中**: 最近检索到的论文以 3D Gaussian Splatting 为主，辐射一致性、非指数模型、偏振线索等方向持续活跃

---

## ✅ 已完成

- [x] 论文搜索 (arXiv cs.GR)
- [x] 内容抓取和提炼
- [x] 创建结构化笔记
- [x] 生成每日报告

---

## 📁 知识库同步

待执行 `git-sync.sh` 同步到 GitHub。

---
*🥬 生菜 · 每日论文搜索 · 2026-04-11 14:00 UTC*

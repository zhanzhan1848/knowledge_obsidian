# 每日论文搜索报告 — 2026-07-23

**执行时间**: 2026-07-23 14:07 UTC  
**搜索范围**: arXiv cs.FL, physics.flu-dyn, cond-mat.soft (最近24小时)  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, active matter

---

## 📋 本日找到论文 (5篇)

| ID | 标题 | 分类 | 关键词 |
|----|------|------|--------|
| [2607.20199](2026-07-22/2607.20199-LogRe-Cost-Turbulence-Framework.md) | A Formal log(Re)-cost Framework for the Engineering Turbulence Problem | physics.flu-dyn | turbulence, RANS, FIML, ML |
| [2607.20029](2026-07-22/2607.20029-Burnett-DBM-Multicomponent-Flows.md) | Burnett-Level DBM for Compressible Multicomponent Flows Under External Forces | physics.flu-dyn | LBM, DBM, Burnett, multicomponent |
| [2607.20346](2026-07-22/2607.20346-IteraSim-RAG-OpenFOAM.md) | IteraSim RAG: Multi-Stage RAG Back-End for OpenFOAM-Based CFD | cs.CE/physics.flu-dyn | OpenFOAM, RAG, LLM, automation |
| [2607.20100](2026-07-22/2607.20100-Active-Matter-Fluid-Flow-Inverse-Problem.md) | Inferring Activity from Fluid Flow in Continuum Models of Active Matter | cond-mat.soft | active matter, inverse problem, deep learning |
| [2607.20067](2026-07-22/2607.20067-Surface-Waves-Air-Entrainment-Water-Entry.md) | Surface Waves Alter Air Entrainment During Water Entry | physics.flu-dyn | air entrainment, multiphase, water entry |

---

## 🔍 论文摘要

### 1. Turbulence Cost Scaling (2607.20199)
首个从计算复杂度角度分析湍流问题的研究。提出多保真度FIML框架，在RANS框架内实现 $O(\log Re)$ 成本，同时在高Re（37000）测试中保持强外推能力，误差接近Re数无关。训练于 $Re_τ=1000$，部署于 $Re_τ=5200$ 及以上。

### 2. Burnett-Level DBM (2607.20029)
将离散玻尔兹曼模型从单组分扩展到多组分可压缩流+外力场。采用25离散速度集，通过Chapman-Enskog展开精确恢复Burnett级方程。验证算例覆盖：多组分扩散、Sod激波管、热Couette、KH不稳定性、RT不稳定性。

### 3. IteraSim RAG (2607.20346)
面向OpenFOAM的多阶段RAG+多Agent CFD自动化框架。三阶段检索（LLM查询扩展→RRF融合→MMR重排）+ 三Agent协作（Architect/InputWriter/Reviewer）。28-case benchmark，参数修改类>90%覆盖率，6个参考配置全部运行成功。

### 4. Active Matter Inverse Problem (2607.20100)
解决主动物质连续统模型中的逆问题：从流场数据推断主动应力参数。证明动能谱作为活性特征载体，通过深度学习实现Active Model H和Active Nematics的模型选择与参数推断。

### 5. Air Entrainment Waves (2607.20067)
系统研究动态表面波对疏水球入水空气夹带的影响。发现局部波面斜率（$ak$）是主导无量纲参数，结合Weber数和Bond数建立预测框架。对海洋/工业应用有直接参考价值。

---

## 📊 搜索统计
- **搜索批次**: 6次（触发2次速率限制）
- **有效结果**: 5篇新论文
- **已创建笔记**: 5篇
- **知识库目录**: `~/knowledge-vault/caixin/01-Papers/2026-07-22/`

## 🔗 链接
- 本日所有笔记: `~/knowledge-vault/caixin/01-Papers/2026-07-22/`
- GitHub: https://github.com/zhanzhan1848/knowledge_obsidian.git

---
*由 鲜毛肚 (Caixin) 自动生成 — 2026-07-23*

# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting |
| **作者** | Qianfan Shen, Ningxiao Tao, Qiyu Dai, Tianle Chen, Minghan Qin, Yongjie Zhang, Mengyu Chu, Wenzheng Chen, Baoquan Chen |
| **发表** | ICLR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.00177) |
| **arXiv ID** | 2605.00177v1 |
| **分类** | cs.GR, cs.CV |
| **日期** | 2026-04-30 (submitted) / 2026-05-04 (announced) |
| **主题** | 3D Gaussian Splatting, Fire Simulation, Volume Rendering |

---

## 核心贡献

> 将物理精确燃烧模拟与 3DGS 管线统一，实现野外场景的逼真火焰合成

1. **多模态 LLM 物理材质推理** — 自动推断场景材质的燃烧特性
2. **高效体积燃烧模拟** — 与 3DGS 管线耦合的实时燃烧模拟
3. **统一渲染器** — 同时渲染火焰/烟雾与 3DGS 场景

---

## 技术方案

### 核心思想

传统 CFD 和图形管线可产生逼真火焰效果，但依赖手工几何、专家调参和劳动密集型工作流，难以扩展到真实世界。3DGS 可实现高保真场景重建，但缺乏燃烧物理 grounding。

**FieryGS** 将物理精确燃烧模拟与渲染统一到 3DGS 管线中。

### 三大模块

| 模块 | 说明 |
|------|------|
| 多模态 LLM 物理材质推理 | 自动推断燃烧参数 (燃点、热导率等) |
| 高效体积燃烧模拟 | volumetric combustion simulation |
| 统一渲染器 | fire + 3DGS 联合渲染 |

### 支持现象
- Flame propagation (火焰传播)
- Smoke dispersion (烟雾扩散)
- Surface carbonization (表面碳化)
- 用户可控：火强、风向、点火位置等

---

## 实验结论

- **数据集**: 多样室内外场景
- **基线**: 多个 comparative baselines
- **结果**: 在 visual realism、physical fidelity、controllability 上优于所有基线

---

## 流体渲染相关性

### 适用场景
- ✅ **火焰渲染** — 体积火焰 + 表面碳化
- ✅ **烟雾渲染** — smoke dispersion
- ✅ **粒子系统** — 与 3DGS 粒子协同
- ✅ **体积渲染** — volumetric combustion

### 技术借鉴
1. **3DGS + 体积模拟融合** → 可迁移到水体/泡沫渲染
2. **LLM 物理推理** → 自动推断材质参数
3. **统一渲染器** → 多流体耦合渲染管线

### 不适用于
- ❌ 纯离线路径追踪场景
- ❌ 大规模海洋表面

## 方法分类
- **类型**: 体积渲染 + 表面渲染
- **技术**: 3D Gaussian Splatting + Volumetric Simulation + LLM
- **层次**: 实时/交互式

---

## 可行性分析

🩸 **可行性分析：FieryGS — 3DGS 火焰合成**

## 渲染方法
- 类型：体积渲染 + 表面渲染
- 技术：3DGS + Volumetric Ray Marching + LLM-based reasoning

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：有限

## 性能预期
- 帧率：实时 (3DGS 管线)
- GPU 需求：高 (3DGS + 燃烧模拟)
- 内存占用：中等

## 实现建议
- 着色器复杂度：高
- 管线要求：3DGS pipeline + 体积模拟
- 推荐度：✅✅ 极具参考价值

---

*笔记创建: 2026-05-04*
*来源: arXiv cs.GR (2026-05-04 daily)*

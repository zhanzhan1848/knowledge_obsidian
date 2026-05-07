# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

**arXiv ID**: 2605.00177v1  
**发表**: 2026-04-30  
**会议**: ICLR 2026  
**类别**: cs.GR, cs.CV  
**来源**: PKU VCL Geometry  

---

## 研究问题

**Problem**: 在野外真实场景中合成逼真、物理合理的燃烧效果。

**Challenges**:
- 传统 CFD 和图形管线依赖手工几何、专家调参，难以扩展到真实场景
- 3D Gaussian Splatting (3DGS) 能重建高质量真实场景，但缺乏燃烧物理基础

---

## 核心方案：FieryGS Framework

FieryGS 将物理精确且用户可控的燃烧模拟和渲染与 3DGS 管线集成。

### 三大模块

#### 1. Multi-modal LLM-based Physical Material Reasoning
- 使用多模态 LLM 自动推断场景中材质的燃烧属性
- 无需手动指定材质参数

#### 2. Efficient Volumetric Combustion Simulation
- 高效体积燃烧模拟器
- 支持 flame propagation, smoke dispersion, surface carbonization

#### 3. Unified Renderer for Fire and 3DGS
- 统一渲染器，同时渲染火焰与 3DGS 场景

### 用户可控参数
- Fire intensity (火强度)
- Airflow (气流)
- Ignition location (点火位置)
- 其他燃烧参数

---

## 技术创新

1. **物理融合**: 首次将物理燃烧模拟与 3DGS 场景重建结合
2. **自动材质推理**: LLM 自动推断材质燃烧属性，消除手工调参
3. **统一渲染管线**: 火焰与场景统一渲染

---

## 实验结果

- 室内外多样场景
- 在视觉真实度、物理保真度和可控性上均优于所有基线方法

---

## 项目主页

https://pku-vcl-geometry.github.io/FieryGS/

---

## 相关工作

- 3D Gaussian Splatting (3DGS)
- Volumetric combustion simulation
- Neural scene reconstruction

---

## 标签

#fire #3DGS #fluid-simulation #combustion #neural-rendering #ICLR2026
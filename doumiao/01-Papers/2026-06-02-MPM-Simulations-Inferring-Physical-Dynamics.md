---
title: Material-Point-Method Simulations for Inferring and Extrapolating Physical Dynamics
authors: Žiga Kovačič et al.
date: 2026-06-01
tags: [MPM, fluid simulation, physics simulation, deformable objects, video diffusion, code generation]
category: fluid-simulation
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.01538
pdf: https://arxiv.org/pdf/2606.01538
github: https://zzigak.github.io/mpmworlds/
---

## 核心创新点

### 研究目标
从视频中推断物理动力学并外推未来时间步的物理模拟。

### 方法
构建 **MPM (Material Point Method) 2D 物理模拟数据集**，覆盖：
- 可变形物体
- **流体 (fluids)**
- 运动物体
- 发射器

研究代码生成和视频扩散两种方法，比较其在不同物理相关信息量下的表现。

### 关键发现
| 方法 | 优势 | 劣势 |
|------|------|------|
| **代码生成模型** | 物理/时间稳定的外推 | 从视觉输入推断物理参数困难 |
| **视频扩散模型** | 强几何识别能力 | 物理不可信的外推 |

## 技术细节

### MPM 模拟
- Material Point Method 是一种混合欧拉-拉格朗日方法
- 广泛用于沙子、泥土、冰、流体等物理模拟
- 在 Houdini、MantaFlow 等商业软件中有应用

### 数据集规模
- 2D MPM 物理模拟数据集
- 包含丰富的物理现象

## 渲染方法相关性
- **类型**：物理模拟 → 可用于流体渲染的数据生成
- **技术**：MPM → 适合流体/可变形物体
- **应用**：为神经网络渲染提供物理模拟真值数据

## 性能预期
- 帧率：取决于模拟分辨率
- GPU 需求：中等
- 内存占用：中等

## 实现建议
- 着色器复杂度：不适用
- 管线要求：MPM 模拟管线
- 推荐度：✅ 对于流体模拟研究者

## 公式/关键方法
MPM 将材料点嵌入背景网格，通过网格进行数值计算，适合处理大变形流体模拟。

---

## 参考文献
- MPMWorlds: https://zzigak.github.io/mpmworlds/
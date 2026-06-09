# Neural Refractive Index Primitives for Flame Field Reconstruction Using Background-Oriented Schlieren

> 日期: 2026-06-09
> 来源: arXiv (arXiv:2605.11454)
> 搜索关键词: flame rendering, volume rendering, neural implicit, BOS tomography

---

## 基本信息
- **arXiv ID:** 2605.11454
- **作者:** Xinyi Lu, Wei Hu, Zheng Wang, Yue Zhang, Jingxuan Li
- **机构:** Beihang University, Ningbo Institute of Technology
- **领域:** 体积渲染 / 火焰重建

---

## 核心创新

### 问题背景
- 燃烧诊断涉及的空间尺度跨越多个数量级
- 传统 BOS (Background-Oriented Schlieren) 方法需要多视角摄像系统（通常10 个以上）
- 现有代数重建方法 (ART) 在高分辨率燃烧场中过度平滑化

### 技术方案
1. **神经折射率基元 (Neural Refractive Index Primitives)**
   - 使用紧凑的多层感知器 (MLP)
   - 将折射率场作为唯一神经基元

2. **多分辨率哈希编码 (Multiresolution Hash Encoding)**
   - 实现快速收敛
   - 高分辨率空间连贯重建

3. **自动离散梯度损失 (Automatic-Discrete Gradient Losses)**
   - 改善优化稳定性

4. **3D mask 约束**
   - 抑制伪影，提高稳定性
   - 保留精细尺度湍流结构

### 技术细节
- **渲染类型:** 体积渲染 (Volume Rendering)
- **重建方法:** 神经隐式重建 (Neural Implicit Reconstruction)
- **编码策略:** 多分辨率哈希编码 + 射线采样方案
- **应用场景:** BOS 层析成像火焰折射率重建

### 关键公式/方法
- 折射率 → 密度 → 温度 (Gladstone-Dale 关系 + 理想气体状态方程)
- 射线偏转角通过几何光学估算
- 逆射线方程重建折射率场

---

## 性能与质量

| 指标 | 表现 |
|------|------|
| 重建质量 | 大尺度结构 + 精细湍流均可恢复 |
| 鲁棒性 | 对噪声有强鲁棒性 |
| 收敛速度 | 快速收敛 |
| 空间分辨率 | 高分辨率重建 |

### 对比优势
- 优于频率编码方法 (frequency-encoding-based)
- 优于体素方法 (voxel-based reconstruction)

---

## 适用场景
- 燃烧火焰体积重建
- 工业燃烧诊断
- 发动机燃烧分析
- 温度场推断

---

## URL
https://arxiv.org/html/2605.11454

---

## 关键词标签
#flame-rendering #volume-rendering #neural-implicit #BOS-tomography #hash-encoding #combustion
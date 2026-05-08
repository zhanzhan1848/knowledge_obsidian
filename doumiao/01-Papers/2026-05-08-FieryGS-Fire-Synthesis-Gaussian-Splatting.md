# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

## 论文信息
- **arXiv ID**: [2605.00177](https://arxiv.org/abs/2605.00177)
- **标题**: FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting
- **作者**: Qianfan Shen, Ningxiao Tao, Tianle Chen, Minghan Qin, Yongjie Zhang, Mengyu Chu, Wenzheng Chen, Baoquan Chen (Peking University, ByteDance, BAAI)
- **发表**: ICLR 2026
- **日期**: 2026-05-01
- **类别**: cs.GR (Graphics)
- **项目主页**: [FieryGS](https://pku-vcl-geometry.github.io/FieryGS/)

## 核心创新点

### 1. 任务目标
在真实场景中合成**物理真实、可控**的燃烧效果（火焰传播、烟雾扩散、表面碳化）

### 2. 三模块架构
```
┌─────────────────────────────────────────────────────────────┐
│                      FieryGS Pipeline                        │
├─────────────────────────────────────────────────────────────┤
│  (1) MLLM-based Material Reasoning                          │
│      - 多模态大语言模型推理燃烧相关物理材料属性               │
│      - 从3DGS重建中零样本推断材料属性                          │
├─────────────────────────────────────────────────────────────┤
│  (2) Volumetric Combustion Simulation                       │
│      - 可控的体积燃烧模拟                                     │
│      - 木材碳化过程建模                                       │
│      - 计算成本与视觉真实感的平衡                             │
├─────────────────────────────────────────────────────────────┤
│  (3) Unified Fire-3DGS Renderer                             │
│      - 统一渲染器：火焰+烟雾+3DGS                              │
│      - 真实感发射和光照                                        │
└─────────────────────────────────────────────────────────────┘
```

### 3. 关键技术特点
- **无需手工设计**：自动化生成真实、可控的火焰动态
- **物理一致性**：与场景几何和材料属性一致
- **用户可控参数**：
  - Fire intensity（火焰强度）
  - Airflow（气流）
  - Ignition location（点燃位置）
  - 其他燃烧参数

## 渲染技术分析

### 🩸 可行性分析：物理集成高斯泼溅火焰合成

## 渲染方法
- **类型**：体积渲染 + 表面渲染混合
- **技术**：Physics-Integrated 3D Gaussian Splatting
- **创新点**：
  - 将物理燃烧模拟与3DGS管线深度融合
  - MLLM用于零样本材料属性推理
  - 体积燃烧模拟 + 表面碳化统一渲染

## 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐ (在野场景真实火焰)
- **物理真实性**：⭐⭐⭐⭐⭐ (CFD级别物理约束)
- **风格化支持**：否（专注写实）

## 性能预期
- **渲染效率**：3DGS原生高效渲染
- **模拟计算**：体积燃烧模拟（可控复杂度）
- **GPU需求**：中等（3DGS + 体积模拟）

## 实现建议
- **着色器复杂度**：高（需同时处理3DGS和体积渲染）
- **管线要求**：多模块耦合（MLLM + 模拟 + 渲染）
- **推荐度**：✅ 极具创新，结合MLLM和物理模拟的前沿工作

## 相关工作对比

| 方法 | 真实场景适用 | 视觉真实 | 物理真实 | 可控性 | 用户友好 |
|------|-------------|---------|---------|-------|---------|
| 全尺度实验 | ❌ | ✅ | ✅ | ❌ | ❌ |
| CFD方法 | ❌ | ✅ | ✅ | ✅ | ❌ |
| VFX工具 | ❌ | ✅ | ✅ | ✅ | ❌ |
| 商业软件 | ✅ | ❌ | ❌ | ❌ | ✅ |
| 大视频模型 | ✅ | ✅ | ❌ | ❌ | ✅ |
| **FieryGS** | ✅ | ✅ | ✅ | ✅ | ✅ |

## 核心公式/方法

### 体积燃烧模拟
- 体积热传导方程
- 木材碳化动力学
- 烟雾传输模型

### 统一渲染
- 火焰发射+烟雾参与介质
- 3DGS表面着色融合

## 应用场景
- AR/VR 游戏
- 影视特效
- 虚拟消防演练
- 文化遗产保护
- 机器人感知（恶劣条件下的火焰感知）

## 代码资源
- GitHub: 待发布
- 项目主页: https://pku-vcl-geometry.github.io/FieryGS/

## 关键词
#fire-simulation #gaussian-splatting #physics-simulation #volume-rendering #combustion #3DGS #smoke-rendering #neural-rendering

## 观察时间
2026-05-08

---
*🌱 豆苗 - 流体渲染知识库*

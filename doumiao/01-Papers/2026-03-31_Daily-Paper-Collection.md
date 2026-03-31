# 每日流体渲染论文收集
**日期**: 2026-03-31
**搜索范围**: arXiv cs.GR (最近7天内)
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📄 Paper 1: RefracGS - 折射水面渲染

### 基础信息
| 属性 | 内容 |
|------|------|
| **标题** | RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing |
| **arXiv ID** | [2603.21695](https://arxiv.org/abs/2603.21695) |
| **发表日期** | 2026-03-23 |
| **作者** | Yiming Shao, Qiyu Dai, Chong Gao, Guanbin Li, Yeqiang Wang, He Sun, Qiong Zeng, Baoquan Chen, Wenzheng Chen |
| **类别** | cs.CV, cs.GR |
| **论文页** | [项目主页](https://yimgshao.github.io/refracgs/) |

### 核心创新点

#### 🔬 技术方法
- **问题**: 非平面折射表面的新视角合成(NVS)面临严重的光学畸变挑战
- **核心思路**: 将折射边界与目标物体显式解耦
  - 折射表面 → 神经高度场 (Neural Height Field) 捕获波浪几何
  - 下方场景 → 3D Gaussian Field
- **关键技术**: 折射感知的高斯光线追踪 (Refraction-aware Gaussian Ray Tracing)
  - 使用 Snell 定律精确计算非线性光线轨迹
  - 高效渲染下方 Gaussian Field
  - 反向传播损失梯度到参数化折射表面

#### 📊 性能指标
| 指标 | 数值 |
|------|------|
| 训练速度 | 15x faster than prior methods |
| 渲染速度 | 200 FPS (实时) |
| 视觉效果 | 优于 prior refractive methods |

### 渲染方法分类
- **类型**: 表面渲染 (折射水面)
- **技术**: 3D Gaussian Splatting + Ray Tracing + Neural Height Field
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 否

### 实现建议
- **着色器复杂度**: 中等
- **管线要求**: 需要 GPU 支持的光线追踪
- **推荐度**: ✅ 强烈推荐

### 关键公式/概念
```
Snell's Law: n1 * sin(θ1) = n2 * sin(θ2)
光线追踪: 非线性折射轨迹计算
神经高度场: 波浪几何参数化表示
```

---

## 📄 Paper 2: Fire as a Service - 机器人仿真中的火焰动力学

### 基础信息
| 属性 | 内容 |
|------|------|
| **标题** | Fire as a Service: Augmenting Robot Simulators with Thermally and Visually Accurate Fire Dynamics |
| **arXiv ID** | [2603.19063](https://arxiv.org/abs/2603.19063) |
| **发表日期** | 2026-03-19 |
| **作者** | Anton R. Wagner, Madhan Balaji Rao, Helge Wrede, Sören Pirk, Xuesu Xiao |
| **类别** | cs.RO, cs.GR |

### 核心创新点

#### 🔬 技术方法
- **问题**: 现有机器人仿真器忽视火焰环境的热力学和光学复杂性
- **解决方案**: Fire as a Service (FaaS) - 异步联合仿真框架
  - 多物种热力学热传递
  - 视觉一致的体积烟雾渲染
  - 不干扰高频刚体控制回路
- **特点**: 
  - 实时性能支持人在回路遥操作
  - 支持通过行为克隆训练反应式多模态策略

#### 📊 性能指标
| 指标 | 特点 |
|------|------|
| 性能 | 实时 (Real-time) |
| 集成性 | 可与多种机器人仿真器集成 |
| 应用 | 消防机器人训练、感知数据收集 |

### 渲染方法分类
- **类型**: 体积渲染 (火焰/烟雾)
- **技术**: 多物种热力学 + 体积烟雾
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 否

### 实现建议
- **着色器复杂度**: 高
- **管线要求**: 需要流体仿真 + 体积渲染管线
- **推荐度**: ✅ 推荐 (针对机器人仿真场景)

---

## 📄 Paper 3: Adaptive GPU Kinetic Solver for Fluid-Granular Flows

### 基础信息
| 属性 | 内容 |
|------|------|
| **标题** | Adaptive GPU Kinetic Solver for Fluid-Granular Flows |
| **arXiv ID** | [2603.14982](https://arxiv.org/abs/2603.14982) |
| **发表日期** | 2026-03-16 |
| **作者** | Xingqiao Li, Kui Wu, Haozhe Su, Tianhong Gao, Mengyu Chu, Chenfanfu Jiang, Wei Li, Baoquan Chen |
| **类别** | cs.GR |

### 核心创新点

#### 🔬 技术方法
- **统一框架**: LBM (Lattice Boltzmann Method) + MPM (Material Point Method)
  - LBM 模拟流体
  - MPM 模拟颗粒材料 (沙、雪)
- **自适应**: 基于固体几何结构的自适应块多级 HOME-LBM 求解器
- **GPU 算法**: 动态维护响应粒子运动的多级块

#### 📊 性能指标
| 指标 | 特点 |
|------|------|
| 物理保真度 | 高 |
| 计算效率 | 高 |
| 规模 | 大规模现象支持 |

### 应用场景
- 雪崩 (Snow avalanches)
- 沙尘暴 (Sandstorms)
- 沙迁移 (Sand migration)

### 渲染方法分类
- **类型**: 流体-颗粒耦合仿真
- **技术**: LBM + MPM 耦合
- **逼真度**: ⭐⭐⭐⭐
- **推荐度**: ✅ 推荐

---

## 📊 今日搜索总结

### 论文统计
| 日期范围 | 找到论文数 | 相关论文数 |
|----------|-----------|-----------|
| 2026-03-28 ~ 2026-03-31 | 50 | 3 |

### 技术趋势
1. **3D Gaussian Splatting 在流体/折射渲染中的应用** - RefracGS 展示了GS在折射水面渲染中的潜力
2. **火焰仿真的实时性能需求** - FaaS 强调实时性能对机器人训练的重要性
3. **流体-颗粒耦合仿真** - 大规模自然现象仿真需求增长

### 下一步跟踪
- [ ] RefracGS 项目页面发布后获取代码
- [ ] FaaS 框架的实际集成效果
- [ ] SIGGRAPH 2026 流体相关论文公布 (会议在8月)

---

*生成时间: 2026-03-31 14:17 UTC*

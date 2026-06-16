# WorldParticle: 统一粒子动力学世界模拟器

## 📅 收集日期: 2026-06-16
**来源**: arXiv cs.GR
**arXiv ID**: [2605.15305](https://arxiv.org/abs/2605.15305)
**更新版本**: v4 (2026-05-20)

---

## 基础信息

**作者**: Caoliwen Wang, Minghao Guo, Siyuan Chen, Heng Zhang, Mengdi Wang, Xingyu Ni, Hanson Sun, Kunyi Wang, Zherong Pan, Kui Wu, Lingjie Liu, Yin Yang, Chenfanfu Jiang, Taku Komura, Wojciech Matusik, Peter Yichen Chen

**方向**: 粒子模拟 / 统一物理模拟器 / Transformer架构

** Subjects**: Graphics (cs.GR); Machine Learning (cs.LG)

---

## 核心创新

### 1. 统一粒子模拟器
- 基于单一Transformer架构
- 覆盖多种物理现象:
  - **Cloth** (布料)
  - **Elastic Solids** (弹性固体)
  - **Newtonian Fluids** (牛顿流体)
  - **Non-Newtonian Fluids** (非牛顿流体)
  - **Granular Materials** (颗粒材料)
  - **Molecular Dynamics** (分子动力学)

### 2. Prediction-Correction 设计
```
已知外力 → 显式预测器 → 中间状态（捕获外部驱动运动）
                                    ↓
                         学习校正器 → 残差更新
```

### 3. 三阶段校正器架构

#### Stage 1: Particle Tokenizer
- 编码局部粒子-粒子交互
- 粒子-边界交互
- 拓扑引导交互

#### Stage 2: Super-Token Encoder
- 层次化合并粒子token为紧凑super-token集合
- 交替自注意力和token合并
- 每层token数量减半

#### Stage 3: Super-Token Decoder
- 通过交叉注意力将super-token提升回粒子分辨率
- 预测每粒子位置和速度校正

### 4. 渐进式Token合并
- 降低连续encoder层的注意力成本
- decoder通过紧凑super-token集合通信
- 避免全粒子到粒子注意力

---

## 技术特点

### 可泛化性
- ✅ 泛化到未见过的材料
- ✅ 泛化到未见过的边界配置
- ✅ 泛化到未见过的初始条件
- ✅ 泛化到未见过的外力

### 下游应用
- 交互式控制（Interactive control）
- 逆设计（Inverse design）
- 从真实世界操控数据学习

---

## 与流体渲染的关系

### 粒子渲染类型
- 类型: 粒子渲染 / SPH相关
- 技术: Transformer-based learned simulator

### 适用场景
| 场景 | 适用性 |
|------|--------|
| 实时流体 | ✅ 通过神经网络实时推理 |
| 离流体渲染 | ✅ 物理准确 |
| 交互式流体 | ✅ 支持交互控制 |
| 多物理耦合 | ✅ 统一框架支持 |

### 性能预期
- 帧率: 实时（神经网络推理）
- GPU需求: 中等（Transformer模型）
- 精度: 可泛化

### 实现建议
- 着色器复杂度: 低（使用预训练模型）
- 管线要求: 标准神经网络部署管线
- 推荐度: ✅

---

## 关键公式/概念

### Prediction-Correction Framework
```
Position update: p_{t+1} = p_t + Δp_ext + Δp_correction
Velocity update: v_{t+1} = v_t + Δv_ext + Δv_correction
```

### Token Merging
```
N particles → N/2 super-tokens → N/4 super-tokens → ... → compact set
```

---

## 相关工作对比

| 方法 | 覆盖范围 | 统一性 | 实时性 |
|------|----------|--------|--------|
| WorldParticle | 6种物理 | ✅ 统一 | ✅ |
| GNS | 特定物理 | ❌ 分离 | ✅ |
| MeshGraphNets | 网格模拟 | ❌ 分离 | ✅ |
| 传统求解器 | 单物理 | ❌ 分离 | ⚠️ |

---

## 参考链接
- arXiv: https://arxiv.org/abs/2605.15305
- PDF: https://arxiv.org/pdf/2605.15305
- HTML: https://arxiv.org/html/2605.15305v4

---

*🌱 豆苗笔记 | 计算机图形学流体渲染专家*

# WorldParticle: Unified World Simulation via Transformer

## 论文信息
- **arXiv ID**: 2605.15305
- **发表时间**: 2026-05-14
- **URL**: https://arxiv.org/abs/2605.15305

## 核心贡献

### 概述
基于单一Transformer架构的统一粒子模拟器，建模多种物理现象。

### 支持的物理现象
1. **布料 (Cloth)**
2. **弹性固体 (Elastic Solids)**
3. **牛顿流体 (Newtonian Fluids)**
4. **非牛顿流体 (Non-Newtonian Fluids)**
5. **颗粒物质 (Granular Materials)**
6. **分子动力学 (Molecular Dynamics)**

### 技术架构: Prediction-Correction Design
```
Lagrangian粒子表示
    ↓
[显式预测器] → 外部力推进粒子
    ↓
[学习修正器] → 三阶段预测残差
    ├─ 粒子分词器 (Particle Tokenizer)
    ├─ 超级令牌编码器 (Super-Token Encoder)
    └─ 超级令牌解码器 (Super-Token Decoder)
```

### 关键创新
1. **统一表示**:共享Lagrangian粒子表示
2. **渐进式令牌合并**: 减少注意力计算成本
3. **零样本泛化**: 跨物理现象泛化

## 渲染方法
- **类型**: 粒子
- **技术**: Transformer + Lagrangian粒子

## 性能预期
- **帧率**: 实时推理
- **GPU需求**: 中等
- **内存占用**: 取决于粒子数量

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: Transformer推理管线
- **推荐度**: ✅✅✅

## 技术优势
- 无需针对每种现象设计专用求解器
- 可泛化到未见过的材料、边界配置、初始条件和外力
- 支持下游交互控制、逆向设计

## 应用场景
- 统一物理仿真
- 游戏引擎
- 实时流体模拟
- 多物理场耦合仿真
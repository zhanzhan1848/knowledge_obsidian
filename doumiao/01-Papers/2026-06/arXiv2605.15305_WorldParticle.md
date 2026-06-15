# WorldParticle: Unified World Simulation of Lagrangian Particle Dynamics via Transformer

## 论文信息
- **arXiv ID**: [2605.15305](https://arxiv.org/abs/2605.15305)
- **作者**: Caoliwen Wang, Minghao Guo, Siyuan Chen, et al.
- **日期**: 2026-05-14 (v1), 最新版本 v4 (2026-05-20)
- **Subjects**: Graphics (cs.GR), Machine Learning (cs.LG)
- **URL**: https://arxiv.org/abs/2605.15305

## 渲染方法
- **类型**: 粒子渲染
- **技术**: 
  - Transformer架构
  - 预测-校正设计 (Prediction-Correction)
  - 拉格朗日粒子表示 (Lagrangian Particle Representation)
  - 渐进式Token合并 (Progressive Token Merging)

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (数据驱动学习)
- **风格化支持**: 是

## 性能预期
- **帧率**: 实时推理
- **GPU 需求**: GPU训练/推理

## 核心创新点
1. **统一模拟器**: 基于单一Transformer架构模拟多种物理现象:
   - 布料 (Cloth)
   - 弹性固体 (Elastic Solids)
   - 牛顿/非牛顿流体 (Newtonian and Non-Newtonian Fluids)
   - 颗粒物质 (Granular Materials)
   - 分子动力学 (Molecular Dynamics)

2. **预测-校正设计**:
   - 显式预测器 (Explicit Predictor): 已知外力推进粒子
   - 学习校正器 (Learned Corrector): 预测残差位置和速度更新

3. **三阶段校正器**:
   - Particle Tokenizer: 编码粒子-粒子、粒子-边界、拓扑交互
   - Super-token Encoder: 分层合并token
   - Super-token Decoder: 交叉注意力恢复粒子级预测

4. **渐进式Token合并**: 每层减半token数量，降低注意力成本

5. **泛化能力**: 可泛化到未见过的材料、边界、初始条件和外力

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: Transformer/GPU
- **推荐度**: ✅ 适用于粒子系统渲染

## 关键词
- Particle Dynamics
- Transformer
- Lagrangian Particles
- Unified Simulator
- Physics-Based Animation

## 相关引用
```
@article{arxiv2605.15305,
  title={WorldParticle: Unified World Simulation of Lagrangian Particle Dynamics via Transformer},
  author={Wang, Caoliwen and Guo, Minghao and Chen, Siyuan et al.},
  year={2026},
  eprint={2605.15305},
  archivePrefix={arXiv}
}
```

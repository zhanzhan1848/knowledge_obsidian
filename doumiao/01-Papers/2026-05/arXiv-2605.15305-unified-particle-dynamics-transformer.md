# Unified Simulation of Lagrangian Particle Dynamics via Transformer

## 论文信息
- **arXiv ID**: [2605.15305](https://arxiv.org/abs/2605.15305)
- **日期**: 2026-05-14
- **作者**: Caoliwen Wang, Minghao Guo, Siyuan Chen, Heng Zhang, Mengdi Wang, Xingyu Ni, Hanson Sun, Kunyi Wang, Zherong Pan, Kui Wu, Lingjie Liu, Yin Yang, Chenfanfu Jiang, Taku Komura, Wojciech Matusik, Peter Yichen Chen
- **分类**: cs.GR, cs.LG
- **PDF**: [2605.15305.pdf](https://arxiv.org/pdf/2605.15305)

## 核心贡献
提出基于单一 Transformer 架构的学习型粒子模拟器，建模以下物理现象：
- 布料 (Cloth)
- 弹性固体 (Elastic Solids)
- 牛顿流体 (Newtonian Fluids)
- 非牛顿流体 (Non-Newtonian Fluids)
- 颗粒材料 (Granular Materials)
- 分子动力学 (Molecular Dynamics)

## 技术方法

### 1. Prediction-Correction Design
- **Predictor**: 显式预测器，根据已知外力推进粒子状态，生成中间状态
- **Corrector**: 学习型校正器，预测残差位置和速度更新

### 2. 三阶段 Corrector 架构
1. **Particle Tokenizer**: 编码局部粒子-粒子、粒子-边界、拓扑引导的交互
2. **Super-Token Encoder**: 通过交替自注意力和 token 合并，将粒子 token 分层合并为紧凑的 super-token 集合
3. **Super-Token Decoder**: 通过交叉注意力将 super-token 升采样回粒子分辨率

### 3. 渐进式 Token 合并
- 每层注意力成本通过将 token 数量减半来降低
- Decoder 通过紧凑的 super-token 集合通信，而非全粒子到粒子注意力

## 关键创新点
- **统一框架**: 单一架构处理多种物理现象，无需针对每种现象重新设计求解器
- **可泛化**: 可泛化到未见过的材料、边界配置、初始条件和外力
- **多功能应用**: 下游交互控制、逆向设计、从真实世界操控数据学习

## 渲染相关性
- ✅ **粒子渲染**: 统一粒子系统可应用于流体、烟雾、火焰的粒子表示
- ✅ **刚体-流体耦合**: 支持多物理场耦合模拟
- ✅ **实时模拟**: Transformer 架构支持 GPU 高效推理

## 标签
#粒子模拟 #Transformer #多物理场 #Lagrangian #流体模拟
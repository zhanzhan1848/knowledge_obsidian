# Application of Metric-Based Mesh Adaptation to Hypersonic Aerothermal Simulations Using US3D

## 论文信息
- **arXiv ID**: [2604.18899](https://arxiv.org/abs/2604.18899)
- **作者**: Dirk Ekelschot
- **日期**: 2026-04-20
- **类别**: physics.flu-dyn
- **报告号**: TM-20250011734

## 核心创新点
1. **度量基准网格自适应 (Metric-Based Mesh Adaptation)**
   - 使用温度解的 Hessian 作为指示器决定网格细化或粗化位置
   - 针对真实气体问题（real gas problems）

2. **高超声速流模拟优势**
   - 处理复杂几何形状的高灵活性
   - 保持与 block structured 方法相当的气动加热预测精度

## 研究方法

### 测试案例
1. **半球超音速流动**
   - 使用 mesh adaptation + 六面体代替棱柱边界层网格
   - 获得与传统方法相当的气动加热预测

2. **70°球锥大气进入Capsule**
   - CO2-N2 混合物高超声速流动
   - 对比 DPLR (DPLR = Data Parallel Line Relaxation) simulations
   - 8个 RCS (Reaction Control System) 喷嘴几何被纳入模拟

## 关键结论
- 度量基准网格自适应方法在处理 block structured 方法无法实现的复杂几何方面具有显著优势
- 在高超声速真实气体条件下预测精度与 DPLR 相当

## 数值方法
- **求解器**: US3D (多块结构网格 CFD 求解器)
- **自适应类型**: 指标驱动 (Hessian-based)
- **应用领域**: 高超声速气动加热，可压缩流

## 公式/技术细节
- Hessian 指示器用于捕获解的梯度变化剧烈区域
- 边界层网格中使用六面体替代棱柱

## 链接
- PDF: https://arxiv.org/pdf/2604.18899
- DOI: https://doi.org/10.48550/arXiv.2604.18899

## 标签
#CFD #mesh-adaptation #hypersonic #compressible-flow #US3D #mesh-refinement
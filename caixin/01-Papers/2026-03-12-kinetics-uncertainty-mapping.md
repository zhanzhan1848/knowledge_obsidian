# A Mapping-Based Projection of Detailed Kinetics Uncertainty onto Reduced Manifolds

**arXiv ID**: [2603.10381](https://arxiv.org/abs/2603.10381)  
**提交日期**: 2026-03-11  
**作者**: Vansh Sharma et al.  
**分类**: physics.comp-ph, physics.chem-ph, physics.data-an, physics.flu-dyn  

## 摘要
开发了一个两步框架，用于使用简化化学模型量化详细化学动力学模型参数引入的不确定性。通过在未燃混合状态下沿轨迹积分到规定的进程变量约束，在完全组分空间中唯一重建简化流形状态。

## 核心创新点
1. **两步UQ框架**：详细动力学 → 简化流形的不确定性映射
2. **轨迹重建方法**：在完全组分空间重建简化流形状态
3. **不确定性传播**：采样扰动速率系数并积分到目标状态
4. **空间分辨率**：提供空间分辨的、物理可解释的化学UQ

## 数值方法
### 第一步：流形重建
- 从未燃混合状态出发
- 沿轨迹积分
- 达到规定的进程变量约束

### 第二步：不确定性传播
- 从机理协方差矩阵采样扰动速率系数
- 对每个实现积分到目标状态
- 生成简化空间量的不确定性图

## 应用案例
1. **亚音速多管燃烧器**
   - 相互作用的射流火焰
   - 再循环区

2. **三维反应高速流道**
   - 高速反应流
   - 复杂三维几何

## 关键发现
### 不确定性特征
- **轨迹时间**（到达目标状态的时间）：数量级空间变化
- **平衡时间**：受混合、分层和停留时间影响

### 最大变异性区域
- **低-中温度区域**：与诱导和放热开始相关
- **远离化学计量条件**：分支相关化学放大敏感性

## 技术细节
### 化学动力学
- **详细机理**: 包含大量组分和反应
- **简化流形**: 降维后的化学状态空间
- **进程变量**: 表征反应进程的标量

### UQ 方法
- **输入**: 机理协方差矩阵
- **采样**: 蒙特卡洛采样
- **输出**: 空间分辨的不确定性图

## 相关工作
[[Chemical Kinetics]]
[[Uncertainty Quantification]]
[[Reduced Order Modeling]]
[[Combustion Modeling]]
[[Sensitivity Analysis]]

## 标签
#ChemicalKinetics #UncertaintyQuantification #Combustion #ReducedManifold #HighSpeedFlow #UQ

## 引用
```bibtex
@article{sharma2026kinetics,
  title={A mapping-based projection of detailed kinetics uncertainty onto reduced manifolds},
  author={Sharma, Vansh and others},
  journal={arXiv preprint arXiv:2603.10381},
  year={2026}
}
```

## 备注
- **可扩展性**: 为实际反应流模拟提供可扩展的化学UQ路线
- **物理可解释性**: 空间分辨的不确定性估计
- **工程应用**: 适用于复杂燃烧器件的高保真数值模拟

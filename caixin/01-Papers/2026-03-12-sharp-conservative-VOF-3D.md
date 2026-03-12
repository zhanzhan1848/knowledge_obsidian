# A 3D Sharp and Conservative VOF Method for Contact Line Dynamics with Hysteresis

**arXiv ID**: [2603.10045](https://arxiv.org/abs/2603.10045)  
**提交日期**: 2026-03-08  
**作者**: Tianyang Han et al.  
**分类**: math.NA, physics.flu-dyn  

## 摘要
提出了一种用于复杂几何上移动接触线模拟的尖锐守恒3D数值方法，在耦合几何VOF和嵌入边界框架内开发。首次建立了能够在任意复杂3D表面上准确解析接触线动力学的全几何守恒VOF方案。

## 核心创新点
1. **修正的VOF平流和重构方案**：专为包含液、气、固相的混合单元设计
2. **重分布平流策略**：完全消除CFL约束，同时保持局部和全局体积守恒
3. **3D接触角施加技术**：基于高度函数框架，结合抛物面预拟合过程
4. **接触角迟滞建模**：捕捉更真实的润湿动力学

## 数值方法
### VOF 方法
- **类型**: 几何 VOF (Volume-of-Fluid)
- **守恒性**: 严格局部质量守恒
- **界面重构**: 基于高度函数
- **边界处理**: 嵌入边界方法

### 接触线处理
- **接触角施加**: 抛物面预拟合 + 高度函数
- **曲率估计**: 鲁棒的不规则表面曲率计算
- **迟滞效应**: 接触角迟滞模型

## 稳定性分析
- **CFL 条件**: 通过重分布策略完全消除小切割单元的时间步长限制
- **守恒性**: 局部和全局体积守恒
- **复杂边界**: 支持任意形状嵌入边界

## 应用场景
- 移动接触线动力学
- 复杂3D表面润湿
- 多相流界面追踪
- 微流体器件

## 技术细节
### 混合单元处理
```
液-气-固三相共存单元
  ↓
修正VOF平流方案
  ↓
严格质量守恒
```

### 重分布策略
- 解决小切割单元时间步长限制
- 保持守恒性
- 支持复杂几何

## 相关工作
[[VOF Method]]
[[Contact Line Dynamics]]
[[Embedded Boundary]]
[[Multiphase Flow]]
[[Surface Tension]]

## 标签
#VOF #ContactLine #MultiphaseFlow #ConservativeScheme #ComplexGeometry #Hysteresis

## 引用
```bibtex
@article{han2026vof,
  title={A 3D sharp and conservative VOF method for modeling the contact line dynamics with hysteresis on complex boundaries},
  author={Han, Tianyang and others},
  journal={arXiv preprint arXiv:2603.10045},
  year={2026}
}
```

## 备注
- **首次**: 全几何守恒VOF方案处理3D复杂表面接触线
- **优势**: 无CFL限制、严格守恒、鲁棒性强
- **验证**: 多个挑战性基准测试

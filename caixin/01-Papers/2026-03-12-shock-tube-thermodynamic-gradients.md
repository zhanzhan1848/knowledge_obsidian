# Thermodynamic Non-Uniformities Behind Incident and Reflected Shocks in a Single-Diaphragm Shock Tube

**arXiv ID**: [2603.10706](https://arxiv.org/abs/2603.10706)  
**提交日期**: 2026-03-11  
**作者**: Touqeer Anwar Kashif et al.  
**分类**: physics.flu-dyn  

## 摘要
结合实验诊断和数值模拟量化单膜激波管中的热力学梯度。使用 CONVERGE CFD 中实现的耦合 RANS-LES 框架，包含真实的膜片开启剖面。

## 核心创新点
1. **耦合 RANS-LES 框架**：结合实验和数值方法
2. **真实膜片开启**：考虑实际膜片破裂过程
3. **多气体验证**：氩气、氮气、二氧化碳
4. **量化非均匀性**：轴间和径向梯度分析

## 数值方法
### CFD 框架
- **求解器**: CONVERGE CFD
- **湍流模型**: 耦合 RANS-LES
- **膜片建模**: 真实开启剖面

### 验证方法
- 压力历史测量
- 激波速度剖面
- 三种测试气体（Ar, N₂, CO₂）

## 应用领域
- 化学动力学研究
- 点火延迟时间测量
- 高温高压实验
- 激波管实验设计

## 关键发现
### 氩气（Ar）
- 近均匀核心流
- 适度轴向梯度

### 氮气和二氧化碳（N₂, CO₂）
- 显著轴向梯度
- 反射激波与边界层相互作用强烈

## 技术细节
### 激波衰减机制
1. 激波形成过程
2. 激波衰减
3. 反射激波与边界层相互作用
4. 测试气体依赖性差异

### 非均匀性来源
- 轴向梯度
- 径向梯度
- 边界层效应
- 激波-边界层相互作用

## 相关工作
[[Shock Tube]]
[[RANS-LES]]
[[Chemical Kinetics]]
[[High Temperature Flow]]
[[Boundary Layer Interaction]]

## 标签
#ShockTube #RANS-LES #ChemicalKinetics #Thermodynamics #HighTemperature #BoundaryLayer

## 引用
```bibtex
@article{kashif2026shock,
  title={Thermodynamic Non-Uniformities Behind Incident and Reflected Shocks in a Single-Diaphragm Shock Tube},
  author={Kashif, Touqeer Anwar and others},
  journal={arXiv preprint arXiv:2603.10706},
  year={2026}
}
```

## 备注
- **工程价值**: 为激波管实验中测试气体均匀性量化提供基础
- **应用**: 改善非理想流动条件下点火数据的解释
- **气体差异**: 不同测试气体表现出显著不同的梯度特性

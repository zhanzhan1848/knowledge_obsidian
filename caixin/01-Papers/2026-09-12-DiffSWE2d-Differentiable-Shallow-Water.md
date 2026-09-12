# DiffSWE2d: A Differentiable Shallow Water Equations Solver

**arXiv**: [2609.11426](https://arxiv.org/abs/2609.11426)  
**Author**: Zhonghou Xu  
**Category**: physics.flu-dyn, physics.geo-ph  
**Published**: 2026-09-10  
**Code**: https://github.com/ZhonghouXu/DiffSWE2d

## 创新点

### 核心问题
传统浅水方程（SWE）求解器在求解逆优化问题时计算成本高昂——需要通过重复前向模拟来估计梯度。

### 关键创新
1. **可微分求解器**：在 PyTorch 中实现，将时间步动物理建模为可微分计算图，梯度可直接反向传播
2. **自动微分**：利用 PyTorch 自动微分能力，支持 end-to-end 梯度优化
3. **应用场景**：海啸波形反演（tsunami waveform inversion），通过梯度优化推断模型输入

## 控制方程 - 浅水方程（2D）

$$\frac{\partial h}{\partial t} + \frac{\partial (hu)}{\partial x} + \frac{\partial (hv)}{\partial y} = 0$$

$$\frac{\partial (hu)}{\partial t} + \frac{\partial}{\partial x}\left(hu^2 + \frac{1}{2}gh^2\right) + \frac{\partial (huv)}{\partial y} = -gh\frac{\partial B}{\partial x} - f hv$$

$$\frac{\partial (hv)}{\partial t} + \frac{\partial (huv)}{\partial x} + \frac{\partial}{\partial y}\left(hv^2 + \frac{1}{2}gh^2\right) = -gh\frac{\partial B}{\partial y} + f hu$$

其中 $h$ = 水深，$u,v$ = 流速，$g$ = 重力加速度，$B$ = 地形的底部高程，$f$ = 科里奥利参数

## 数值方法
- **离散化**：有限差分法
- **时间推进**：龙格-库塔（Runge-Kutta）方法
- **框架**：PyTorch（自动微分）

## 应用场景
1. **洪水建模**：地形不确定性下的洪水预测
2. **海啸反演**：从观测波形推断海底位移
3. **数据同化**：将测量数据融入数值模型

## 计算优势
- 梯度计算无需有限差分扰动（ adjoint-free）
- 支持 GPU 加速
- 与深度学习框架无缝集成

## 相关方法
- [[有限差分法]]
- [[可微分物理]]
- [[伴随方法]]
- [[神经网络PDE求解器]]

## 标签
#浅水方程 #可微分求解器 #PyTorch #反问题 #海啸 #洪水 #CFD #机器学习

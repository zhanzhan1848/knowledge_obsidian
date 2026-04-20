# Gaussian Fluids: A Grid-Free Fluid Solver based on Gaussian Spatial Representation

## 基本信息
- **会议**: SIGGRAPH 2025
- **类型**: Conference Paper (SIG/TOG)
- **作者**: Jingrui Xing, Bin Wang, Mengyu Chu, Baoquan Chen
- **链接**: https://dl.acm.org/action/showFmPdf?doi=10.1145/3721238

## 核心创新点

### 问题背景
传统流体求解器面临的问题：
- **Eulerian 方法**：使用固定网格，存在"数值粘度"问题，人工阻尼会平滑掉细节
- **Lagrangian 方法**：使用粒子，可能在精度和捕捉精细解结构方面存在困难
- **混合方法**：在网格和粒子之间传输数据时可能引入误差

### 核心贡献
提出**基于高斯空间表示的无网格流体求解器**：
- 借鉴 3D Gaussian Splatting 的成功
- 用高斯来表示流体场
- 每个高斯像一个椭球体，带有颜色值和不透明度

### 技术方法
基于 **Navier-Stokes 方程**（简化版，粘度项忽略，即 ν=0）：
- 不可压缩约束：∇ · u = 0
- 无网格表示避免了传统方法的离散化问题
- 利用高斯的表达力捕捉流体的丰富混沌特性

### 方程
$$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla) \mathbf{u} = -\frac{1}{\rho} \nabla p + \mathbf{f}$$

## 渲染方法
- **类型**: 体积渲染 / 粒子渲染
- **技术**: 高斯空间表示、无网格求解器

## 性能优势
- 避免数值粘度
- 高细节捕捉
- 计算效率高

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: GPU 高斯渲染
- **推荐度**: ✅✅

## 标签
#fluid-simulation #gaussian-splatting #grid-free #SIGGRAPH2025 #particle-system #Navier-Stokes

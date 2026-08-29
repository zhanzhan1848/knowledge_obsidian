# How well can Diffusion Models learn Lagrangian-Tracer Statistics in Non-reciprocal Turbulence?

- **arXiv**: [2608.27378](https://arxiv.org/abs/2608.27378)
- **Published**: 2026-08-27
- **Categories**: physics.flu-dyn
- **Authors**: Pratyush Jha, Biswajit Maji, Rahul Pandit
- **Pages**: 29 pages, 16 figures

## 核心问题

生成式 AI（扩散模型）能否学习**非互易二元流体湍流**中拉格朗日示踪粒子的统计特性？

## 研究对象：非互易 Cahn-Hilliard-Navier-Stokes (NRCHNS)

### 模型方程
$$ \frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nu \nabla^2 \mathbf{u} + \lambda \nabla \phi $$
$$ \frac{\partial \phi}{\partial t} + \mathbf{u} \cdot \nabla \phi = M \nabla^2 \left( \phi^3 - \phi - \gamma \nabla^2 \phi \right) $$
其中 $\lambda$ 为非互易参数。

## 方法

1. **伪谱 DNS**：2D NRCHNS 模型的直接数值模拟
2. **拉格朗日示踪粒子**：跟踪加速度、速度分量 PDF
3. **生成扩散模型**：合成拉格朗日轨迹

## 关键发现

### 速度分量 PDF：双峰分布
- **完全不同于** 2D 流体湍流！典型湍流速度 PDF 接近高斯
- 与车道状结构（lane-type structures）相关

### 拉格朗日多尺度特性
- 首次在非互易流体力学中表征 Lagrangian 多尺度
- 分析：Lagrangian 速度增量、结构函数、平坦度

### 扩散模型评估
- 可部分学习 Lagrangian 统计
- 在非互易系统中应用 AI 仍有挑战

## 物理机制

**车道形成（Lane formation）**：非互易性驱动系统自发组织成车道状结构 → Eulerian 速度分量 PDF 双峰 → Lagrangian 统计异常

## 评估

✅ **推荐关注** — 非互易流体力学是新兴前沿，AI 方法与物理湍流交叉有重要意义。

## 相关链接
- PDF: https://arxiv.org/pdf/2608.27378v1

---
*分类: #湍流 #非互易流体 #Cahn-Hilliard #扩散模型 #拉格朗日 #DNS*

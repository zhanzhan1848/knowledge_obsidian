# Surface Gravity Wave-Mean Flow Interaction (Part I): Reduced Wave Equations

**arXiv**: [2609.11587](https://arxiv.org/abs/2609.11587)  
**Authors**: Basile Gallet, Alexandre Tlili  
**Category**: physics.flu-dyn, physics.ao-ph  
**Published**: 2026-09-10

## 创新点

### 核心问题
深水表面重力波在背景流上传播，当背景流空间尺度与波长相当时的处理。当背景流速与波的Stokes漂流速度相当时，需要考虑波-流耦合。

### 关键创新
1. **"等效可解性条件" 方法**（Equivalent Solvability Condition）：构建简化方程，要求简化方程与原系统在多尺度展开下共享相同的主导阶解和一阶可解性条件
2. **降维**：将完整3D问题转化为2D波场简化方程
3. **Schrödinger型方程**：窄带波在3D背景流上的简化方程——只涉及背景流的近表面涡度
4. **计算效率**：消除时间分辨率快波周期的需求，描述波场在背景流慢对流时间尺度上的演化

## 数学框架

### 多尺度展开
- 快时间：$T = \epsilon t$（波周期）
- 慢时间：$\tau = \epsilon^2 t$（背景流演化）
- 空间：$X = \epsilon x$（缓变调制）

### 简化波方程（2D）
$$\frac{\partial A}{\partial \tau} + \bar{U}\frac{\partial A}{\partial X} + \frac{i}{2}k''^{-1}\frac{\partial^2 A}{\partial X^2} + i\bar{\omega}' A = 0$$

或 Schrödinger 形式：
$$i\frac{\partial \psi}{\partial \tau} = -\frac{1}{2k}\frac{\partial^2 \psi}{\partial X^2} + \mathcal{V}(X)\psi$$

其中 $\mathcal{V}(X)$ 与近表面涡度相关。

## 数值验证
- 弱散射：波包被有组织流斑弱散射的解析解
- 强散射：波包被无组织流斑强散射的数值解

## 相关论文
- Part II（2609.11631）：双向耦合与波-波相互作用

## 标签
#表面重力波 #波-流耦合 #多尺度展开 #Stokes漂流 #CFD #流体力学

# Volumetric Inverse Rendering via Neural Radiative Transfer

## 论文信息
- **arXiv ID**: [2607.13695](https://arxiv.org/abs/2607.13695)
- **发表日期**: 2026-07-15
- **会议**: Eurographics/CGF (Computer Graphics Forum)
- **DOI**: https://doi.org/10.1111/cgf.70541
- **作者**: Ntumba Elie Nsampi 等

## 核心创新点

### 问题
- 体积逆渲染：从图像中恢复参与介质的光学属性
- 现有方法问题：
  - 可微分随机光照传输模拟计算量大
  - 简化模型无法捕捉全局光照

### 解决方案：神经辐射传输
提出一种将物理完整光传输与通用神经优化相结合的公式：

1. **神经场表示**
   - 介质的光学属性表示为神经场
   - 完整光场表示为神经场
   - 通过联合优化过程估计参数

2. **全局光照约束**
   - 通过辐射传输方程(RTE)的局部微分形式推导残差目标
   - 沿主视线进行体积渲染项补偿低频偏差

3. **可重建参数**
   - 空间变化散射 (spatially varying scattering)
   - 颜色分解吸收 (color-resolved absorption)
   - 相位函数 (phase function)

## 技术框架

```
输入: 多视角图像
    ↓
神经场初始化 (介质光学属性 + 光场)
    ↓
联合优化循环
    ├── 辐射传输方程约束 (物理先验)
    ├── 体积渲染损失 (图像重建)
    └── 全局光照 enforcement
    ↓
输出: 恢复的光学属性参数
```

### 核心公式
**辐射传输方程 (RTE)**:
$$L(\mathbf{x}, \omega) = L_e(\mathbf{x}, \omega) + \int_0^d \sigma_t(\mathbf{x}') \cdot L_i(\mathbf{x}', \omega) \cdot e^{-\int_0^{s'} \sigma_t(\mathbf{x}'')\,ds''}\,ds'$$

## 应用场景

### 1. 体积介质重建
- 烟雾、火焰、雾、霾
- 生物组织散射
- 流体介质的光学属性估计

### 2. 生成模型学习
- 相同框架支持学习具有物理光学属性的参与介质生成模型
- 在全局光照下进行物理约束生成

## 渲染方法分类
- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Neural Radiative Transfer + Ray Marching
- **光照模型**: 完整光传输 (Full light transport with global illumination)

## 可行性分析

### 逼真度 ⭐⭐⭐⭐⭐
- 完整物理光传输，全局光照效果
- 支持空间变化参数

### 风格化支持
- 有限，需物理参数约束

### 性能预期
- 离线渲染为主
- 神经优化需要多次前向传递

### 实现难度
- 着色器复杂度: 高
- 需实现神经场 + RTE约束

### 推荐度: ✅ 值得深入研究

## 关键引用
> "We propose a formulation that reconciles physically complete light transport with general-purpose neural optimization."

## 相关技术
- [[体积渲染]]
- [[参与介质渲染]]
- [[神经渲染]]
- [[全局光照]]

## 来源
- 领域: cs.GR (Computer Graphics)
- 会议: Eurographics Symposium on Rendering 2026

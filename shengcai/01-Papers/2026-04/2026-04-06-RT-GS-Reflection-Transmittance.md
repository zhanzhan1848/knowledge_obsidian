# Gaussian Splatting with Reflection and Transmittance Primitives

## 元信息
| 标题 | Gaussian Splatting with Reflection and Transmittance Primitives |
| 作者 | Kunnong Zeng |
| 链接 | [arXiv:2604.00509](https://arxiv.org/abs/2604.00509) |
| 日期 | 2026-04-01 |
| 标签 | #渲染 #3DGS #光线追踪 #镜面反射 #透明物体 |

## 核心贡献
1. 提出 RT-GS，统一框架整合 microfacet 材质模型和光线追踪
2. 分别使用 Gaussian 基元处理反射和透射
3. 可模拟远处反射和透明物体后的场景重建

## 技术方案

### 问题
- 传统 3DGS 难以同时建模：
  - 镜面反射 (specular reflections)
  - 半透明表面后的透射 (transmittance)

### 方法
```python
# 核心思路
RT-GS = 微面元材质模型 + 光线追踪 + 3DGS

# 分离 Gaussian 基元
- 反射 Gaussian: 远处镜面反射
- 透射 Gaussian: 透明表面后物体
```

### 可微光线追踪框架
- 获取镜面反射和透射外观
- 联合优化所有组件

### 实验结果
- 在复杂环境中成功生成反射
- 恢复透明表面后的物体
- 在镜面光交互显著的场景中优于先前方法

## 公式
```math
L_o = \int_{\Omega} f_r(\omega_i, \omega_o) L_i(\omega_i) (\omega_i \cdot n) d\omega_i
```

## 局限性
- 计算成本较高
- 实时应用需进一步优化

## 相关工作
- 3DGS (Kerbl et al., 2023)
- 镜面反射建模

## 标签
#3DGS #光线追踪 #镜面反射 #透明物体 #材质模型

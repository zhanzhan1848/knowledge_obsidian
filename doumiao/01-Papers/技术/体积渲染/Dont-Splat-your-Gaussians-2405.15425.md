# Don't Splat your Gaussians

> Volumetric Ray-Traced Primitives for Modeling and Rendering Scattering and Emissive Media

## 论文信息

| 属性 | 值 |
|------|-----|
| **arXiv** | [2405.15425](https://arxiv.org/abs/2405.15425) |
| **会议** | ACM Transactions on Graphics (SIGGRAPH 2025) |
| **DOI** | 10.1145/3711853 |
| **作者** | Jorge Condor, Simon Speierer, Lukas Bode, Anton B. Bozic, Steven Green, Piotr Didyk, Adrian Jarabo |
| **项目页** | https://arcanous98.github.io/projectPages/gaussianVolumes |

## 核心创新

### 问题背景
- 现有 3D Gaussian Splatting (3DGS) 方法依赖 splatting 近似，无法准确处理体积散射
- 体素网格方法内存消耗大，缺乏适应性
- 缺乏统一的表面+体积联合表示

### 核心思想
将散射/自发光介质建模为**简单核函数(primitives)的混合**，使用**光线追踪**而非 splatting 进行体积渲染。

### 关键技术

#### 1. 核函数闭式解
为不同核函数推导了：
- **透射率 (Transmittance)** 闭式解
- **自由飞行距离采样 (Free-flight Distance Sampling)** 闭式解

#### 2. 支持的核函数
| 核函数 | 特点 |
|--------|------|
| Gaussian | 传统核，与 3DGS 兼容 |
| **Epanechnikov** | 新引入，计算更高效 |
| 其他球谐核 | 灵活性高 |

#### 3. 体积路径追踪集成
- 可插入任意支持体积介质的路径追踪器
- 支持散射 (scattering)、重光照 (relighting)、复杂相机模型

## 技术公式

### 透射率 (Transmittance)
```
T(s→t) = exp(-∫σₜ(s)ds)
```

核函数的闭式解：
```
T_Gaussian(r, s, σ) = erfc( (s - r) / (σ√2) ) - erfc( (t - r) / (σ√2) )
```

### 自由飞行距离采样
```python
# 逆变换采样
u ~ Uniform(0,1)
s = F⁻¹(u)  # 使用闭式反函数
```

## 应用场景

### 1. 前向渲染
- 烟雾体积渲染
- 体积光效果 (God rays)
- 火/爆炸渲染
- 参与介质渲染

### 2. 逆渲染
- 从图像/焦栈重建体积介质
- 医学 CT 层析重建
- 透射成像

### 3. 辐射场优化
- 替代 NeRF / 3DGS 进行体积场景重建
- 烟雾/火场景的动态辐射场

## 与流体渲染的关系

### 烟雾/火渲染
- 流体模拟输出 → 粒子/体素数据
- 粒子转换为 Gaussian 核混合
- 体积光线追踪渲染

### 技术优势
| 传统方法 | 本文方法 |
|----------|----------|
| 体素网格 (内存大) | Gaussian 基元 (紧凑) |
| 数值导数 | 解析解 |
| 固定分辨率 | 自适应分辨率 |

## 代码资源

项目页提供补充材料，包括：
- 体积路径追踪器实现
- 核函数库
- 逆渲染优化器

## 适用场景

| 场景 | 推荐度 |
|------|--------|
| 电影级烟雾渲染 | ⭐⭐⭐⭐⭐ |
| 体积光效果 | ⭐⭐⭐⭐⭐ |
| 火/爆炸渲染 | ⭐⭐⭐⭐ |
| 实时烟雾 | ⭐⭐⭐ |
| 逆体积渲染 | ⭐⭐⭐⭐⭐ |

## 延伸阅读

- [[Gaussian-Fluids-2405.18133]] - 流体模拟，可与本文结合
- [[RT-GS-2604.00509]] - 反射/透射 Gaussian，可与体积渲染结合

---

*关键词: Volume Rendering, Gaussian Kernel, Ray Tracing, Scattering Media, SIGGRAPH 2025*

# SSD-GS: Scattering and Shadow Decomposition for Relightable 3D Gaussian Splatting

**arXiv**: [2604.13333](https://arxiv.org/abs/2604.13333)
**时间**: 2026-04-14
**类别**: cs.CV, cs.GR (交叉)
**发表**: ICLR 2026
**代码**: https://github.com/irisfreesiri/SSD-GS

---

## 核心问题

物理精确 relighting 中，准确建模光-材质交互对忠实重现外观至关重要。

**现有方法局限**:
- 现有 3DGS-based relighting 方法采用粗粒度阴影分解
  - 只建模漫反射 + 镜面反射
  - 或依赖神经网络近似阴影和散射
- 有限保真度和物理可解释性
- 对各向异性金属和透明材质表现差

---

## 核心创新：SSD-GS

将反射分解为**四个分量**：
1. **Diffuse** — 漫反射
2. **Specular** — 镜面反射
3. **Shadow** — 阴影
4. **Subsurface Scattering (SSS)** — 次表面散射

### 三大关键技术

#### 1. 可学习偶极子散射模块 (Subsurface Scattering)
- 基于物理的次表面散射传输
- 处理透明/半透明材质的光传输

#### 2. 遮挡感知阴影公式
- 结合可见性估计
- 细化网络 refinement network
- 物理可解释的阴影建模

#### 3. 增强各向异性 Fresnel 镜面模型
- 各向异性菲涅尔反射
- 处理金属和透明材质

#### 渐进式训练策略
- 训练过程中渐进集成所有分量
- 有效解耦光照和材质属性
- 即使在未见光照条件下也能泛化

---

## 技术细节

### 架构
```
3D Gaussians → Diffuse + Specular + Shadow + SSS
                    ↓
              Progressive Integration during Training
                    ↓
           Disentangled Lighting + Material Properties
```

### 各分量实现
- **SSS**: 偶极子模型 (dipole model)，用于次表面光传输
- **Shadow**: 可见性估计 + 神经网络细化
- **Specular**: 各向异性 Fresnel

### 训练策略
- 先训练基础分量
- 渐进添加 SSS 和 Shadow
- 避免分量间干扰

### 数据集验证
- OLAT (One Light At a Time) dataset
- 各种材质类型
- 新型光照条件泛化测试

---

## 实验结果

### 定量
- 超越 prior methods 的量化指标
- 更好的感知质量 (perceptual quality)

### 定性
- 各向异性金属准确渲染
- 透明材质真实重现
- 阴影细节保留

### 应用
- 可控光源编辑
- 交互式场景 relighting

---

## 流体渲染价值

### 次表面散射与流体
- **牛奶、果汁**：典型 SSS 流体材质
- **皮肤/蜡质**：表面下散射
- **糖水、油**：透明液体的 SSS

### 分解方法的价值
- 将复杂反射分解为物理可解释分量
- 可针对性调参
- 支持物理精确渲染

### 3DGS + 流体的可能性
- 3DGS 已被用于实时流体渲染
- SSD-GS 提供物理精确材质模型
- 结合两者 → 高质量实时流体 relighting

### 技术借鉴
- 偶极子 SSS → 液体材质渲染
- 四分量分解 → 流体材质参数化
- 渐进训练 → 流体渲染管线模块化

---

## 与流体渲染的关系

| 方面 | 关系 |
|------|------|
| 次表面散射 | 直接相关（液体材质） |
| 透明材质 | 直接相关（水面） |
| 物理精确 relighting | 直接相关（流体光照） |
| 3DGS | 间接（实时流体渲染平台） |
| 各向异性 Fresnel | 直接相关（金属流体、油面） |

---

## 参考价值

- ⭐⭐⭐ 液体材质渲染必读
- ⭐⭐⭐ 3DGS + 物理材质前沿
- ⭐⭐ 流体 relighting 重要参考

---

*由 doumiao (豆苗) 整理 | 2026-04-18*

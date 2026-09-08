# VersaGauss: 多相流体-刚体-颗粒统一动力学框架

## 📋 基本信息
- **arXiv**: [2608.28069](https://arxiv.org/abs/2608.28069)
- **作者**: Ruijie Su et al.
- **发布日期**: 2026-08-28
- **类别**: cs.CV / 体积渲染 / 粒子系统
- **代码**: https://github.com/Elowen-surj/VersaGauss

---

## 🎯 核心问题
当前 3D Gaussian 表示方法主要关注：
1. 固体物体的物理动态生成
2. 单相碰撞交互

**问题**: 无法处理**多相交互**（如流体-刚体、流体-颗粒等）

---

## 💡 核心贡献

### 1. CMPM (Coupled Multiphase Point Method)
- 统一建模多相材料交互
- 支持：fluid, rubber, sand, snow 等
- 谐波插值实现 realistic fluid rendering

### 2. Particle Pruning Algorithm
- 优化 Gaussian 核分布
- 自适应粒子数量调整

### 3. Gaussian Evolution Strategy
- 流体渲染的动态演化
- 保持视觉一致性

### 4. 统一框架
```
输入：几张图片
    ↓
3D Gaussian 重建
    ↓
物理驱动动态生成
    ↓
实时渲染
```

---

## 🔧 技术细节

### CMPM 公式
多相点方法核心：
- 每个相（phase）维护独立点集
- 相间耦合通过势函数建模
- 流体渲染使用 Gaussian Splatting

### 谐波插值
```python
# 核心：harmonic interpolation within CMPM
# 实现流体渲染的平滑过渡
```

### 3DGS 兼容性
- 保持 3D Gaussian Splatting 的实时渲染能力
- 支持 WebGL 实时查看器

---

## 📊 性能指标
- **GPU 加速**: 是
- **实时性**: 实时渲染潜力
- **材料支持**: 5+ 种（fluid, rubber, sand, snow...）

---

## 🆚 vs 其他方法

| 特性 | VersaGauss | 传统 SPH | 传统 3DGS |
|------|------------|----------|------------|
| 多相交互 | ✅ | ❌ | ❌ |
| 实时渲染 | ✅ | ❌ | ✅ |
| 物理真实性 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | N/A |
| 实现复杂度 | 中 | 高 | 低 |

---

## 🎨 适用场景
- 游戏引擎流体效果
- 电影级流体-刚体交互
- 多材料产品可视化
- 实时物理仿真

---

## 📝 备注
- 论文为 cs.CV 类别，但技术直接应用于流体渲染
- GitHub 已开源：https://github.com/Elowen-surj/VersaGauss

---

*🌱 Doumiao 2026-09-08*

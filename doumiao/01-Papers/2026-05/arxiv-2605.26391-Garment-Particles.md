# Garment Particles: 2D-3D 对称服装表示

## 论文信息
- **arXiv**: [2605.26391](https://arxiv.org/abs/2605.26391)
- **日期**: 2026-05-25 (v2: 2026-05-27)
- **作者**: Kiyohiro Nakayama et al.
- **主题**: 服装生成与编辑

---

## 核心贡献

### 1. 5D 点云表示: Garment Particles
- 联合编码 **2D 纸样**和 **3D 几何**
- 5D = 3D 位置 + 2D 纸样坐标
- 点云表示灵活性高

### 2. Garment Particles Flow (GPF)
- **修正流 (Rectified Flow)** 框架
- 支持多种输入:
  - 文本 (text)
  - 图像 (image)
  - 草图 (sketch)
- 多种编辑操作:
  - 2D 纸样编辑
  - 3D 几何编辑
  - 插值 (interpolation)

### 3. Particles-to-Pattern Flow
- 将生成的服装粒子转换为**曲边模式**
- 用于仿真

### 4. 数据驱动
- 多数据集验证
- SOTA 生成质量

---

## 技术方法

### 表示优势
- 统一表示 2D/3D
- 解耦设计空间
- 支持各种编辑操作

### 框架特点
- 扩散后验采样
- 条件生成
- 跨模态编辑

---

## 渲染相关性

### 粒子系统
- 5D 点云可视为高级粒子系统
- 粒子 → 渲染管线直接映射
- 支持各种编辑操作

### 与流体渲染关联
- 粒子系统表示可泛化
- 纸样编码技术可用于参数化流体表示

### 标签
#garment-generation #particle-system #diffusion #2D-3D #pattern

---

*整理: Doumiao - 2026-05-29*
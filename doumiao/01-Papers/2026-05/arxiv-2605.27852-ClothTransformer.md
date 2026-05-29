# ClothTransformer: 统一隐空间 Transformer 布料仿真

## 论文信息
- **arXiv**: [2605.27852](https://arxiv.org/abs/2605.27852)
- **日期**: 2026-05-27
- **作者**: Yu Zhang et al.
- **主题**: 可扩展布料仿真

---

## 核心贡献

### 1. 统一 Transformer 架构
单一模型处理多种场景:
- 人体驱动服装 (body-driven garments)
- 机器人操控 (robotic manipulation)
- 自由落体碰撞 (free-fall collisions)

**误差降低**: 比 SOTA 方法低 **4-9 倍**

### 2. 隐空间公式
- 将任意分辨率网格压缩为**固定尺寸隐 token**
- 时间动态计算与网格分辨率解耦
- 可扩展性强

### 3. 高质量数据集
- ~**493.4 万帧**数据
- 涵盖三种设置
- **穿透-free** (penetration-free)

### 4. 可微连续碰撞检测 (CCD)
- 抑制穿透伪影
- 支持端到端训练

---

## 技术方法

### 框架: ClothTransformer
- 将布料仿真重新定义为**隐空间自回归序列建模**
- 利用 Transformer 捕捉时空依赖

### 关键特性
- 无需针对单一场景的专门化
- 内在解耦网格离散化
- 鲁棒碰撞处理

---

## 渲染相关性

### 粒子/布料仿真 → 渲染管线
- 布料仿真是流体渲染的重要子领域
- 网格/粒子表示可直接用于渲染
- 碰撞处理技术可迁移到其他粒子系统

### 相关技术
- 粒子系统仿真
- 网格处理
- 碰撞检测与响应

### 标签
#cloth-simulation #transformer #particle-system #collision-detection

---

*整理: Doumiao - 2026-05-29*
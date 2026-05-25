# 每日流体渲染领域论文搜索报告

> **日期**: 2026-05-25  
> **时间**: 14:09 UTC  
> **搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH/SIGGRAPH Asia 2026

## 搜索关键词
- fluid rendering
- water rendering
- smoke rendering
- fire simulation
- ocean rendering
- particle system
- volume rendering

---

## 搜索结果摘要

### arXiv cs.GR (2026-05-24 ~ 2026-05-25)

共检查约 50 篇新提交的 cs.GR 论文，**未发现直接针对流体渲染/烟雾/水/火焰模拟的论文**。

### 相关物理仿真论文

虽然没有直接流体渲染论文，但发现以下相关物理仿真/渲染论文值得关注：

#### 1. YASPS: Symbolic Framework for IPC Simulation ⭐ SIGGRAPH 2026
- **ID**: arXiv:2605.23088
- **标题**: A Symbolic Framework for Extensible, High-Performance IPC Simulation
- **作者**: (Authors fromSiggraph 2026)
- **领域**: 可扩展IPC物理仿真 / GPU计算
- **相关度**: ⭐⭐⭐⭐ (IPC方法可应用于流体接触边界仿真)
- **创新点**:
  - JOIN/UNION 关系操作符抽象
  - 结构化稀疏Hessian存储
  - JIT编译CUDA内核
  - 近10x CG迭代加速
- **技术**: IPC (Incremental Potential Contact), KKT系统, 块稀疏压缩
- **链接**: https://arxiv.org/abs/2605.23088

#### 2. Closing Trajectories: Koopman Surrogates for Cyclic Animation ⭐
- **ID**: arXiv:2605.23462
- **标题**: Equation-Free Cyclic Animation via Koopman Surrogates
- **作者**: Siyuan Chen
- **领域**: 循环动画 / 物理仿真
- **相关度**: ⭐⭐⭐ (浅水模拟相关)
- **创新点**:
  - Koopman代理模型识别
  - Fourier参数化时变控制力
  - 硬时间周期约束
  - 应用: N体系统、cloth、软体、**浅水**等
- **链接**: https://arxiv.org/abs/2605.23462

#### 3. BodyReLux: Full-Body Video Relighting ⭐ SIGGRAPH 2026 Journal
- **ID**: arXiv:2605.21766
- **标题**: Temporally Consistent Full-Body Video Relighting
- **作者**: Ma Li (Eyeline Labs)
- **领域**: 视频重光照 / 基于扩散模型的渲染
- **相关度**: ⭐⭐ (流体渲染可参考的光照技术)
- **创新点**:
  - OLAT + 动态性能捕获混合数据集
  - 光源token化条件控制
  - Masked attention支持动态光照
- **链接**: https://arxiv.org/abs/2605.21766 | https://eyeline-labs.github.io/bodyrelux/

#### 4. TelePhysics: Physics-Grounded Scene Generation ⭐
- **ID**: arXiv:2605.20290
- **标题**: Physics-Grounded Multi-Object Scene Generation from a Single Image with Real-Time Interaction
- **作者**: Yabo Chen
- **领域**: 物理场景生成 / 3D重建
- **相关度**: ⭐⭐⭐ (流体多物体交互可参考)
- **创新点**:
  - 统一空间坐标系表示
  - 解决物体穿透和对齐歧义
  - 解耦仿真与渲染
  - 实时物理交互预览
- **链接**: https://arxiv.org/abs/2605.20290 | https://github.com/xinzhang007/TelePhysics

---

## 近期其他 cs.GR 论文（非流体但相关）

| 论文ID | 标题 | 领域 | 相关度 |
|--------|------|------|--------|
| 2605.23508 | DrawVideo: Sketch-guided Storyboard Video Generation | 视频生成 | ⭐ |
| 2605.22894 | SCRIPT: Diffusion Policy for Humanoid Control | 强化学习控制 | ⭐ |
| 2605.20460 | Bone-driven Neural Garment Simulation | 服装仿真 | ⭐⭐ |
| 2605.20274 | PolycubeNet: Hexahedral Mesh Generation | 网格生成 | ⭐ |
| 2605.20209 | NaP-Control: Diffusion Prior Character Control | 角色控制 | ⭐ |
| 2605.21478 | Latent Dynamics for Full Body Avatar Animation | Avatar动画 | ⭐⭐ |
| 2605.20185 | PiG-Avatar: Hierarchical Neural-Field-Guided GS Avatars | 3DGS Avatar | ⭐⭐ |
| 2605.19889 | GLUT: Gaussian LUT for Color Transformation | 颜色变换 | ⭐ |

---

## 结论

**2026-05-25 无新增直接流体渲染论文。**

最近 24 小时 arXiv cs.GR 提交中：
- 无 fluid rendering 相关论文
- 无 smoke/fire/water simulation 相关论文
- 物理仿真方向以角色动画/服装/场景生成为主
- **SIGGRAPH 2026** 相关论文: YASPS (IPC仿真框架), BodyReLux (重光照)

### 值得关注的技术趋势
1. **Koopman代理模型**: 可用于流体循环动画的方程自由方法
2. **IPC可扩展框架**: YASPS的符号化方法可能适用于流体边界条件
3. **物理场景生成**: TelePhysics的多物体交互框架对流体场景可能有参考价值

### 建议
1. 关注 SIGGRAPH 2026 即将录用的流体相关论文
2. 监控 cs.CV 中基于NeRF/Gaussian的流体渲染工作
3. 考虑扩展搜索至 "shallow water simulation" 和 "height field rendering"

---

## 下次搜索计划
- **时间**: 2026-05-26 02:00 UTC
- **关键词**: 保持当前配置 + 添加 "shallow water", "height field fluid"

---
*自动生成 by Doumiao | 鸭血 - 计算机图形学流体渲染专家*
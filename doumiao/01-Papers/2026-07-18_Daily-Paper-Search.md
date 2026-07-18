# 每日流体渲染论文搜索报告 - 2026-07-18

## 搜索概要
- **搜索时间**: 2026-07-18 14:12 UTC
- **搜索范围**: arXiv cs.GR 最近一周 + SIGGRAPH 2026
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, volume rendering, particle system

---

## SIGGRAPH 2026 流体相关论文

### Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing ⭐ Best Paper
- **arXiv**: N/A (SIGGRAPH 2026 Best Paper)
- **作者**: Doug James, Ethan James
- **技术**: 
  - GPU加速的解析方法计算圆柱绕流势流
  - 无网格或中间重采样的漂移评估
  - 实时、任意分辨率流体混合
  - 可忽略的数值耗散
- **渲染方法**: 2D流体笔刷
- **关键词**: 流体混合, 实时渲染, 物理建模
- **链接**: https://blog.siggraph.org/2026/05/siggraph-2026-technical-papers-awards-best-papers-honorable-mentions-and-test-of-time.html/

### Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps ⭐ Honorable Mention
- **技术**: 
  - 将粒子视为四维时空中的样本
  - 时间步长比传统求解器大一个数量级
  - 多十亿粒子模拟单工作站运行
  - 保持表面细节和视觉保真度
- **渲染方法**: 自由表面/两相流体
- **关键词**: FLIP, 自由表面, 大时间步, GPU加速
- **论文**: TUM + RWTH Aachen

---

## arXiv cs.GR 论文 (2026-07-13 ~ 2026-07-17)

### Volumetric Inverse Rendering via Neural Radiative Transfer
- **arXiv**: 2607.13695
- **日期**: 2026-07-15
- **作者**: Ntumba Elie Nsampi et al.
- **技术**:
  - 参与介质的逆向渲染
  - 物理完整光传输 + 通用神经优化
  - 光学属性和完整光场表示为神经场
  - 通过辐射传输方程残差目标强制全局照明
  - 重建空间变化颜色散射、吸收和相位函数
- **渲染方法**: 体积渲染, 逆向渲染, 全局照明
- **关键词**: 参与介质, 神经渲染, 逆向渲染, 体积光传输
- **DOI**: 10.1111/cgf.70541
- **链接**: https://arxiv.org/abs/2607.13695

### Adaptive Fluid Cohomology on Surfaces
- **arXiv**: 2607.12001
- **日期**: 2026-07-13
- **作者**: David Stotko
- **技术**:
  - 非单连通弯曲表面上的不可压缩流体模拟
  - 动态空间和时间细化集成到欧拉方程模拟
  - 后验误差估计调整空间分辨率
  - Dormand-Prince 5(4)时间步进
  - 重新网格化时谐波基鲁棒转移
  - 内存减少86%
- **渲染方法**: 曲面流体模拟
- **关键词**: 曲面流, 自适应, 上同调, 欧拉方程
- **DOI**: 10.2312/cgf.70569
- **链接**: https://arxiv.org/abs/2607.12001

### Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation (提及)
- **arXiv**: 2607.14203
- **日期**: 2026-07-15
- **作者**: NVIDIA (Jiahui Huang et al.)
- **技术**: Instant NuRec - 前馈神经重建模型，多视角输入转换为可模拟3D Gaussian Splatting世界
- **关键词**: 3DGS, 动态场景, 神经重建
- **链接**: https://arxiv.org/abs/2607.14203

---

## 其他相关 cs.GR 论文 (非流体直接相关但可能相关)

### Dynamic Inverse Rendering for Enhanced Material-Lighting Decomposition
- **arXiv**: 2607.09329
- **会议**: ECCV 2026
- **技术**: 刚体运动物体的逆向渲染，材质-光照分解
- **关键词**: 逆向渲染, 材质分解, 光照估计

---

## 统计
- **SIGGRAPH 2026 流体相关**: 2篇 (1 Best Paper + 1 Honorable Mention)
- **arXiv cs.GR 流体/体积相关**: 2篇
- **总计**: 4篇

---

## 下一步
- 继续追踪SIGGRAPH 2026会议论文（7月19-23日）
- 关注ST-FLIP的实际实现细节
- 关注Mixwell的实时性能表现

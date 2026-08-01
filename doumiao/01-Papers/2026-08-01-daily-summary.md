# 每日论文搜索报告 - 2026-08-01

**搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH 2026 会议论文  
**执行时间**: 2026-08-01 14:09 UTC

---

## 📋 今日发现汇总

### SIGGRAPH 2026 流体相关论文 (3篇)

| 论文 | 关键词 | 类型 | 推荐度 |
|------|--------|------|--------|
| [[ST-FLIP: Spatiotemporal FLIP for Fast Free-Surface]] | FLIP, 大时间步, 两相流 | 流体模拟 | ⭐⭐⭐⭐⭐ |
| [[GauSmoke: Hybrid Physics-Optical Gaussian Splatting]] | 烟雾, 3DGS, 稀疏重建 | 烟雾渲染 | ⭐⭐⭐⭐ |
| [[LagrangianSplats: Divergence-Free Transport]] | 散度自由, 高斯原语, 流体重建 | 粒子渲染 | ⭐⭐⭐⭐ |
| [[The PhaseTree: Multiphase SDF]] | 多相SDF, 隐式曲面 | 表面渲染 | ⭐⭐⭐ |

### arXiv cs.GR 流体相关论文 (1篇)

| 论文 | 关键词 | 类型 | 推荐度 |
|------|--------|------|--------|
| [[ParticleGS: 3D Gaussian Splatting for Scientific Particle Data]] | 粒子渲染, 3DGS, 压缩 | 粒子渲染 | ⭐⭐⭐⭐ |

---

## 🔥 重点论文分析

### 1. ST-FLIP (SIGGRAPH 2026 Honorable Mention)

**最值得关注**：将 FLIP 粒子扩展到 4D 时空，允许时间步比 CFL 约束大 10×，同时保持视觉质量。

```
核心创新：粒子 = 4D 时空采样点
性能提升：若干倍加速（多十亿粒子）
集成成本：单步额外开销可忽略
```

### 2. LagrangianSplats (SIGGRAPH 2026)

**前沿方向**：用高斯原语替代传统粒子，传输过程数学保证散度自由，结合 Lagrangian 精度与神经渲染效率。

### 3. ParticleGS (arXiv)

**可落地技术**：3DGS 粒子压缩，65× 压缩比 + 30dB PSNR + 662 FPS 渲染。可直接迁移到 SPH 流体粒子可视化。

---

## 📊 趋势分析

### 1. 3DGS + 流体 正在成为主流范式
- GauSmoke: 烟雾重建
- LagrangianSplats: 流体重建
- ParticleGS: 粒子压缩渲染

### 2. 时空方法突破 CFL 限制
- ST-FLIP: 时空 FLIP
- 局部时空窗口: 流体控制

### 3. 多相流体渲染受到关注
- PhaseTree: 多相 SDF

---

## 🔗 论文链接

- ST-FLIP: SIGGRAPH 2026 Honorable Mention
- GauSmoke: SIGGRAPH 2026 Emerging Technologies
- LagrangianSplats: SIGGRAPH 2026
- PhaseTree: SIGGRAPH 2026
- ParticleGS: https://arxiv.org/abs/2607.22956

---

*由豆苗 (Doumiao) 自动生成 | 知识库: ~/knowledge-vault/doumiao/*

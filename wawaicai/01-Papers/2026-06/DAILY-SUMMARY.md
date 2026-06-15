# Daily Summary — 2026-06-15

## 搜索概览
- **搜索范围**: arXiv cs.GR (最近5天), SIGGRAPH 2026, Eurographics
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

## 发现论文 (几何处理相关)

### 🥬 UV参数化
| 论文 | arXiv | 标签 | 推荐度 |
|------|-------|------|--------|
| Continuous Neural Reparameterization for UV Repair | 2606.10050 | UV展开, SIREN, 神经参数化 | ✅ 推荐 |

### 🎮 网格动画/关节
| 论文 | arXiv | 标签 | 推荐度 |
|------|-------|------|--------|
| Instruct-Particulate: 3D Object Articulation | 2606.14699 | 关节动画, 神经网格 | ⚠️ 关注 |

### 📄 其他 cs.GR 论文 (非几何处理)
| 论文 | arXiv | 领域 |
|------|-------|------|
| HoloPathTracer (SIGGRAPH 2026) | 2606.14173 | 全息渲染 |
| MoGeFlow: Text-to-Motion | 2606.11656 | 动作生成 |
| XPR: Point-Based Differentiable Renderer | 2606.11529 | 可微渲染 |
| AnisoLift: Particle Liquid Enhancement | 2606.10473 | 流体模拟 |
| AnimaSpark: 3D Object Animation | 2606.10988 | 动画生成 |

## 今日重点

### UV Repair with Neural Reparameterization (arXiv:2606.10050)
**核心亮点**：使用未经训练的 SIREN + Laplace-Beltrami 谱特征实现零翻转的固定-chart UV展开

**关键数据**：
- Compact charts: 零翻转 100%
- Thingi10K/xatlas 47-chart: 42/47 有效零翻转
- Amara Spatial 25-asset: 1000/1000 严格局部有效 atlas

**传递给 @墨鱼丸**：可用于 UV 展开工具的鲁棒性增强

---
*由 wawaicai-daily-paper-search cron 生成 | 2026-06-15*
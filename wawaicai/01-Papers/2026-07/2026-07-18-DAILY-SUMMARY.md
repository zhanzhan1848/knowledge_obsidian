# 每日汇总 - 2026-07-18

## 今日搜索概况

**搜索时间**：2026-07-18 14:05 UTC
**搜索范围**：arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia/Eurographics
**关键词**：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 发现的论文

### SIGGRAPH 2026 论文

| 论文 | 类别 | 推荐度 |
|------|------|--------|
| **Matérn Noise for Triangulation-Agnostic Flow Matching** | 流匹配/网格生成 | ⭐⭐⭐⭐⭐ |
| **Subgrid Marching Tetrahedra** | 网格重建/SDF | ⭐⭐⭐⭐ |
| **Uncertainty-Aware GPIS Geometry Processing** | 不确定性几何处理 | ⭐⭐⭐⭐ |

### arXiv 新论文

| 论文 | arXiv ID | 类别 | 推荐度 |
|------|----------|------|--------|
| **Instant NuRec: Feed-Forward 3DGS Reconstruction** | 2607.14203 | 3DGS/驾驶仿真 | ⭐⭐⭐⭐ |

---

## 论文详情

### 1. Matérn Noise for Triangulation-Agnostic Flow Matching 🥬⭐⭐⭐⭐⭐

**作者**：Kuai et al. (UdeM, Brown)
**会议**：SIGGRAPH 2026 (TOG)

**核心贡献**：
- 提出**三角化无关**的流匹配框架
- 基于 Matérn 过程的噪声分布
- 支持 100万+面片网格的高效生成
- 可应用于弹性静止状态和人体姿态生成

**技术亮点**：
- 筛选泊松方程采样：`(L + τM)f = Mw`
- 与 PoissonNet 去噪器结合
- 训练一次，泛化到不同三角剖分

**开源**：https://github.com/kts707/matern-fm

### 2. Subgrid Marching Tetrahedra 🥬⭐⭐⭐⭐

**作者**：Baktash, Gillespie, Crane (CMU, Inria)
**会议**：SIGGRAPH 2026 (TOG)

**核心贡献**：
- 在亚网格分辨率提取等值面
- 保持尖锐边缘和角点精度
- 适用于医学成像和科学可视化

### 3. Uncertainty-Aware GPIS Geometry Processing 🥬⭐⭐⭐⭐

**作者**：Genest, Coeurjolly (UCBL, CNRS)
**会议**：SIGGRAPH 2026 (SIG/TOG)

**核心贡献**：
- 在高斯过程隐式曲面上进行不确定性感知几何处理
- Kac-Rice 公式将随机表面计算嵌入体积域
- 测地线等算子在低置信区自动过渡到体积表示

**开源**：https://github.com/baptiste-genest/GPGP

### 4. Instant NuRec: Feed-Forward 3DGS 🥬⭐⭐⭐

**作者**：NVIDIA
**arXiv**：2607.14203

**核心贡献**：
- 单次前向传播完成 3DGS 场景重建
- 1.5秒重建 10-20秒场景
- PSNR 提升 2.01 dB
- 支持非针孔相机模型

---

## 技术趋势观察

1. **三角化无关方法** - 成为 mesh 生成新方向，避免对特定三角剖分的依赖
2. **不确定性几何处理** - 结合概率方法处理真实世界扫描数据的噪声和缺失
3. **前馈神经网络重建** - 替代迭代优化，提高效率
4. **Keenan Crane 团队** 持续产出高质量几何处理论文（Subgrid Marching Tetrahedra）

---

## 知识库更新

- `2026-07/2026-07-18-Matern-Noise-Triangulation-Agnostic-Flow-Matching-SIGGRAPH2026.md`
- `2026-07/2026-07-18-Subgrid-Marching-Tetrahedra-SIGGRAPH2026.md`
- `2026-07/2026-07-18-Uncertainty-Aware-GPIS-Geometry-Processing-SIGGRAPH2026.md`
- `2026-07/2607.14203-Instant-NuRec-Feed-Forward-3DGS-Reconstruction.md`

---

## 下一步行动

- [ ] 将 **Matérn Noise** 方法传递给 @墨鱼丸 评估
- [ ] 持续监控 SIGGRAPH 2026 论文列表
- [ ] 检查 Eurographics 2026 论文

---

*🥬 娃娃菜 | 几何处理专家 | 2026-07-18*

# 每日渲染论文搜索报告

**日期**: 2026-06-03
**时间**: 14:00 UTC
**搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia

---

## 📋 搜索结果概览

| 来源 | 新论文数 | 相关论文数 |
|------|----------|------------|
| arXiv cs.GR | 10 | 2 |
| SIGGRAPH 2026 | - | - |
| 其他来源 | - | 3 |

---

## 📄 arXiv cs.GR 新论文 (2026-06-03)

### 新增论文 (2篇)

#### 1. Coherence-First World-Model Rendering with Model-Guided FSR4 Frame Generation
- **ID**: arXiv:2606.02586
- **作者**: Paweł Katarzyński
- **日期**: 2026-05-11
- **链接**: [arXiv](https://arxiv.org/abs/2606.02586)
- **摘要**: 提出 coherence-first 渲染策略，使用 Overworld's Waypoint-1.5 和 WorldEngine 运行时，在受限推理预算下生成更高质量的世界模型帧。与 cadence-first 基线相比，在森林、剑、沙漠和雪景中表现更好。
- **评估**:
  - 创新性: ⭐⭐⭐
  - 实用性: ⭐⭐⭐⭐
  - 与渲染相关度: 中（涉及帧生成和渲染质量）
- **标签**: #渲染 #帧生成 #AI #实时渲染

#### 2. A Novel Procedural Generation for Level Design of Mansions and Dungeons
- **ID**: arXiv:2606.03857
- **作者**: Erick Rodrigues
- **日期**: 2026-06-02
- **会议**: SBGAMES 2025
- **链接**: [arXiv](https://arxiv.org/abs/2606.03857)
- **摘要**: 使用 BSP 分割、图遍历和后处理生成结构化室内环境。在 100,000 张地图生成测试中，参数合适时超过 91% 达到完全连通性。
- **评估**:
  - 创新性: ⭐⭐⭐
  - 实用性: ⭐⭐⭐⭐
  - 与渲染相关度: 低（偏游戏关卡生成）
- **标签**: #PCG #关卡设计 #BSP

### Cross-list 论文 (4篇)

#### 3. PersistGS: Differentiable Physics for Object Permanence in 4D Gaussian Splatting
- **ID**: arXiv:2606.03479
- **作者**: (CVPR 2026 Workshop)
- **日期**: 2026-05
- **链接**: [arXiv](https://arxiv.org/abs/2606.03479)
- **摘要**: 将可微分刚体模拟与 3D Gaussian Splatting 结合，解决物体被遮挡时的持久性问题。使用质心轮廓损失，轨迹误差降低 40%，PSNR 提高 +2.46dB。
- **评估**:
  - 创新性: ⭐⭐⭐⭐
  - 实用性: ⭐⭐⭐⭐
  - 与渲染相关度: 高（涉及 Gaussian Splatting 渲染）
- **标签**: #3DGS #高斯泼溅 #神经渲染 #可微分物理

---

## 📰 行业新闻 (最近24小时)

### 1. 3DMark 预览原生 4K Path-Tracing 基准测试
- **来源**: VideoCardz / ComputerBase
- **日期**: 2026-06-03 (Computex 2026)
- **摘要**: UL Solutions 正在开发下一代光线追踪测试，包含原生 4K、AI 超分辨率和帧生成。使用 path tracing 技术，仍处于预产阶段。
- **链接**: [VideoCardz](https://videocardz.com/newz/3dmarks-next-gen-ray-tracing-test-adds-native-4k-ai-upscaling-and-frame-generation)
- **标签**: #PathTracing #Benchmark #3DMark

### 2. NVIDIA DLSS 4.5 发布
- **来源**: Vandal
- **日期**: 2026-06-02
- **摘要**: NVIDIA 宣布 DLSS 4.5 在 path tracing 场景中提供 35% 的性能提升。DLSS 4.5 通过 ray reconstruction 技术改进所有 RTX 显卡的光线追踪和 path tracing 效果。
- **链接**: [Vandal](https://vandal.elespanol.com/noticia/1350790324/nvidia-presenta-dlss-45-ray-reconstruction-ray-tracing-y-path-tracing-mejorados-en-todas-las-graficas-rtx/)
- **标签**: #DLSS #NVIDIA #PathTracing #AI

### 3. AMD Radeon RX 9070 GRE 评测
- **来源**: PC Games Hardware / TechTimes
- **日期**: 2026-06-02
- **摘要**: AMD RX 9070 GRE 全球上市，售价 $549。12GB VRAM 在 1440p 及以上分辨率的光线追踪场景中表现受限。
- **链接**: [TechTimes](https://www.techtimes.com/articles/317599/20260602/amd-radeon-rx-9070-gre-launches-globally-549-12gb-vram-limits-ray-tracing-1440p.htm)
- **标签**: #AMD #Radeon #RayTracing #GPU

---

## 📊 本日总结

### 论文发现
- 本日 arXiv cs.GR 新增 10 篇论文
- 与渲染领域直接相关的论文: **2 篇**
- 最值得关注: **PersistGS (arXiv:2606.03479)** - 4D 高斯泼溅与物理模拟结合

### 技术趋势
1. **AI 辅助渲染**: DLSS 4.5 继续强化 AI 在 path tracing 中的作用
2. **Path Tracing 基准**: 3DMark 推出原生 4K path tracing 测试
3. **神经渲染**: Gaussian Splatting 与物理模拟结合成为热点

### 待深入分析
- [ ] PersistGS 论文全文分析
- [ ] Coherence-First Rendering 与 FSR4 集成方案

---

## 🔍 明日关注
- 继续监控 arXiv cs.GR 新增论文
- 关注 SIGGRAPH 2026 论文发布

---

*报告生成时间: 2026-06-03 14:00 UTC*
*Agent: 嫩牛肉 (Nenniurou) - 计算机图形学渲染专家*

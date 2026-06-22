# 流体渲染论文日报 - 2026-06-22

## 搜索范围
- **时间**: 最近24小时内
- **来源**: arXiv cs.GR, SIGGRAPH 2026
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📄 arXiv 论文

### 1. Fire as a Service: Augmenting Robot Simulators with Thermally and Visually Accurate Fire Dynamics

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2603.19063](https://arxiv.org/abs/2603.19063) |
| **类别** | cs.RO, cs.GR |
| **发表** | 2026-03-19 |
| **作者** | Soren Pirk |
| **会议/期刊** | arXiv |

#### 核心创新点
- **Fire as a Service (FaaS)**: 新型异步协同仿真框架
- **多物种热力学热传递**: 准确的多物种热传递模拟
- **体积烟雾渲染**: 视觉一致的体积烟雾渲染
- **实时性能**: 支持高速刚性体控制循环
- **行为克隆训练**: 支持通过行为克隆训练反应性多模态策略

#### 技术要点
- 增强现有机器人仿真器的高保真火灾模拟
- 机器人可体验精确的消防场景
- 支持人类在回路遥操作
- 为消防机器人提供安全的训练数据生成

#### 关键词
`fire simulation` `volumetric smoke` `robot simulator` `thermal heat transfer` `co-simulation`

---

### 2. AusSmoke meets MultiNatSmoke: A Fully-Labelled Diverse Smoke Segmentation Dataset

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2604.23542](https://arxiv.org/abs/2604.23542) |
| **类别** | cs.CV |
| **发表** | 2026-04-26 |
| **作者** | Weihao Li |
| **会议/期刊** | WACV 2026 |

#### 核心创新点
- **AusSmoke**: 澳大利亚野火烟雾分割数据集
- **MultiNatSmoke**: 多国地理多样性的烟雾分割基准
- **数据规模提升**: 较之前数据集提升一个数量级
- **跨地域泛化**: 提高模型在不同地理环境的泛化能力

#### 技术要点
- 解决现有野火烟雾数据集规模有限、地理范围受限问题
- 整合国际公开数据集与新采集的澳大利亚图像
- 基准烟雾分割模型性能
- GitHub: https://github.com/henryzhao0615/MultiNatSmoke

#### 关键词
`smoke segmentation` `wildfire` `dataset` `computer vision` `Australia`

---

### 3. WildSmoke: Ready-to-Use Dynamic 3D Smoke Assets from a Single Video in the Wild

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2509.11114](https://arxiv.org/abs/2509.11114) |
| **类别** | cs.CV, cs.LG |
| **发表** | 2025-09-14 |
| **作者** | Yuqiu Liu |
| **会议/期刊** | arXiv |

#### 核心创新点
- **单视频烟雾重建**: 从单张野外视频提取和重建动态3D烟雾资产
- **交互式仿真**: 集成烟雾设计和编辑的交互式仿真
- **多视图生成**: 解决野外视频烟雾重建三大挑战

#### 技术要点
- **烟雾分割**: 背景去除 + 去雾
- **粒子初始化**: 烟雾粒子和相机姿态初始化
- **多视图推断**: 时空相机轨迹解耦
- **性能**: PSNR提升 +2.22dB
- 链接: https://autumnyq.github.io/WildSmoke

#### 关键词
`3D smoke reconstruction` `single video` `fluid simulation` `view synthesis` `particle initialization`

---

### 4. Enabling Real-Time Training of a Wildfire-to-Smoke Map with Multilinear Operators

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2605.04164](https://arxiv.org/abs/2605.04164) |
| **类别** | cs.LG, physics.ao-ph, physics.comp-ph |
| **发表** | 2026-05-05 |
| **作者** | Zachary Morrow |
| **会议/期刊** | arXiv |

#### 核心创新点
- **多线性算子**: 数据驱动方法预测烟雾浓度场
- **从点火时间预测**: 从时间_since_ignition预测气溶胶光学深度和烟雾检测
- **实时推断**: 前向调用 <1ms
- **快速训练**: CPU上训练 <30秒

#### 技术要点
- 计算时间_since_ignition和烟雾浓度场的主成分
- 学习从输入系数幂到输出系数的映射
- 在Upper Rio Grande Watershed应用
- IoU 65%, AUC 0.95

#### 关键词
`wildfire smoke` `multilinear operators` `real-time prediction` `aerosol optical depth`

---

## 🏆 SIGGRAPH 2026 获奖论文

### 5. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

| 属性 | 内容 |
|------|------|
| **类别** | Best Paper - Fluid Simulation |
| **作者** | Doug James, Ethan James |

#### 核心创新点
- **GPU加速解析方法**: 基于圆柱齿周围势流的锐利2D流体刷
- **任意分辨率**: 无需网格或中间重采样的任意分辨率
- **可忽略数值耗散**: 渲染无明显数值耗散

#### 技术要点
- 渐进式物理流体混合
- 无网格依赖
- 实时流体混合

#### 关键词
`fluid mixing` `2D fluid brush` `GPU acceleration` `potential flow` `real-time`

---

### 6. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

| 属性 | 内容 |
|------|------|
| **类别** | Honorable Mention - Fluid Simulation |
| **作者** | Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey |

#### 核心创新点
- **大时间步长**: 支持非常大的时间步长
- **时空FLIP**: 时空域分离方法
- **两相模拟**: 免费表面和两相流模拟

#### 技术要点
- 比传统方法更快
- 支持大步长稳定性
- 适用于游戏和交互应用

#### 关键词
`FLIP` `free-surface` `two-phase` `large time steps` `fluid simulation`

---

## 📊 今日摘要

### 论文统计
- **arXiv 论文**: 4 篇
- **SIGGRAPH 2026 论文**: 2 篇 (流体相关)
- **总计**: 6 篇

### 研究趋势
1. **机器人仿真 + 火灾**: Fire as a Service 将火焰模拟引入机器人训练
2. **烟雾分割数据集**: 大规模、多地理区域烟雾数据集成为热点
3. **单视频3D烟雾重建**: WildSmoke 展示从野外视频提取流体资产
4. **实时烟雾预测**: 多线性算子实现毫秒级烟雾预测
5. **SIGGRAPH 2026**: Mixwell 和时空FLIP获最佳论文/荣誉提名

### 值得关注
- [[Fire as a Service]] - 机器人仿真新范式
- [[Mixwell]] - 实时流体混合
- [[WildSmoke]] - 3D流体资产重建
- [[Spatiotemporal FLIP]] - 大时间步流体模拟

---
*生成时间: 2026-06-22 14:12 UTC*
*搜索来源: arXiv cs.GR, SIGGRAPH 2026*
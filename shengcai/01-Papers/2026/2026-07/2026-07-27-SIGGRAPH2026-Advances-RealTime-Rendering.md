---
tags: [渲染, 实时渲染, SIGGRAPH, 课程, 2026]
date: [[2026-07-27]]
status: 重要
---

# SIGGRAPH 2026 Advances in Real-Time Rendering in Games

## 课程信息
| 属性 | 内容 |
|------|------|
| 名称 | Advances in Real-Time Rendering in Games |
| 日期 | 2026-07-21 |
| 组织者 | Natalya Tatarchuk (Activision) |

## 演讲者与公司
- Activision
- Electronic Arts (EA SEED)
- Sony Interactive Entertainment
- IO Interactive
- Roblox
- Meta

---

## 🔑 重点技术

### 1. ORCA - Online Radiance Cache Acceleration

**演讲者**: Jon Greenberg (EA SEED)

**核心要点**:
- 路径追踪硬件上实时运行仍具挑战
- 提出 ORCA 方法加速路径追踪
- 基于自定义 radiance cache

**技术特点**:
- ✅ 不依赖时序历史
- ✅ 所有数据结构瞬时
- ✅ 不需要跨帧存活
- ✅ 适合完全动态场景
- ✅ 易于集成到现有实时路径追踪器

**参考**: [Advances Course](https://advances.realtimerendering.com/s2026/index.html)

---

### 2. PSSR 升级版 (PlayStation Spectral Super Resolution)

**演讲者**: Daniel Craig (Sony Interactive Entertainment)

**背景**:
- ML 超分成为实时渲染核心技术
- 原有 PSSR 将整个重建管线作为单一颜色预测网络

**新方案改进**:
- 恢复显式闭式解（已有高效解法）
- 聚焦模型于模式识别
- 结果: 更高视觉质量 + 更低运行时/内存/训练成本

---

### 3. Variable Rate Ray Tracing (VRRT)

**演讲者**: Michał Olejnik (Infinity Ward Poland)
**应用**: Call of Duty: Modern Warfare 4

**挑战**:
- 快节奏多人射击游戏
- 帧时间预算严格
- 传统固定采样率 + 屏幕空间去噪不足

**解决方案**:
- 动态分配每像素光线预算
- 支持子1样本/像素 (空间欠采样 + 时间重建)
- 支持选择性超采样 (>1 spp)
- 时序梯度预通道 + 显式遮挡检测
- GPU驱动帧调度器保证恒定光线总数

**效果**: 稳定GPU成本，消除性能峰值

---

### 4. Smolder - 实时体积效果渲染

**演讲者**: Alexander Mueller (IO Interactive)
**引擎**: Glacier
**应用**: 007 First Light

**特点**:
- 完全集成到 Glacier 引擎
- 与所有照明系统集成
- 支持 opaque, transparent, volumetric fog 各层
- 可用于玩家控制的体积效果 gadgets

**技术路线**: 体积效果作为 VFX 集成

---

### 5. SLIM - Scaling User-Generated 3D Worlds

**演讲者**: Sergey Makeev (Roblox)

**挑战**:
- Roblox 游戏由用户生成内容构建
- 跨大范围设备运行
- 无传统艺术指导

**解决方案**:
- 云端自动生成设备自适应运行时表示
- 保留外观、行为和语义
- 跨 PB 级现有 UGC 部署

---

### 6. Adaptive Tessellation and Subdivision

**演讲者**: John Hable (Meta)

**内容**:
- Compute shader 细分
- Clamped parallelogram tessellation
- 屏幕自适应细分 + 接缝焊接
- Catmull-Clark 细分 + 半尖锐折痕

---

## 📊 技术趋势总结

| 技术 | 领域 | 创新点 |
|------|------|--------|
| ORCA | 路径追踪 | 瞬时 radiance cache |
| PSSR升级 | ML超分 | 闭式解恢复 |
| VRRT | 光线追踪 | 可变采样率 |
| Smolder | 体积渲染 | 全集成VFX框架 |
| SLIM | 云渲染 | 设备自适应 |
| Adaptive Tess | 几何处理 | 计算着色器细分 |

---

## 🔔 关键洞察

1. **路径追踪实用化**: ORCA 等技术使实时路径追踪更可行
2. **AI-Directed Rendering**: DLSS/PSSR 等 AI 超分成为标配
3. **动态GI突破**: Radiance Cascades 方法持续改进
4. **体积渲染集成**: 体积效果不再是专用工具
5. **设备自适应**: 云端优化是大规模平台必然趋势

---

## 参考链接

- [Advances Course](https://advances.realtimerendering.com/s2026/index.html)
- [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/program/technical-papers/)

## 标签

#SIGGRAPH2026 #实时渲染 #路径追踪 #光线追踪 #体积渲染 #ML超分 #2026

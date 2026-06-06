# 🩸 Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

##论文信息

|字段 | 内容 |
|------|------|
| **标题** | Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps |
| **作者** | Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey |
| **来源** | SIGGRAPH 2026 Honorable Mention (Technical Paper) |
| **年份** | 2026 |
| **URL** | https://s2026.conference-schedule.org/presentation/?id=papers_755&sess=sess123 |
| **分类** | 自由表面流体 / 两相流模拟 / FLIP |

---

## 🎯 核心创新点

### 问题背景
FLIP (Fluid-Implicit Particle) 是工业流体模拟的标准方法，但传统 FLIP 受 CFL 条件限制，时间步长无法做大，导致模拟低速。

### 核心贡献
提出**时空 FLIP (Spatiotemporal FLIP)**，允许使用非常大的时间步长进行自由表面和两相模拟。

### 技术方法
- 利用时空 접근 (spatiotemporal approach)扩展 FLIP 框架
- 支持超大时间步长，显著加速模拟
- 保持两相界面追踪精度

---

## 🔧 技术框架

### 方法类型
- **模拟方法**: FLIP (Fluid-Implicit Particle)
- **应用场景**: 自由表面流体、两相流（液体-气体）
- **时间步长**: 支持非常大的时间步长（远超 CFL 限制）

### 关键特性
- 相位界面追踪
- 大时间步长稳定性
- 两相流体耦合

---

## 📈 性能指标

| 指标 | 预期表现 |
|------|---------|
| 模拟速度 | 相比传统 FLIP 大幅提升 |
| 时间步长 | 可达 CFL 限制的数倍 |
| 界面精度 | 保持自由表面精度 |

---

## 💡 实现建议

### 渲染方法
- 类型：表面渲染 + 粒子渲染
- 技术：FLIP 粒子 → 自由表面重建 → 折射/反射

### 视觉质量
- 逼真度：⭐⭐⭐⭐（工业级流体）
- 风格化支持：是

### 性能预期
- 帧率：实时 ~ 超实时
- GPU需求：中等
- 内存占用：取决于粒子数量

### 推荐度：✅ 高度推荐
- FLIP 是工业流体模拟主流，Spatiotemporal FLIP 进一步突破性能瓶颈
- 对游戏/影视特效中的水体、液体飞溅有直接价值

---

## 📚 相关工作

- 基础 FLIP: [PF Liquids, FLIP for Free-Surface Flow]
- 两相模拟: [Augustus et al., Ye et al.]
- 时间步长加速: [Stomakhin et al., HDRflow]

---

## 🔗 关联标签
[[FLIP]] [[自由表面]] [[两相流]] [[流体模拟]] [[大时间步长]] [[SIGGRAPH2026]]
---
title: Advances in Real-Time Rendering 2026 - Production Techniques
authors: 生菜 (Shengcai) - Daily Paper Search
date: 2026-07-28
tags: [实时渲染, 路径追踪, 光线追踪, 体积渲染, PSSR, 变速率, AAA游戏]
status: 已读
source: Advances in Real-Time Rendering 2026 (https://advances.realtimerendering.com/s2026/index.html)
---

# Advances in Real-Time Rendering 2026 — Production Techniques

## 概述

SIGGRAPH 2026 期间的 **Advances in Real-Time Rendering 2026** 课程汇集了游戏行业顶级工作室的最新渲染技术。主要演讲来自 **Activision**、**Electronic Arts (EA SEED)**、**Sony Interactive Entertainment** 等公司。

**来源**: [Advances in Real-Time Rendering 2026](https://advances.realtimerendering.com/s2026/index.html)

---

## 1. ORCA: Online Radiance Cache Acceleration — EA SEED

### 基本信息
| 项目 | 内容 |
|------|------|
| **团队** | Electronic Arts (EA SEED) |
| **领域** | 路径追踪 (Path Tracing) 加速 |
| **游戏** | 未公开 (推测为 EA 即将发布游戏) |
| **相关技术** | Radiance Cache, Path Tracing, Real-time GI |

### 核心贡献
- **在线辐射缓存 (Online Radiance Cache)**: 针对游戏实时路径追踪的辐射缓存加速方案
- 解决路径追踪在动态场景中的收敛速度问题
- 与传统离线渲染辐射缓存不同，强调**在线**和**实时**特性

### 技术要点推测
```
Radiance Cache 核心流程：
1. 每帧采样场景光照路径
2. 在缓存结构中存储辐射度样本
3. 后续帧复用缓存样本进行插值
4. 动态更新缓存以适应场景变化

ORCA 特点：
- 高效的缓存数据结构
- 低开销的缓存查询
- 与 DXR/光线追踪 API 集成
```

### 与渲染技术的关系
- **路径追踪 (Path Tracing)**: AAA 游戏正在从光栅化 + 光线追踪混合转向完整路径追踪
- **全局光照 (GI)**: 辐射缓存是实现实时 GI 的核心技术之一
- **参考实现**: 可参考 EA 的先行工作

### 可行性评估
| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ (生产级验证) |
| 难度 | 高 (需要深入理解辐射传输理论) |
| 开源 | 否 (生产技术) |

### 参考价值
- 辐射缓存数据结构设计
- 缓存一致性与更新策略
- 与现代 GPU 光线追踪管线的集成

---

## 2. Upgrading PSSR on PlayStation 5 Pro — Sony Interactive Entertainment

### 基本信息
| 项目 | 内容 |
|------|------|
| **团队** | Sony Interactive Entertainment |
| **领域** | ML 驱动渲染上采样 |
| **平台** | PlayStation 5 Pro |
| **相关技术** | Super Resolution, Neural Upscaling, PSSR |

### 核心贡献
- **PSSR (PlayStation Spectral Super Resolution)**: 索尼自研的ML超分辨率技术
- **PlayStation 5 Pro 升级版**: 针对新一代主机硬件优化
- 相比 FSR (AMD FidelityFX Super Resolution) 和 DLSS (NVIDIA) 的差异化和优势

### 技术背景

#### 超分辨率技术对比
| 技术 | 开发商 | 特点 |
|------|--------|------|
| **DLSS** | NVIDIA | 基于 AI 的高质量上采样，需要 Tensor Core |
| **FSR** | AMD | 开源的空间/时间上采样，无需专用硬件 |
| **XeSS** | Intel | 基于 AI 的开源方案 |
| **PSSR** | Sony | 针对 PlayStation 平台优化的 ML 上采样 |

#### PSSR 技术要点 (推测)
```
PSSR 核心流程：
1. 低分辨率渲染场景
2. 使用神经网络预测高频细节
3. 输出高分辨率图像

PS5 Pro 改进：
- 可能的专用 AI 硬件加速
- 更高的输出分辨率支持
- 更好的时间稳定性
```

### 与渲染技术的关系
- **后处理渲染**: 超分辨率是现代渲染管线的重要组成部分
- **实时光线追踪**: PSSR 通常与光线追踪配合使用以保持性能
- **神经渲染**: 代表了深度学习在实时渲染中的成熟应用

### 可行性评估
| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ (已部署于商用主机) |
| 难度 | 高 (需要训练数据和 ML 基础设施) |
| 开源 | 否 (索尼专有技术) |

### 参考价值
- ML 超分辨率在主机平台的部署经验
- 性能与质量的平衡策略
- 与光线追踪的集成方式

---

## 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4 — Activision

### 基本信息
| 项目 | 内容 |
|------|------|
| **团队** | Activision |
| **游戏** | Call of Duty: Modern Warfare 4 |
| **领域** | 实时光线追踪 |
| **相关技术** | VRRT, Adaptive Ray Tracing, DXR |

### 核心贡献
- **变速率光线追踪 (Variable Rate Ray Tracing, VRRT)**: 根据场景复杂度动态调整光线追踪精度
- 在保持视觉质量的同时最大化性能
- 已部署于商用 AAA 游戏

### 技术原理

#### 问题背景
传统光线追踪使用统一的精度设置：
- 所有像素投射相同数量的光线
- 简单区域光线过剩（浪费计算资源）
- 复杂区域光线不足（质量不足）

#### VRRT 解决方案
```
VRRT 核心思想：
1. 分析场景的空间复杂度
2. 在简单区域减少光线数量
3. 在复杂区域保持或增加光线数量
4. 视觉质量感知统一

实现方式（推测）：
- 使用分辨率网格或tiling
- Per-tile 或 per-region 光线预算调整
- 与 TAA/Upscaling 配合使用
```

### 性能优化策略
| 策略 | 效果 |
|------|------|
| **空间自适应** | 根据局部几何复杂度调整 |
| **时间稳定性** | 避免闪烁和伪影 |
| **感知质量保证** | 人眼不易察觉区域降低精度 |
| **与传统技术兼容** | 与 TAA、光线追踪阴影等配合 |

### 与渲染技术的关系
- **光线追踪加速**: VRRT 是光线追踪性能优化的重要方向
- **自适应采样**: 与 Importance Sampling 相关但更工程化
- **游戏渲染管线**: 直接应用于 AAA 游戏生产

### 可行性评估
| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ (已商用验证) |
| 难度 | 中高 (需要场景分析工具) |
| 开源 | 否 (动视专有技术) |

### 参考价值
- 变速率渲染的工程实践
- 场景复杂度分析方法
- 性能与质量权衡策略

---

## 4. Smolder: Real-Time Volumetric Effect Rendering — Activision

### 基本信息
| 项目 | 内容 |
|------|------|
| **团队** | Activision |
| **引擎** | Glacier Engine (使命召唤引擎) |
| **领域** | 实时体积渲染 |
| **应用** | 烟雾、火焰、体积云等视觉效果 |

### 核心贡献
- 在 **Glacier Engine** 中实现实时体积效果渲染
- 解决体积渲染的计算成本问题
- 适用于游戏中的真实感体积效果

### 体积渲染技术要点

#### 传统体积渲染挑战
```
体积渲染计算复杂度：
Volume = f(x, y, z, θ, φ, λ, t)
其中：
- 空间位置 (x, y, z)
- 视角方向 (θ, φ)
- 波长 (λ)
- 时间 (t)

传统方法：
- Ray Marching: 每条光线多次步进
- 3D Texture: 大内存占用
- 散射模型: 复杂的多次散射计算
```

#### Smolder 技术方案 (推测)
```
可能的优化技术：
1. 空间/时间降采样
2. 简化的散射模型 (single scattering vs. multiple scattering)
3. GPU Compute Shader 优化
4. 与光栅化混合渲染
5. 基于深度的压缩
```

### 与渲染技术的关系
- **体积光照 (Volumetric Lighting)**: 体积效果是实现大气感的重要手段
- **光线步进 (Ray Marching)**: 核心算法，但需要工程优化
- **游戏 VFX**: 直接应用于游戏视觉效果

### 可行性评估
| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ (已商用) |
| 难度 | 中 (工程优化为主) |
| 开源 | 否 (引擎专有技术) |

### 参考价值
- 体积渲染的工程优化方法
- 性能与视觉质量的平衡
- 游戏引擎中的实时 VFX 集成

---

## 5. Toward Richer Material Generation via Procedural Data Enhancement

### 基本信息
| 项目 | 内容 |
|------|------|
| **领域** | PBR 材质生成 |
| **技术** | Procedural Generation, Data Enhancement |
| **应用** | 提升 PBR 材质库多样性 |

### 核心贡献
- 使用**程序化数据增强**提升 PBR 材质多样性
- 解决高质量 PBR 材质数据稀缺问题
- 可应用于材质扫描、程序化材质生成

### 技术要点
```
PBR 材质生成挑战：
1. 高质量材质扫描成本高
2. 手动创作耗时
3. 风格一致性难保证

程序化增强方法：
1. 基于现有材质库
2. 参数化变形（粗糙度、法线强度等）
3. 混合多个材质
4. 添加噪声和细节
```

### 可行性评估
| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐ |
| 难度 | 中 |
| 开源 | 可能 (待确认) |

---

## 六、技术总结与推荐

### 综合评估

| 技术 | 创新性 | 实用性 | 实现难度 | 推荐度 |
|------|--------|--------|----------|--------|
| ORCA (Radiance Cache) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 高 | **强烈推荐** |
| VRRT (Call of Duty) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 中高 | **强烈推荐** |
| PSSR (PS5 Pro) | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 高 | 推荐 |
| Smolder (Volumetric) | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 中 | 推荐 |
| Procedural Materials | ⭐⭐⭐ | ⭐⭐⭐⭐ | 中 | 可选 |

### 最高优先级：ORCA
**推荐理由**:
1. EA SEED 的辐射缓存加速是游戏级路径追踪的关键突破
2. 路径追踪正在成为 AAA 游戏的标准（Quake 2 RTX, Cyberpunk, Spiderman 等）
3. 辐射缓存是实现实时全局光照的核心技术
4. 对自研渲染引擎有直接参考价值

### 第二优先级：VRRT
**推荐理由**:
1. 变速率光线追踪是光线追踪性能优化的重要方向
2. 工程实践成熟，可直接借鉴
3. 与现有渲染管线兼容性高

### 第三优先级：Smolder
**推荐理由**:
1. 体积渲染是提升真实感的重要手段
2. 已验证的工程优化方法
3. 与流體渲染方向相关（鸭血负责）

---

## 七、相关链接

| 技术 | 链接 |
|------|------|
| Advances in RTR 2026 | https://advances.realtimerendering.com/s2026/index.html |
| ORCA (EA SEED) | 待确认 |
| PSSR (Sony) | 待确认 |
| VRRT (Activision) | 待确认 |
| Smolder (Activision) | 待确认 |
| NVIDIA DLSS | https://www.nvidia.com/en-us/geforce/technologies/dlss/ |
| AMD FSR | https://gpuopen.com/fidelityfx-super-resolution/ |

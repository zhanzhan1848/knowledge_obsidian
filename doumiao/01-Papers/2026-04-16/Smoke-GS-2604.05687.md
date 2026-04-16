# Smoke-GS: 3D Smoke Scene Reconstruction via 3D Gaussian Splatting

## 论文信息
| 项目 | 内容 |
|------|------|
| **arXiv** | [2604.05687](https://arxiv.org/abs/2604.05687) |
| **版本** | v1 (2026-04-07) |
| **作者** | Xinye Zheng et al. |
| **类别** | cs.CV |
| **竞赛** | NTIRE 2026 3D Restoration and Reconstruction Challenge |

## 摘要
Reconstructing 3D scenes from smoke-degraded multi-view images is particularly difficult because smoke introduces:
- **Strong scattering effects**
- **View-dependent appearance changes**
- **Severe degradation of cross-view consistency**

### 解决方案
1. **Nano-Banana-Pro**: 增强烟雾降质图像，提供更清晰的重建观察
2. **Smoke-GS**: 介质感知的 3D Gaussian Splatting 框架

## 核心创新

### 🌫️ Smoke-GS Architecture
```
┌─────────────────────────────────────────────────────────────────┐
│                     Smoke-GS Pipeline                            │
├─────────────────────────────────────────────────────────────────┤
│  Input: Multi-view Smoke-degraded Images                        │
│         ↓                                                        │
│  Nano-Banana-Pro (Visual Enhancement)                            │
│         ↓                                                        │
│  3D Gaussian Splatting                                           │
│  ├── Explicit 3D Gaussians                                       │
│  ├── Medium-aware branch ← 关键创新                               │
│  └── View-dependent appearance                                    │
│         ↓                                                        │
│  Output: Novel View Synthesis + Scene Reconstruction             │
└─────────────────────────────────────────────────────────────────┘
```

### 🔑 关键技术点

| 技术 | 描述 |
|------|------|
| **3D Gaussian Splatting** | 显式 3D 高斯场景表示，保持渲染效率 |
| **Medium-aware Branch** | 轻量级视角相关介质分支 |
| **View-dependent Appearance** | 捕获由烟雾引起的视角依赖外观变化 |
| **Cross-view Consistency** | 保持多视角一致性 |

## 问题背景

### 烟雾渲染挑战
```
烟雾场景 → 强散射 → 视角依赖 → 跨视角不一致 → 重建困难
```

### 传统方法局限
1. 体积渲染方法计算量大
2. 基于网格的方法难以处理烟雾介质
3. 深度学习方法需要大量训练数据

## 技术贡献

### 1. 介质感知建模
- 显式建模烟雾散射效应
- 视角相关外观变化捕获

### 2. 高效渲染
- 保持 3D Gaussian Splatting 的渲染效率
- 适合实时应用

### 3. 鲁棒性
- 对烟雾诱导的降质具有鲁棒性
- 生成一致且视觉清晰的新视角

## 体积渲染关联

### ⭐⭐⭐⭐⭐ 关联度分析

| 体积渲染技术 | Smoke-GS 应用 |
|-------------|--------------|
| Ray Marching | ❌ (使用 Gaussian Splatting) |
| 散射模拟 | ✅ 烟雾介质散射建模 |
| 视角相关外观 | ✅ Medium-aware branch |
| 体积阴影 | 待研究 |
| 参与介质渲染 | ✅ 直接相关 |

### 技术对比

| 方法 | 计算效率 | 内存占用 | 烟雾处理 | 新视角质量 |
|------|---------|---------|---------|-----------|
| Volume Rendering | 低 | 高 | 好 | 高 |
| Neural Rendering | 高 | 中 | 一般 | 高 |
| **Smoke-GS** | **高** | **中** | **好** | **高** |

## NTIRE 2026 Challenge

### Track 2: 3D Restoration and Reconstruction
- **任务**: 烟雾降质场景的 3D 重建与新视角合成
- **评价指标**: PSNR, SSIM, LPIPS 等

### Smoke-GS 排名
> 在 NTIRE 2026 Track 2 中提出并取得良好成绩

## 应用场景

| 场景 | 描述 |
|------|------|
| 🔥 火灾烟雾监测 | 烟雾场景的 3D 重建 |
| 🌫️ 大气可视化 | 雾、霾的体积渲染 |
| 🎬 电影特效 | 烟雾场景的动态重建 |
| 🚗 自动驾驶 | 烟雾天气下的场景感知 |
| 🏭 工业检测 | 烟雾泄漏检测与定位 |

## 与流体渲染的关系

### 直接关联
1. **烟雾模拟**: 烟雾是流体的一种表现形式
2. **体积渲染**: 烟雾渲染的核心技术
3. **散射效应**: 体积光照传输 (Volume Light Transport)

### 可扩展方向
- 动态烟雾序列 → 4D Gaussian Splatting
- 火焰+烟雾联合渲染
- 交互式烟雾模拟

## 未来工作
- [ ] 动态烟雾序列处理
- [ ] 火焰与烟雾联合重建
- [ ] 实时烟雾渲染
- [ ] 物理约束的烟雾模拟

## 引用
```bibtex
@article{SmokeGS2026,
  title={3D Smoke Scene Reconstruction Guided by Vision Priors from Multimodal Large Language Models},
  author={Zheng, Xinye et al.},
  journal={arXiv preprint arXiv:2604.05687},
  year={2026}
}
```

## 标签
#烟雾渲染 #体积渲染 #3D Gaussian Splatting #新视角合成 #散射效应 #NTIRE2026

---
*Created: 2026-04-16*

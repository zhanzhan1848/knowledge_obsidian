# 每日渲染论文搜索报告

## 时间
- 日期: 2026-04-15
- 执行时间: 14:00 UTC

## 搜索范围

### 来源
- arXiv cs.GR (计算机图形学)
- ACM Digital Library
- SIGGRAPH/SIGGRAPH Asia 会议

### 关键词
ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果

### 新增论文 (3 篇)

| # | 论文 | 领域 | 创新性 | 推荐度 |
|---|------|------|--------|--------|
| 1 | NDGI: Neural Dynamic Global Illumination | 全局光照/光照图压缩 | ⭐⭐⭐⭐⭐ | 重点关注 |
| 2 | VVGT: Visual Volume-Grounded Transformer | 体渲染/高斯散点 | ⭐⭐⭐⭐ | 推荐 |
| 3 | Infernux: Python-Native Game Engine | 游戏引擎/Vulkan | ⭐⭐⭐⭐ | 推荐 |

### 领域分布

```
全局光照: 1 篇 (NDGI)
体渲染/高斯散点: 1 篇 (VVGT)
游戏引擎: 1 篇 (Infernux)
```

## 关键发现

### 1. 神经全局光照新突破 - NDGI
- **CVPR 2025 接收**
- 时域光照图神经压缩技术
- 多维特征图 + 轻量神经网络替代显式存储
- 块压缩(BC)模拟策略进一步提升压缩比
- **意义**: 为静态场景的动态光照（如昼夜循环）提供高效GI方案

### 2. 前馈式体渲染新范式 - VVGT
- 首个前馈式3DGS体渲染框架
- Volume Geometry Forcing 极线交叉注意力机制
- 无需每场景优化
- 零样本泛化能力
- **意义**: 订单级 magnitude 加速体数据→3DGS转换

### 3. Python原生游戏引擎 - Infernux
- C++17/Vulkan核心 + Python生产层
- 批量数据桥接 + Numba JIT编译
- 弥合Python脚本与原生引擎性能差距
- **意义**: 降低游戏开发门槛，适合学术研究

## 论文详解

### NDGI: Neural Dynamic Global Illumination

**核心创新**: 时域光照图压缩

**技术路线**:
```
预计算时域光照图集 → 多维特征图 + 神经网络 → 压缩存储
                                                      ↓
实时查询 → VT系统解压缩 → 动态GI输出
```

**关键数据**:
- 大幅降低存储开销
- 仅需适度实时解压缩
- 适合游戏渲染管线

**链接**: [arXiv:2604.12625](https://arxiv.org/abs/2604.12625)

---

### VVGT: Visual Volume-Grounded Transformer

**核心创新**: 前馈式体渲染

**技术路线**:
- 双Transformer处理逐像素光线聚合
- Volume Geometry Forcing 整合多视角观测
- 直接体数据→3DGS映射

**关键数据**:
- orders-of-magnitude 转换加速
- 强大零样本泛化
- 适合医学影像、科学可视化

**链接**: [arXiv:2604.12217](https://arxiv.org/abs/2604.12217)

---

### Infernux: Python-Native Game Engine

**核心创新**: Python + Vulkan JIT加速

**技术路线**:
- pybind11单边界连接Python/C++
- 批量数据桥接减少边界穿越
- Numba JIT编译注解函数→LLVM

**关键数据**:
- MIT开源许可
- 适合快速原型开发
- 着色复杂度有待验证

**链接**: [arXiv:2604.10263](https://arxiv.org/abs/2604.10263)

## 未发现论文

以下关键词在最近24小时内无cs.GR相关新论文：
- ray tracing (无新论文)
- path tracing (无新论文)
- PBR/rasterization (无新论文)
- BVH (无新论文)
- ray marching (无新论文)

## 归档论文清单

本次新增笔记（3篇）:

```
2026-04-15-NDGI_Neural_Dynamic_Global_Illumination.md
2026-04-15-VVGT_Visual_Volume_Grounded_Transformer.md
2026-04-15-Infernux_Python_Native_Game_Engine_JIT.md
```

## 下一步

1. **NDGI**: 评估对现有渲染引擎的集成可行性，传递给 @墨鱼丸
2. **VVGT**: 关注代码发布，评估体数据→3DGS转换管线
3. **Infernux**: 关注开源实现，可用于快速原型验证

---

*由 生菜 (shengcai) 自动生成 @ 2026-04-15 14:00 UTC*

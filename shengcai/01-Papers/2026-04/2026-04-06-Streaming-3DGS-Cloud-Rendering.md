# Streaming Real-Time Rendered Scenes as 3D Gaussians

## 元信息
| 标题 | Streaming Real-Time Rendered Scenes as 3D Gaussians |
| 作者 | Matti Siekkinen |
| 链接 | [arXiv:2604.02851](https://arxiv.org/abs/2604.02851) |
| 日期 | 2026-04-03 |
| 标签 | #渲染 #3DGS #云渲染 #实时渲染 |

## 核心贡献
1. 提出基于 3D Gaussian Splatting (3DGS) 的云渲染方案，流式传输动态场景表示
2. Unity 原型系统，服务器端构建并优化 3DGS 模型
3. 支持重光照 (relighting) 和刚体对象动态

## 技术方案

### 系统架构
```
服务器 → 实时渲染参考视图 → 3DGS 构建 → 流式传输
     ↓
全量快照 + 增量更新
     ↓
客户端 → 本地 Gaussian 模型重建 → 实时渲染
```

### 核心创新
- 替代传统视频流方案，改用 3DGS 场景表示
- 支持视角灵活性，可进行延迟补偿
- 多用户场景建模成本分摊

### 关键指标
- 改进视角灵活性
- 支持延迟补偿的图像空间重投影
- 比传统图像扭曲更好的效果

## 局限性
- 需要持续优化 3DGS 模型
- 网络带宽要求较高

## 相关论文
- 3D Gaussian Splatting (Kerbl et al., 2023)

## 标签
#3DGS #云渲染 #流式传输 #实时渲染

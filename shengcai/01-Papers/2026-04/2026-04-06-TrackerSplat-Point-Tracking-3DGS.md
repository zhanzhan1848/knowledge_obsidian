# Exploiting Point Tracking for Fast and Robust Dynamic 3D Gaussians Reconstruction

## 元信息
| 标题 | Exploiting Point Tracking for Fast and Robust Dynamic 3D Gaussians Reconstruction |
| 作者 | Daheng Yin |
| 链接 | [arXiv:2604.02586](https://arxiv.org/abs/2604.02586) |
| 会议 | SIGGRAPH Asia 2025 |
| 日期 | 2026-04-02 |
| 标签 | #渲染 #3DGS #动态场景 #点追踪 |

## 核心贡献
1. 提出 TrackerSplat，集成点追踪方法增强动态场景重建
2. 处理大规模帧间位移
3. 减少伪影和时序不一致

## 技术方案

### 问题
- 当前动态场景重建方法难以处理大帧间位移
- 快速物体运动导致伪影和时序不一致

### 方法
```python
TrackerSplat = 点追踪模型 + 3DGS

# 流程
1. 使用现成点追踪模型提取像素轨迹
2. 三角化 per-view 像素轨迹到 3D Gaussians
3. 引导 Gaussian 的重定位、旋转和缩放
4. 在训练前准确放置 Gaussians
```

### 核心优势
- 有效处理大位移
- 减少 fading 和 recoloring 伪影
- 并行处理多帧提高吞吐量

## 实验结果
- 在大规模位移的挑战场景中鲁棒
- 并行设置下吞吐量更高
- 保持与 baseline 相当的视觉质量

## 代码
https://github.com/yindaheng98/TrackerSplat

## 相关工作
- 3D Gaussian Splatting
- 点追踪方法 (e.g., TAP-Net)

## 标签
#3DGS #动态场景 #点追踪 #SIGGRAPHAsia

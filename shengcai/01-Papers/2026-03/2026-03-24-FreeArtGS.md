---
tags: [rendering, gaussian-splatting, articulated-objects, novel-view-synthesis, CVPR2026]
date: 2026-03-24
status: 重要
arxiv_id: 2603.22102
venue: CVPR 2026
---

# FreeArtGS: Articulated Gaussian Splatting Under Free-moving Scenario

## 元信息
| 标题 | Articulated Gaussian Splatting Under Free-moving Scenario |
| 作者 | Hongwei Fan et al. |
| 链接 | [arXiv:2603.22102](https://arxiv.org/abs/2603.22102) |
| PDF | [PDF](https://arxiv.org/pdf/2603.22102) |
| 项目页 | [https://freeartgs.github.io/](https://freeartgs.github.io/) |
| 会议 | CVPR 2026 |

## 核心贡献
1. **新设置**: 提出 "free-moving scenario" - 一种简单且高可扩展性的关节物体重建设置，仅需要单目 RGB-D 视频
2. **自由移动部件分割**: 通过优化现成的点跟踪和特征模型，从无约束捕获的相对运动中识别刚性部件
3. **关节估计**: 校准统一的对象到相机姿态，并从部件分割中稳健地恢复关节类型和轴
4. **端到端优化**: 基于 3DGS 的联合优化，同时重建视觉纹理、几何和关节角度

## 技术方案

### 核心思想
- 将关节物体重建分解为三个模块：
  1. 自由移动部件分割（从相对运动识别刚性部件）
  2. 关节估计（恢复关节类型和轴）
  3. 3DGS 端到端优化（重建外观、几何和运动）

### 技术创新点
- **无约束捕获**: 不需要离散的关节状态或轴对齐
- **单目 RGB-D 输入**: 简化设置，提高可扩展性
- **联合优化**: 同时优化纹理、几何和关节角度

## 实验结论
- 在两个基准测试和真实世界自由移动关节物体上表现优异
- 在之前的重建设置中保持高度竞争力
- 证明是现实资产生成的实用有效解决方案

## 与渲染的关联
- **3D Gaussian Splatting**: 使用 3DGS 作为底层表示
- **关节物体渲染**: 支持关节物体的新视角合成
- **实时渲染**: 3DGS 的固有优势

## 局限性
- 论文未明确提及

## 相关工作
[[3D Gaussian Splatting]]
[[Articulated Object Reconstruction]]
[[Novel View Synthesis]]

## 行动建议
✅ **推荐实现**
- 适用于需要关节物体重建的应用
- 3DGS 基础设施可复用
- 优先级：**高**

---
#渲染 #GaussianSplatting #关节物体 #CVPR2026

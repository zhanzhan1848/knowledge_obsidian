# Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision

**arXiv ID**: 2607.25321v1
**日期**: 2026-07-28
**作者**: Yuanzhi Liang, Xiaohua Xie, Jianhuang Lai (Sun Yat-sen University, TeleAI)
**学科**: cs.AI

---

## 核心创新

### 问题
视频扩散模型生成流体时违反物理定律：
- 液体柱在空中断裂
- 倒水时容器水位不上升
- 飞溅方向与冲击方向无关

### 核心贡献

#### 1. 物理仿真流体数据集
- **1,638 个 MPM 仿真视频**：pouring（倾倒）和 sloshing（晃动）
- **2,320 个真实倒水视频**：从库存素材中挖掘
- **参数覆盖**：容器几何、倾斜速度/角度、落水高度、流体体积
- 配合 RAFT 提取光流作为伪标签

#### 2. 双流视频生成架构
- 冻结预训练的 WanEncoder、DiT 和文本编码器
- 添加轻量级 **Optical-Flow Decoder**（仅增加约 2% 参数）
- 通过 **零初始化卷积** 融合到 RGB 流，避免破坏预训练质量
- 联合优化 RGB + Flow 目标

### 关键公式

#### 联合损失
```
L = L_RGB + λ_f * L_flow
L_flow = L_EPE + λ_s * L_smooth
```
- L_EPE: 端点误差 (End-Point Error)
- L_smooth: 光流平滑损失

#### 零卷积融合
```
F_rgb' = F_rgb + conv_zero(F_flow)
```
初始时 conv_zero = 0，保证与预训练一致

---

## 技术细节

### 数据集参数
| 场景 | 参数 |
|------|------|
| Pouring | 6容器 × 3方向 × 3速度 × 3角度 × 3高度 × 3体积 = 1,458 视频 |
| Sloshing | 3×5×3×4 = 180 视频 |
| 真实视频 | 2,320 个库存倒水视频 |

### 模型规模
- 1.3B 和 14B 两种规模
- 仅微调两个 decoder（RGB + Flow）
-  conditioning: 首帧 + 中间帧（第10帧）

### 评估指标
- **VideoPhy-2**: 物理常识评分
- **Video-Quality**: 视频质量
- **EPE**: 光流端点误差（最低 0.54 像素）

---

## 可行性分析：视频扩散 + 流体物理

## 渲染方法
- 类型：神经网络视频生成
- 技术：扩散 Transformer + 光流解码

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（符合物理规律）
- 风格化支持：否

## 性能预期
- 帧率：生成速度取决于底层扩散模型
- GPU 需求：高（14B 模型需大量显存）
- 内存占用：高

## 实现建议
- 着色器复杂度：不适用（纯神经网络）
- 管线要求：预训练视频扩散模型 + 光流头
- 推荐度：✅ 值得关注（物理一致性）

---

## 相关工作链接
- Wan Encoder (视频编码器)
- RAFT (光流估计)
- MPM (物质点法仿真)

**URL**: https://arxiv.org/abs/2607.25321
**标签**: #fluid-video #diffusion #optical-flow #physics-grounded #neural-rendering

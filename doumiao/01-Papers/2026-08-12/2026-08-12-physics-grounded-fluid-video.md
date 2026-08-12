# Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision

## 论文信息
- **arXiv**: https://doi.org/10.48550/arXiv.2607.25321
- **发表**: arXiv cs.AI, 2026-07-28
- **作者**: Ruijie Su et al.
- **主题**: 视频扩散模型 + 物理仿真流体

## 核心创新

### 问题背景
视频扩散模型能生成视觉吸引人的内容，但涉及流体时经常违反基本物理规律：
- 液柱在空中断裂
- 容器水面倒入时不上升
- 飞溅无视动量或重力

原因：大规模视频文本语料库几乎没有显式运动监督，模型学习的是流体外观而非动力学。

### 解决方案：双重贡献

#### 1. 物理仿真流体数据集
- **MPM 仿真视频**: 1,638 个浇注/晃动视频
- **真实视频**: 2,320 个库存镜头筛选的浇注视频
- **测试集**:
  - 1,515 视频真实视频基准
  - 18 prompt 文本到首帧泛化基准

#### 2. 双流 Image-to-Video 架构
- 预训练 Diffusion-Transformer 视频生成器
- **RGB 解码器** (标准)
- **Optical-Flow 解码器** (轻量级新分支)
  - 端点误差 (EPE) 损失
  - 平滑损失
  - 通过零初始化卷积融合到 RGB 流
- 仅更新两个解码器，编码器/时序 Transformer/文本编码器冻结

## 渲染方法
- **类型**: AI 生成 / 神经渲染
- **技术**: 扩散模型 + 光流监督
- **应用**: 流体视频生成

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐
- **物理一致性**: VideoPhy-2 Physical-Commonsense 提升 8.75 分
- **风格化支持**: 可控

## 性能预期
- **EPE (End-Point Error)**: 最低 0.54 像素 (in-distribution)
- **模型规模**: 1.3B 和 14B 两种规模
- **推理速度**: 取决于模型大小

## 实现建议
- **着色器复杂度**: N/A (AI 方法)
- **管线要求**: 扩散模型 + 光流监督
- **推荐度**: ✅

## 关键指标
| 指标 | 提升 |
|------|------|
| VideoPhy-2 Physical-Commonsense | +8.75 分 |
| Video-Quality | +4.65 分 |
| 人类评估 | 盲测更受欢迎 |

## 应用场景
- 影视流体特效预演
- 游戏流体动画
- 数据增强
- 物理教育可视化

## 创新点总结
```
问题: 扩散模型缺乏物理约束
     ↓
解决: 1. MPM 仿真数据集
     2. 双流架构 + 光流监督
     ↓
结果: 内化了连贯运动先验，非表面改善
```

---

tags: #fluid-video #diffusion-model #optical-flow #neural-rendering #physics-grounded #machine-learning

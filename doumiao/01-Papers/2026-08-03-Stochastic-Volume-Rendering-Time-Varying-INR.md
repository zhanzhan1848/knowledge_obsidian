# Query-Efficient Stochastic Volume Rendering for Time-Varying Implicit Neural Volumes

**日期**: 2026-08-03
**arXiv**: [2607.28047](https://arxiv.org/abs/2607.28047)
**会议**: IEEE VIS 2026 (投稿)
**关键词**: 体积渲染, 神经隐式表示, Delta Tracking, 时变数据

---

## 📌 核心创新点

本文提出基于 **Delta Tracking** 的查询高效随机体积渲染框架，直接对时变神经隐式表示(INR)进行交互式渲染，无需重训练或修改原始网络。

### 关键技术突破

1. **四阶段波前渲染管线**
   - 解耦光线遍历与神经推理
   - 利用 RT Core 进行空间遍历
   - 利用 Tensor Core 进行批量神经评估
   - 实现 30-40 FPS @ 1024×1024 (RTX 4090)

2. **自适应光线预算分配**
   - 基于帧间颜色变化感知重要性
   - 高频区域优先采样
   - 保持全时空覆盖率

3. **同质性查询剪枝**
   - 检测近均匀区域
   - 概率性跳过不必要的神经评估
   - 最小化视觉伪影

---

## 🔬 技术细节

### Delta Tracking 机制

Delta Tracking 将异质介质视为密度为 σ̄ 的均匀介质，通过拒绝采样修正：

```
P_real(x_t) = σ_t(x_t) / σ̄
P_null(x_t) = 1 - σ_t(x_t) / σ̄
```

核心思想：将神经评估视为"拒绝采样"，显著减少评估次数。

### 四阶段管线

1. **光线初始化** - 2D CUDA kernel 每像素一线程
2. **遍历阶段** - RT Core 定位宏单元格，Delta Tracking 生成候选碰撞
3. **INR 评估阶段** - Tensor Core 批量评估候选查询
4. **最终化** - 写入帧缓冲，收集统计信息

### 宏单元格构建

- 使用 GPU 并行采样估算标量边界
- 每宏单元格存储 min/max 密度
- 时间维度：T 个预计算网格，线性插值重建
- Ghost Pass：使用余弦形传递函数扫掠标量范围，确保边界细化

---

## 📊 性能指标

| 指标 | 数值 |
|------|------|
| 帧率 | ~30-40 FPS @ 1024² |
| 时间步更新 | ~1-2 ms |
| RTX 4090 性能 | 30.77 FPS |
| 收敛性 | 高保真图像收敛 |

---

## 🎯 与流体渲染的关联

1. **科学体积数据可视化** - 可直接渲染流体模拟的 INR 表示
2. **时变数据支持** - 流体模拟的时间序列
3. **高效渲染** - 避免稠密采样，直接评估神经体积
4. **体积光照** - 适合体积雾、烟、云效果

---

## 🔗 引用

```bibtex
@article{sahistan2026query,
  title={A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes},
  author={Sahistan, Alper and Miao, Haichao and Li, Zhimin and Levine, Joshua A. and Pascucci, Valerio and Bremer, Peer-Timo},
  journal={IEEE VIS 2026},
  year={2026}
}
```

---

## 📁 相关笔记

- [[2026-08-02-Stochastic-Volume-Rendering-Time-Varying-INR]] - 预处理版本
- [[体积渲染]] - 基础技术

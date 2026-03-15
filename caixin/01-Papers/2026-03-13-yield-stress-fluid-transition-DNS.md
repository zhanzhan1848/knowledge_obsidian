# Laminar-to-Turbulent Transition of Yield-Stress Fluids in Pipe and Channel Flows

## 元数据
- **arXiv ID**: 2603.11363
- **提交日期**: 2026-03-11
- **作者**: Shivam Prajapati
- **URL**: https://arxiv.org/abs/2603.11363
- **PDF**: https://arxiv.org/pdf/2603.11363

## 核心创新
**首次**完成屈服应力流体 (Herschel-Bulkley) 从层流到湍流转变的完整 DNS 模拟。

## 关键技术点

### 本构模型
- **Herschel-Bulkley (HB) 模型**
- 屈服应力驱动的塞子区
- 塞子破碎机制
- 近壁湍流结构

### 数值方法
- **DNS**: 直接数值模拟
- **Re_G 范围**: 378 - 5300
- **几何**: 圆管 + 矩形通道

### 转变判据
| 流态 | Re_G 范围 |
|------|-----------|
| 层流 | Re_G < 1735 |
| 过渡 | 1735 < Re_G < 2920 |
| 湍流 | Re_G > 2920 |

## 主要发现

### 圆管流动
1. **低 Re_G**: 强塞子，湍流可忽略
2. **过渡窗口 (Re_G ~ 2000-3000)**: 湍流强度急剧上升
3. **高 Re_G**: 壁面主导湍流，核心减弱

### 转变机制
- 局部雷诺应力超过屈服应力时发生转变
- 与 Carbopol 流体实验趋势一致

## 实验验证计划
- 3.6 m 亚克力通道
- PIV (粒子图像测速)

## 应用价值
- [[非牛顿流体]] 转变预测
- [[工业管道]] 设计
- [[屈服应力流体]] 流态判别

## 相关论文
- [[Herschel-Bulkley 模型]]
- [[Carbopol 流体]]
- [[PIV 测量技术]]

## 标签
#yield-stress #Herschel-Bulkley #DNS #transition #pipe-flow #channel-flow

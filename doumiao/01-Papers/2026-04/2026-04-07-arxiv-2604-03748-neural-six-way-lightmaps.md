---
title: "Real-time Neural Six-way Lightmaps"
arxiv: "2604.03748"
authors: "Tao Huang et al."
date: 2026-04-04
category: [volume rendering, smoke rendering, neural rendering]
tags: [participating media, six-way lightmaps, ray marching, real-time rendering, smoke]
submitted_to: ACM Transactions on Graphics (TOG)
---

# Real-time Neural Six-way Lightmaps

## 论文信息
- **arXiv**: [2604.03748](https://arxiv.org/abs/2604.03748)
- **作者**: Tao Huang
- **发表日期**: 2026-04-04
- **会议**: ACM TOG
- **PDF**: [PDF Link](https://arxiv.org/pdf/2604.03748)

## 核心贡献

### 问题
- 参与介质（烟雾、云、火）在实时渲染中计算代价高昂
- 传统六向光贴图（six-way lightmaps）技术局限于预计算动画和固定视角
- Monte Carlo方法无法满足实时性要求

### 方法
**神经六向光贴图** - 利用屏幕空间引导图预测六向光贴图

1. **引导图生成**: 使用大采样步长的ray marching沿视角方向生成引导图，逼近烟雾结构和轮廓
2. **神经网络预测**: U-Net + 通道适配器，根据引导图预测六向光贴图和透明度图
3. **烟雾深度图**: 构建屏幕空间烟雾深度图用于计算物体投射到烟雾的阴影
4. **游戏引擎集成**: 输出可直接接入Unreal Engine渲染管线

### 关键创新
- **全流程 < 4ms**，比传统MC或学习型3D体渲染方法快一个数量级
- 支持**动态烟雾-障碍物交互**
- 支持**相机移动和光照变化**

## 技术细节

### 体积渲染方程
$$L(\mathbf{x},\omega) = \int_0^z T(\mathbf{x}\leftrightarrow\mathbf{y})[\sigma_a(\mathbf{y})L_e(\mathbf{y},\omega)+\sigma_s(\mathbf{y})L_s(\mathbf{y},\omega)]dy + T(\mathbf{x}\leftrightarrow\mathbf{z})L_o(\mathbf{z},\omega)$$

### 透射率函数
$$T(\mathbf{x}\leftrightarrow\mathbf{y}) = e^{-\int_0^y \sigma_t(\mathbf{x}-s\omega)ds}$$

### 网络架构
- U-Net 结构
- 专用通道适配器（Channel Adapters）
- 输入: 屏幕空间引导图
- 输出: 六向光贴图 + 透明度图

## 应用场景
- 游戏引擎烟雾渲染
- VR/AR 实时参与介质
- 爆炸效果
- 射流效果

## 评估结果
- 在Unreal Engine中实现实时渲染
- 支持动态光照变化
- 与Niagara粒子系统相比，视觉效果显著提升

## 相关工作

### 传统方法
- Ray marching / Delta tracking
- Monte Carlo路径采样
- Virtual Point Lights (VPL)
- Virtual Ray Lights (VRL)

### 学习型方法
- NeRF系列
- Hu et al. (2023) 学习型体渲染

## 关键词
参与介质渲染, 烟雾渲染, 六向光贴图, 神经渲染, Ray Marching, 实时渲染, 游戏引擎

---

*📅 收录日期: 2026-04-07*
*🔍 来源: arXiv cs.GR*

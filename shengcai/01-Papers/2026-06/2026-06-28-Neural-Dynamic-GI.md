---
tags: [渲染, 全局光照, 神经渲染, 光照图, 实时渲染, 2026]
date: [[2026-06-28]]
status: 待深入分析
---

# Neural Dynamic GI: Random-Access Neural Compression for Temporal Lightmaps

## 基本信息

| 标题 | Neural Dynamic GI |
|------|-------------------|
| 作者 | Jianhui Wu, Jian Zhou, Zhi Zhou, Zhangjin Huang, Chao Li |
| 机构 | University of Science and Technology of China, Zhejiang University |
| 链接 | [arXiv:2604.12625](https://arxiv.org/abs/2604.12625) |
| 发表 | arXiv cs.GR (2026-04-14) |

## 核心贡献

1. **首个时序光照图神经压缩框架** - 针对动态光照环境设计
2. **多维特征图 + 轻量神经网络** - 替代显式存储多组光照图
3. **块压缩(BC)模拟策略** - 训练时引入，确保与标准GPU BC格式兼容
4. **虚拟纹理(VT)系统集成** - 支持实时解压和按需加载

## 技术方案

### 问题背景
- 高质量实时GI通常使用预计算光照技术（光照图）
- 动态光照环境需要预计算多组光照图 → 存储和内存开销巨大

### 核心方法
```
时序光照图集 → 多维特征图编码 → 轻量神经解码器 → 实时重建
                              ↑
                      BC模拟策略训练
```

### 关键创新
- **神经压缩**替代传统GPU纹理压缩
- **虚拟纹理系统**管理tile级纹理流和缓存
- **按需解压**大幅降低存储和内存需求

## 实验结论

| 指标 | 结果 |
|------|------|
| 压缩比 | 显著高于PRT和NTC |
| 重建质量 | 优于PRT和NTC |
| 实时计算开销 | 低于NTC |
| 存储效率 | 极高 |

## 实现难度

- **算法复杂度**: 中
- **代码工作量**: 中（需实现神经编码器/解码器+VT集成）
- **依赖项**: 神经网络训练框架、GPU纹理系统

## 适用场景

- 游戏引擎的动态昼夜循环
- 实时渲染中的动态光源变化
- 大规模场景的GI预计算

## 推荐度

⭐⭐⭐⭐ (4/5) - 实用价值高，值得深入研究

## 相关工作

- PRT (Precomputed Radiance Transfer)
- NTC (Neural Texture Compression)
- 虚拟纹理 (Virtual Texturing)

## 链接

- [项目主页](https://magicdawnlab.github.io/)
- [arXiv](https://arxiv.org/abs/2604.12625)

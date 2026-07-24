# EVOLVE: Efficient Learned Volume Compression with Variable-Rate Encoding

**日期**: 2026-07-20  
**类型**: 论文笔记  
**领域**: 体积渲染 / 数据压缩  
**标签**: [[volume rendering]] [[compression]] [[deep learning]] [[scientific visualization]]

---

## 基本信息

| 属性 | 内容 |
|------|------|
| **arXiv** | [2607.18187](https://arxiv.org/abs/2607.18187) |
| **作者** | Kaiyuan Tang et al. |
| **会议** | IEEE VIS 2026 |
| **日期** | 2026-07-20 |
| **主题** | 体积数据压缩 |

---

## 核心贡献

### 1. 大规模跨域数据库
- 构建了包含 **6,376 体积** 的跨域数据库
- 来源于 **21 种科学模拟**
- 通过感知哈希 (perceptual hashing) 确保多样性
- 使模型能够提取跨领域的泛化特征

### 2. Autoencoder 架构优化
重新审视 AE 压缩器的设计空间，引入多种宏观和微观设计：
- 大幅提升表达能力和压缩能力
- 在 vanilla AE 基础上开发 EVOLVE

### 3. 可学习增益机制 - 可变压缩率
- 三阶段训练策略
- 单模型支持连续压缩率调整
- 推理时可灵活控制压缩比

---

## 技术方法

### 解决的问题
- 大规模科学模拟生成的体积数据速率远超存储和网络带宽发展
- 传统压缩器在高压缩比下难以保留细节结构
- 隐式神经表示 (INR) 需要昂贵的逐体积优化且压缩率固定

### 解决方案
- 基于 Autoencoder (AE) 的体积压缩框架
- 针对离线压缩的高压缩比优化
- 跨域泛化能力

---

## 实验结果

- 在多个未见过的科学模拟数据集上验证
- 在相同重建质量下实现远高于传统压缩器的压缩比
- 压缩速度比 INR 方法快**数量级**

---

## 应用场景

- 科学模拟数据存储优化
- 网络传输带宽节省
- 体积数据归档
- VFX/可视化管线

---

## 代码资源

- 项目页面: https://evolve-vis.github.io
- 代码和模型权重已公开

---

## 相关技术

- [[implicit neural representation]]
- [[volume rendering]]
- [[scientific visualization]]
- [[lossy compression]]

---

*由豆苗 🌱 整理 | 2026-07-24*

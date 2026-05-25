---
tags: [几何, polycube, 六面体网格, 深度学习, diffusion]
created: 2026-05-25
---

# PolycubeNet: A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation

## 核心方法

端到端框架，从输入点云直接生成对应 polycube 点云，无需显式表面分割或预定义 polycube 模板。

## 技术架构

**Dual-latent conditional diffusion architecture**:
1. 将计算昂贵的自注意力操作限制在固定容量低维潜在空间
2. 解耦计算复杂度与输入几何和输出 polycube 分辨率
3. 避免了点云自注意力的二次成本

## 流程

```
输入点云 → PolycubeNet → Polycube点云
                          ↓
              刚性和非刚性点云配准
                          ↓
              Polycube-to-Hex流水线
                          ↓
              输出六面体网格
```

## 数据集

发布配对的 CAD meshes 及其对应 polycube meshes 数据集

## 实验结果

- 泛化到任意 genus 的复杂 CAD 模型
- 秒级生成高质量 polycube 结构
- 在稳健性和效率上优于先前学习方法

## 开源参考

- 代码即将开源
- 项目页面待定

## 与墨鱼丸共享

**相关性**: 高 - 直接解决六面体网格生成问题
**实现建议**: 可与 libigl 的 polycube 映射功能结合
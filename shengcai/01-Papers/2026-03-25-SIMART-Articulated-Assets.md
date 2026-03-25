---
title: Decomposing Monolithic Meshes into Sim-ready Articulated Assets via MLLM
authors: Minghan Qin et al.
date: 2026-03-25
source: arXiv cs.CV (cross-list to cs.GR)
url: https://arxiv.org/abs/2603.23386
pdf: https://arxiv.org/pdf/2603.23386
tags: [rendering, paper, 2026, articulated-assets, MLLM, 3D-generation, robotics, sim-ready]
status: unread
---

# Decomposing Monolithic Meshes into Sim-ready Articulated Assets via MLLM

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Decomposing Monolithic Meshes into Sim-ready Articulated Assets via MLLM |
| 作者 | Minghan Qin et al. |
| 来源 | arXiv cs.CV / cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.23386) |
| PDF | [下载](https://arxiv.org/pdf/2603.23386) |

## 核心贡献
1. **SIMART 框架**：统一 MLLM 框架，联合执行部件级分解和运动学预测
2. **Sparse 3D VQ-VAE**：引入稀疏3D VQ-VAE，将令牌数量减少70%对比密集体素令牌
3. **Sim-ready 资产生成**：从单体网格生成可直接用于物理模拟的关节化3D资产

## 技术方案
高质量关节化3D资产对于具身AI和物理模拟至关重要，但3D生成仍聚焦于静态网格。现有方法依赖多阶段流水线，误差在解耦模块间累积。统一 MLLM 提供单阶段路径，但密集体素令牌化导致长序列和高内存开销。

**核心创新**：
- 统一 MLLM 框架：单阶段生成
- Sparse 3D VQ-VAE：大幅减少令牌数量
- 高保真多部件组装

## 公式
```math
# VQ-VAE 量化
z_q = argmin_z ||z_e - z||

# 令牌减少率
Reduction = (N_dense - N_sparse) / N_dense * 100%

# 其中：
# z_e - 编码器输出
# z_q - 量化向量
# N_dense - 密集令牌数
# N_sparse - 稀疏令牌数
```

## 代码
```python
# 概念性伪代码
class SIMART:
    def __init__(self):
        self.sparse_vqvae = Sparse3DVQVAE()
        self.mllm = MLLM()
    
    def encode_mesh(self, mesh):
        # 稀疏编码
        sparse_tokens = self.sparse_vqvae.encode(mesh)
        return sparse_tokens  # 减少70%令牌
    
    def decompose_and_predict(self, tokens):
        # 部件分解 + 运动学预测
        parts, kinematics = self.mllm.generate(tokens)
        return parts, kinematics
    
    def generate_sim_ready_asset(self, mesh):
        # 端到端生成
        tokens = self.encode_mesh(mesh)
        parts, kinematics = self.decompose_and_predict(tokens)
        return ArticulatedAsset(parts, kinematics)
```

## 实验结论
- **数据集**：PartNet-Mobility 和 AIGC 数据集
- **性能**：SOTA 性能
- **应用**：支持基于物理的机器人模拟
- **优势**：
  - 令牌数量减少70%
  - 高保真多部件组装
  - 可扩展到复杂关节对象

## 局限性
- 依赖 MLLM 的推理能力
- 对于极端复杂结构可能有限制
- 训练数据质量影响效果

## 可行性分析
- **实现难度**：较高
  - 需要实现 Sparse 3D VQ-VAE
  - MLLM 训练和推理需要大量资源
- **性能预期**：优秀
  - 高质量资产生成
  - 支持物理模拟
- **适用场景**：
  - 具身AI
  - 机器人仿真
  - 游戏资产生成
  - 虚拟环境构建

## 相关工作
- [[3D Generation]]
- [[MLLM]]
- [[VQ-VAE]]
- [[Articulated Objects]]
- [[Embodied AI]]

## 笔记
- **提交日期**：2026-03-24
- **关键词**：关节化资产、MLLM、3D生成、机器人、模拟就绪

### 技术亮点
1. Sparse 3D VQ-VAE 大幅减少计算开销
2. 统一框架避免多阶段误差累积
3. 直接生成物理模拟就绪的资产

### 应用前景
- 机器人学习
- 虚拟训练环境
- 游戏开发
- 数字孪生

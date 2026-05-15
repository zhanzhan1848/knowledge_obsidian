# Mistletoe: Speculative Decoding 加速崩溃攻击

## 元信息
| 标题 | Mistletoe: Stealthy Acceleration-Collapse Attacks on Speculative Decoding |
|------|------|
| 作者 | Shuoyang Sun, Chang Da, Hao Fang, Kuofeng Gao, Xinhao Zhong, Yi Sun, Fan Mo, Shu-Tao Xia, Bin Chen |
| 链接 | [原文](https://arxiv.org/abs/2605.14005) |
| arXiv | arXiv:2605.14005 |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. 发现 speculative decoding 的**机制级漏洞**：drafter-target 不匹配创造隐藏攻击面
2. 提出 **Mistletoe**，一种针对 speculative decoding 的隐密加速崩溃攻击
3. 引入**零空间投影机制**，在抑制草稿接受率同时最小化语义漂移
4. 实验证明可大幅降低平均接受长度τ，崩溃加速效果，同时保持输出质量和困惑度

## 背景：Speculative Decoding
```
- 目标模型：精确保守
- Drafter模型：快速草稿生成
- 验证机制：并行验证多个候选token
- 效率依赖：平均接受长度 τ（每个验证步骤存活的草稿token数）
```

## 攻击机制

### 问题根源
Drafter 被训练来近似目标模型分布，但这种近似不可避免地不完美，导致 drafter-target 不匹配。

### Mistletoe 优化目标
```math
\min_θ \quad L_deg(θ) - λ ⋅ L_sem(θ)
```
- **降解目标 L_deg**：降低 drafter-target 一致性
- **语义保持目标 L_sem**：约束目标模型输出分布
- **λ**：平衡参数

### 零空间投影机制
将降解梯度投影到局部语义保持方向的零空间：
```math
g_proj = g_deg - (g_deg · v_sem / ||v_sem||²) ⋅ v_sem
```
- 抑制草稿接受
- 最小化语义漂移

## 实验结果
- 在多种 speculative decoding 系统上验证
- 大幅降低平均接受长度 τ
- 崩溃加速，降低平均token吞吐量
- 保持输出质量和困惑度

## 安全启示
- Speculative decoding 引入了超越现有输出鲁棒性的机制级攻击面
- 需要更鲁棒的 LLM 加速系统设计
# IterCOMP: Iterative Prompt Compression for Multi-hop QA

## 元信息
| 标题 | IterCOMP: Reasoning-aware Adaptive Prompt Compression for Multi-hop Question Answering |
|------|-----|
| 作者 | JungMin Yun 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.13588) |
| arXiv | arXiv:2608.13588 |
| 会议 | ACL 2026 Main Conference |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **IterCOMP**：统一的训练无关提示压缩框架，集成多跳推理于迭代压缩循环
2. **问题**：现有提示压缩为单轮查询设计，无法捕获相互依赖的推理步骤
3. 三阶段迭代：
   - 文档分解为证据段
   - 评估问题可答性
   - 生成有针对性的后续问题以迭代整合必要证据

## 方法
```
IterCOMP 循环：
1. 文档 → 证据段分解
2. 评估问题可答性
3. 生成后续问题
4. 迭代整合必要证据
5. 输出紧凑推理导向提示
```

## 实验结果
MusiQue, 2WikiMultiHopQA, HotpotQA：
- **EM 和 F1 大幅提升**
- **Token 预算减少**
- 优于现有 baseline
- 随推理复杂度增加保持鲁棒

## 核心优势
- 无需训练
- 多跳推理感知
- 迭代式证据整合
- 推理复杂度增加时鲁棒

## ACL 2026 论文
- DOI: https://doi.org/10.18653/v1/2026.acl-long.1559

## 局限性
- 依赖问题分解质量
- 迭代次数可能影响效率

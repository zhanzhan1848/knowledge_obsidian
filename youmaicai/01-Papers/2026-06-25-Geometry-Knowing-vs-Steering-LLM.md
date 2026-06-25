# Perfect Detection, Failed Control: The Geometry of Knowing vs. Steering in Language Models

## 元信息

| 标题 | Perfect Detection, Failed Control: The Geometry of Knowing vs. Steering in Language Models |
|------|-------|
| 作者 | Cosimo Galeone, Anna Ettorre, Minsu Park, Giuseppe Ettorre, Daniele Ligorio |
| 链接 | [原文](https://arxiv.org/abs/2606.24952) |
| arXiv | arXiv:2606.24952 |
| 类别 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-06-23 |

## 核心贡献

1. **关键发现**：检测行为的方向与控制行为的方向在激活空间中几乎正交（cos ≈ 0.12，约 83°）
2. **验证方法**：在 Gemma 2-2B-it 上测试输出格式控制（JSON vs markdown）和幻觉检测
3. **跨模型泛化**：在 4 个模型、3 个家族、2 种规模（1B-9B）中，cos 均在 [0.12, 0.20] 范围内
4. **根源在预训练**：指令微调前后该角度几乎不变（0.1197 vs 0.1200）
5. **15° 旋转部分桥接gap**：在两个 held-out fake-entity 类别上分别达到 73% 和 60% 拒绝率（FPR 1.8%）

## 方法

### 核心概念
- **Detection direction**: 最好检测某个行为方向的激活向量
- **Control direction**: 最好控制/引发该行为方向的激活向量
- **Detection-intervention gap**: 两个方向之间的夹角余弦

### 实验设计
- Gemma 2-2B-it（主要模型）
- Output format task: clean JSON vs markdown fencing
- Hallucination task: fake entity detection + refusal

## 关键结果

| 实验 | Detection AUC | cos(检测, 控制) | 含义 |
|------|--------------|----------------|------|
| Output format | - | ≈ 1.0 | 检测=控制 |
| Hallucination (Gemma 2-2B) | 1.000 (layer 5+) | 0.12 | 检测≠控制 |
| 跨模型泛化 (1B-9B) | - | [0.12, 0.20] | 普遍现象 |

### Rotation experiment
- 15° rotation toward refusal direction
- 73% / 60% refusal on two held-out fake-entity categories
- 1.8% false positive rate

## 局限性

- cos 值不能预测可控性（检测是高维类，不是单一方向）
- 只测试了 1B-9B 规模模型
- Rotation 干预效果有限

## 建议

- **是否推荐使用**：是（重要理论发现）
- **适用场景**：Mechanistic interpretability 研究；LLM 可控性研究
- **备注**：对 "知道→就能控制" 的隐含假设提出了根本性质疑，对可控 AI 研究有重要影响
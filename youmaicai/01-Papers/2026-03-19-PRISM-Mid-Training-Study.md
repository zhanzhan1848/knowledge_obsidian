# PRISM: Demystifying Retention and Interaction in Mid-Training

## 元信息
| 标题 | PRISM: Demystifying Retention and Interaction in Mid-Training |
|------|--------------------------------------------------------------|
| 作者 | Bharat Runwal, Ashish Agrawal, Anurag Roy, Rameswar Panda |
| 链接 | [arXiv:2603.17074](https://arxiv.org/abs/2603.17074) |
| arXiv | arXiv:2603.17074v1 |
| 领域 | cs.LG (Machine Learning) |
| 日期 | 2026-03-17 |

---

## 核心贡献

### 1. 大规模系统性研究
- **模型覆盖**: 7 个基础模型
  - 4 个模型家族: Granite, LLaMA, Mistral, Nemotron-H
  - 2 种架构: Dense Transformer, Attention-Mamba Hybrid
  - 规模: 3B - 24B 参数

### 2. Mid-training 的显著收益
使用约 **27B 高质量 tokens** 进行 mid-training:

| 任务 | 性能提升 |
|------|---------|
| Math | +15 to +40 points |
| Code | +5 to +12 points |
| Science | +6 to +13 points |
| General | 保持性能 |

### 3. PRISM → RL 流水线效果
- 宏观平均从 <12 提升到 29-42 (3-4x 改进)
- 直接对基础模型应用 RL 效果显著较差 (AIME 分数接近 0)

### 4. 关键发现：数据组合在 Mid-training 最重要
- Mid-training 阶段包含科学数据 → RL 阶段 GPQA-Diamond +17-28 points
- 改变 RL 数据组合 → <2 points 差异
- **结论**: 数据组合策略在 mid-training 阶段起决定性作用

---

## 机制分析

### 权重修改模式

| 阶段 | 权重修改比例 | 修改模式 |
|------|-------------|---------|
| Mid-training | >90% | 密集重构 |
| RL | ~5% | 稀疏、前置精炼 |

### 表示分析 (CKA)
- RL 一致性保持 mid-training 的表示几何结构
- CKA > 0.998 跨架构

### RL 的依赖性
- RL 无论起点如何应用相同的权重变化
- **仅**在 mid-trained 模型上成功
- Mid-training 将模型置于 RL 可有效改进的配置

---

## 训练方法

### Mid-training 策略
```
Base Model (3B-24B)
    ↓
Mid-training (~27B high-quality tokens)
    ├── Math data
    ├── Code data
    └── Science data ← 关键！
    ↓
RL Fine-tuning
    └── 稀疏权重更新 (~5%)
```

### 数据组合重要性排序
1. **Science data** - 解锁 RL 阶段的 GPQA-Diamond 增益
2. Math data
3. Code data
4. General data

---

## 实验结果

### 6 个推理基准的宏观平均

| 配置 | 分数 |
|------|------|
| Base Model | <12 |
| Base + RL | ~0 (AIME) |
| Mid-training + RL | 29-42 |
| 提升 | 3-4x |

### GPQA-Diamond 性能
- 无 Science data mid-training: 基线
- 有 Science data mid-training: +17-28 points
- 改变 RL 数据组合: <2 points 差异

---

## 实践指导

### 训练流水线设计建议

1. **优先 Mid-training**
   - 投入更多资源在 mid-training 数据质量
   - 确保包含多样化的领域数据（特别是 science）

2. **RL 作为精炼阶段**
   - RL 主要做稀疏、精细调整
   - 不要期望 RL 补救 mid-training 的不足

3. **Retention-aware 设计**
   - Mid-training 密集重构权重，需注意灾难性遗忘
   - RL 保持表示几何结构，相对安全

---

## 局限性

1. **Token 数量**: 仅测试了 ~27B tokens，其他规模的效果未验证
2. **模型规模**: 最大 24B，更大模型的 behavior 可能不同
3. **任务范围**: 主要关注推理任务，其他任务（如创意写作）可能不同

---

## 建议

- **是否推荐**: ✅ 强烈推荐
- **适用场景**:
  - LLM 训练流水线设计
  - 推理能力增强
  - 训练成本优化
- **关键洞察**: 
  - Mid-training 是"重活"，RL 是"精修"
  - 数据组合在 mid-training 决定 RL 上限

---

## 引用

```bibtex
@article{runwal2026prism,
  title={PRISM: Demystifying Retention and Interaction in Mid-Training},
  author={Runwal, Bharat and Agrawal, Ashish and Roy, Anurag and Panda, Rameswar},
  journal={arXiv preprint arXiv:2603.17074},
  year={2026}
}
```

---

*Created by youmaicai (🥬) - 2026-03-19*

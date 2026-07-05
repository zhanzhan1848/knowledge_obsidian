# Online Safety Monitoring for LLMs

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Online Safety Monitoring for LLMs |
| **arXiv** | [2607.02510](https://arxiv.org/abs/2607.02510) |
| **作者** | Mona Schirmer et al. |
| **分类** | cs.AI, cs.CL, cs.LG |
| **发表** | 2026-07-02 |
| **会议** | ICML 2026 Hypothesis Testing Workshop |

## 核心贡献

1. **问题**: 尽管经过对齐训练，LLM 在部署时仍容易生成不安全输出

2. **简单实时 monitor**: 将外部模型的验证器信号通过阈值处理转换为警报决策

3. **风险控制校准阈值**: 阈值通过风险控制校准

4. **竞争力证明**: 在数学推理和红队数据集上的实验表明，这种简单设计与基于序贯假设检验的更先进 monitor 相比具有竞争力

## 方法

### Monitor 设计
```
Verifier Signal → Thresholding → Alarm Decision
```

### 特点
- 简单实时监控
- 基于风险控制的阈值校准
- 无需复杂假设检验

## 实验

### 数据集
- 数学推理数据集
- 红队数据集

### 结果
- 与更先进的序贯假设检验 monitor 竞争力相当

## 建议

- **是否推荐使用**: 是
- **适用场景**: LLM 安全监控、部署安全、实时安全评估
- **相关方向**: LLM Safety, Alignment, Runtime Monitoring, Responsible AI

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*

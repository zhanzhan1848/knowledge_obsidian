# Large Reasoning Models Struggle to Transfer Parametric Knowledge Across Scripts

## 元信息
| 标题 | Large Reasoning Models Struggle to Transfer Parametric Knowledge Across Scripts |
|------|--------------------------------------------------------------------------------|
| 作者 | Lucas Bandarkar, Alan Ansell, Trevor Cohn |
| 链接 | [arXiv:2603.17070](https://arxiv.org/abs/2603.17070) |
| arXiv | arXiv:2603.17070v1 |
| 领域 | cs.CL, cs.AI |
| 日期 | 2026-03-17 |

---

## 核心贡献

### 1. 识别跨语言知识迁移的主要障碍
**关键发现**: 跨语言知识迁移的差距主要是**文字系统屏障 (Script Barrier)**，而非语言或语系差异。

### 2. 观测性数据分析
- **数据集**: ECLeKTic 和 MultiLoKo（包含世界各地的本地知识）
- **回归分析**: 在控制模型能力和问题难度后
  - **文字匹配** (script match) 是知识迁移失败的主要预测因子
  - 语言家族不是主要因素

### 3. 实体提示验证
- 向 LLM 提供问题关键实体的源语言形式
- **结果**: 对跨文字问题的改进效果不成比例地大
- 支持"文字屏障"假说

### 4. SFT 改进方法
- 开发合成生成管道设计 SFT 样本
- 鼓励模型在推理时更好地处理音译歧义
- **结果**: 教授两个模型更好地推理，减少跨文字迁移差距

---

## 方法论

### 分析框架
```
观测分析
    ├── ECLeKTic 数据集
    └── MultiLoKo 数据集
        ↓
回归分析
    ├── 控制变量: 模型能力, 问题难度
    └── 预测变量: Script match vs Language family
        ↓
结论: Script 是主要障碍
```

### 改进策略
```
合成 SFT 样本生成
    ├── 音译歧义场景
    └── 参数知识获取推理
        ↓
训练模型
    ↓
评估跨文字迁移
```

---

## 核心发现

### 文字屏障效应
| 因素 | 对迁移失败的影响 |
|------|----------------|
| Script match | **主要预测因子** |
| Language family | 次要 |
| Model capability | 控制后仍有 script 效应 |

### 改进方法效果
- 提供 key entities 的源语言形式 → 不成比例改进跨文字问题
- SFT 训练音译歧义推理 → 减少跨文字迁移差距

---

## 实践意义

### 对多语言 LLM 开发
1. **关注文字系统**: 跨语言迁移问题应优先考虑文字而非语言家族
2. **音译处理**: 需要更好的音译歧义处理机制
3. **Post-training 改进**: 可通过 SFT 改善跨文字迁移

### 对数据策略
- 训练数据应覆盖更多文字系统
- 音译对齐数据可能有助于缓解问题

---

## 局限性

1. 仅测试 reasoning models，其他类型模型可能不同
2. SFT 样本生成方法可能不适用于所有语言对
3. 长期效果和泛化性需进一步研究

---

## 建议

- **是否推荐**: ✅ 推荐
- **适用场景**:
  - 多语言 LLM 开发
  - 跨语言知识迁移研究
  - 低资源语言处理
- **关键洞察**: 
  - 文字 > 语言家族作为迁移障碍
  - Post-training 有改进潜力

---

## 引用

```bibtex
@article{bandarkar2026cross,
  title={Large Reasoning Models Struggle to Transfer Parametric Knowledge Across Scripts},
  author={Bandarkar, Lucas and Ansell, Alan and Cohn, Trevor},
  journal={arXiv preprint arXiv:2603.17070},
  year={2026}
}
```

---

*Created by youmaicai (🥬) - 2026-03-19*

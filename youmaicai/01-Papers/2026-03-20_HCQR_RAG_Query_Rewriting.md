# HCQR: Hypothesis-Conditioned Query Rewriting for RAG

## 元信息
| 属性 | 值 |
|------|------|
| 标题 | Hypothesis-Conditioned Query Rewriting for Decision-Useful Retrieval |
| 作者 | Jong Chul Ye et al. |
| 链接 | [arXiv:2603.19008](https://arxiv.org/abs/2603.19008) |
| arXiv | arXiv:2603.19008 |
| 日期 | 2026-03-19 |
| 类别 | cs.CL, cs.AI, cs.LG |
| 代码 | [Anonymous Repo](https://anonymous.4open.science/r/HCQR-1C2E) |

## 核心贡献
1. **HCQR框架**: 无训练的预检索查询重写
2. **证据导向检索**: 从主题检索转向证据检索
3. **三重查询策略**: 支持/区分/验证假设
4. **决策增强**: 直接服务于答案选择

## 模型架构
### HCQR流程
```
输入问题 + 候选选项
        │
        ↓
   生成工作假设
        │
        ├─→ 查询1: 支持假设的证据
        ├─→ 查询2: 区分竞争假设的证据
        └─→ 查询3: 验证问题中的显著线索
        │
        ↓
    多查询检索
        │
        ↓
   证据聚合与决策
        │
        ↓
   确认/推翻初始假设
```

### 核心组件
1. **假设生成器**: 从问题和选项生成轻量工作假设
2. **查询重写器**: 三种类型的证据查询
3. **证据聚合器**: 整合多源证据

## 训练方法
- **训练无关**: 无需额外训练
- **即插即用**: 可与任何RAG系统集成
- **预检索**: 在检索前重写查询

## 实验结果
### MedQA基准
- **vs Simple RAG**: +5.9 平均准确率提升

### MMLU-Med基准
- **vs Simple RAG**: +3.6 平均准确率提升
- **vs Re-rank/Filter基线**: 显著优势

### 关键发现
1. 单查询RAG倾向于检索背景信息
2. HCQR检索决策相关证据
3. 三重查询策略有效区分竞争选项

## 局限性
- 增加检索次数(3x)
- 依赖假设生成质量

## 建议
- **是否推荐使用**: 是
- **适用场景**:
  - 医学问答系统
  - 多选题决策
  - 需要证据支持的RAG

## 技术细节
### RAG检索问题
| 方法 | 检索倾向 | 问题 |
|------|----------|------|
| 单查询RAG | 主题相关 | 无法区分选项 |
| HCQR | 证据导向 | 直接支持决策 |

### 三重查询策略
```python
queries = {
    "support": "寻找支持假设H的证据",
    "distinguish": "寻找区分H与竞争假设的证据",
    "verify": "验证问题中显著线索的证据"
}
```

## 相关链接
- [[rag-systems]]
- [[query-rewriting]]
- [[medical-qa]]
- [[evidence-based-retrieval]]

# IdiomX: A Multilingual Benchmark for Idiom Understanding, Retrieval, and Interpretation

## 元信息
| 标题 | IdiomX: A Multilingual Benchmark for Idiom Understanding, Retrieval, and Interpretation |
|------|-----|
| 作者 | Ayman Ali Sharara |
| 链接 | [原文](https://arxiv.org/abs/2606.02584) |
| arXiv | arXiv:2606.02584 |
| 发表 | 2026-06-03 |
| 领域 | cs.CL, cs.AI, cs.IR |
| 代码 | [GitHub](https://github.com/) + HuggingFace + Kaggle |

## 核心贡献
1. **IdiomX 数据集**：大规模多语言成语理解 benchmark，包含：
   - 超过 **190K** 上下文示例
   - 涵盖 **12K+** 个成语
   - 覆盖语言：英语、阿拉伯语、法语
   - 包含成语/字面用法标签和丰富语言元数据

2. **四任务统一 benchmark**：
   - Idiom Detection（成语检测）
   - Context-to-Idiom Retrieval（上下文→成语检索）
   - Arabic-to-English Idiom Retrieval（阿英跨语言检索）
   - Idiom Interpretation（成语解释）

3. **构建流程**：多阶段 pipeline 结合：
   - 词汇资源提取
   - 大规模标准化
   - 控制性 LLM 富化
   - 结构化验证

## 方法细节

### 数据集特点
- **多语言对齐**：英、阿、法三种语言的语义表示对齐
- **标签体系**：成语/字面用法标签
- **语言元数据**：丰富的语言学标注

### 评估任务
1. **成语检测**：识别文本中的成语用法
2. **上下文→成语检索**：给定上下文找到对应成语
3. **阿英跨语言检索**：阿拉伯语→英语 成语检索
4. **成语解释**：将成语解释为语义检索任务（引入可解释性维度）

## 实验结果
- **成语检测**：Contextual transformer 模型显著提升检测性能
- **检索任务**：Hybrid retrieval + reranking 架构显著提升单语言和跨语言检索
- **成语解释**：可被有效建模为语义检索任务

## 核心创新点
- 首次提出从检测→检索→语义解释的完整成语理解 benchmark
- 引入可解释性作为互补评估维度
- 模块化框架可扩展到更多语言和比喻推理任务

## 标签
#NLP #multilingual #idiom #benchmark #retrieval #transformer
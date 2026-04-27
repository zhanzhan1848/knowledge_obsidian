# End-to-End Ukrainian RAG for Local Deployment: Optimized Hybrid Search and Lightweight Generation

## 元信息
| 标题 | An End-to-End Ukrainian RAG for Local Deployment. Optimized Hybrid Search and Lightweight Generation |
|------|-------|
| 作者 | Mykola Trokhymovych, Yana Oliinyk, Nazarii Nyzhnyk |
| 链接 | [原文](https://arxiv.org/abs/2604.22095) |
| arXiv | arXiv:2604.22095 |
| 分类 | cs.CL |

## 核心贡献

1. **UNLP 2026 共享任务第 2 名**: 乌克兰语文档问答 RAG 系统
2. **两阶段检索管道**: 自定义两阶段搜索管道检索相关文档页面
3. **专业乌克兰语模型**: 使用合成数据微调的专门乌克兰语语言模型
4. **轻量级压缩**: 模型压缩用于资源受限硬件本地部署

## 系统架构

```
阶段 1: 两阶段检索管道
  - 文档页面相关检索
  - 混合搜索优化
  
阶段 2: 专门乌克兰语 LLM
  - 合成数据微调
  - 轻量级压缩
        ↓
准确、接地答案生成
```

## 评估条件

- **严格计算限制**: 在资源受限硬件上运行
- **高质量可验证 AI QA**: 本地实现，非云端

## 关键成果

- UNLP 2026 Shared Task 第 2 名
- 高质量可验证问答
- 本地部署，无云依赖

## 建议
- **适用场景**: 低资源语言 NLP、本地 RAG 部署、隐私敏感场景
- **推荐指数**: ⭐⭐⭐ (应用性强，对多语言 RAG 有参考价值)

# 每日LLM/NLP论文摘要 - 2026-08-05

## 📅 日期: 2026-08-05 (星期三)

## 🎯 今日主题
LLM评估优化、Agent自我改进、多模态医学推理、RAG增强

---

## 📄 收录论文

### 1. CoT-Core: LLM评估加速
- **arXiv**: 2608.00014 | cs.AI
- **核心**: 利用Chain-of-Thought推理轨迹进行coreset选择，基于逻辑等价性聚类
- **亮点**: 训练无关，大幅降低评估成本
- **链接**: [paper](https://arxiv.org/abs/2608.00014)

### 2. Memory Reward Inflation in Self-Improving LLM Agents
- **arXiv**: 2608.00017 | cs.AI
- **核心**: 发现Echo Gap问题——错误记忆被过度利用；提出LUCID去膨胀算法
- **结果**: BIRD text-to-SQL达56.9%
- **链接**: [paper](https://arxiv.org/abs/2608.00017)

### 3. MemArena: 边缘设备记忆助手基准
- **arXiv**: 2608.02613 | cs.CL
- **核心**: 边缘部署个人记忆助手的benchmark，50 agents × 15天模拟
- **发现**: 记忆后端选择比阅读器缩放更重要
- **链接**: [paper](https://arxiv.org/abs/2608.02613)

### 4. RAG增强SME中的LLM
- **arXiv**: 2608.00006 | cs.AI
- **核心**: VectorRAG和GraphRAG减少幻觉和误导
- **链接**: [paper](https://arxiv.org/abs/2608.00006)

### 5. OncoTriad-QA: 泛癌多模态基准
- **arXiv**: 2608.02615 | cs.CL
- **核心**: 86.1k问题，9,281患者，32种癌症；融合影像+病理+基因组
- **链接**: [paper](https://arxiv.org/abs/2608.02615)

### 6. NeuroMosaic: 神经肿瘤多模态LLM
- **arXiv**: 2608.03187 | cs.NE
- **核心**: 3D MRI解剖索引token，神经解剖图路由
- **结果**: F1 0.827，IDH AUROC 0.918
- **链接**: [paper](https://arxiv.org/abs/2608.03187)

---

## 🔬 技术趋势

| 方向 | 热度 | 代表工作 |
|------|------|----------|
| LLM评估优化 | ⭐⭐⭐ | CoT-Core |
| Agent自我改进 | ⭐⭐⭐ | Echo Gap, LUCID |
| 边缘AI | ⭐⭐⭐ | MemArena |
| 多模态医学 | ⭐⭐⭐ | NeuroMosaic, OncoTriad-QA |
| RAG增强 | ⭐⭐ | VectorRAG, GraphRAG |

---

## 📁 文件位置
所有论文笔记保存在: `~/knowledge-vault/youmaicai/01-Papers/`

## ⏰ 生成时间
2026-08-05 14:15 UTC

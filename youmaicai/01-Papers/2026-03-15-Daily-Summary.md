# 2026-03-15 LLM/NLP 论文日报

## 📊 搜索概况
- **搜索时间**: 2026-03-15 14:21 UTC
- **搜索范围**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG)
- **时间窗口**: 最近 72 小时 (3/12-3/15)
- **获取论文**: 15 篇
- **筛选入库**: 7 篇（新增）+ 1 篇（已存在）

## 🥬 今日精选论文

### 1. EndoCoT: Chain-of-Thought 推理在扩散模型中的扩展
- **arXiv**: [2603.12252](https://arxiv.org/abs/2603.12252)
- **关键词**: `#Chain-of-Thought` `#Diffusion` `#MLLM` `#reasoning`
- **亮点**: 首次在扩散模型中实现内生 CoT 推理，平均准确率 92.1%
- **笔记**: [[2026-03-12-EndoCoT-Chain-of-Thought-Diffusion]]

### 2. SciMDR: 科学多模态文档推理基准
- **arXiv**: [2603.12249](https://arxiv.org/abs/2603.12249)
- **关键词**: `#multimodal` `#scientific-reasoning` `#dataset`
- **亮点**: 300K QA 对 + 20K 科学论文，synthesize-and-reground 框架
- **笔记**: [[2026-03-12-SciMDR-Scientific-Multimodal-Document]]

### 3. EBFT: 基于能量的语言模型微调
- **arXiv**: [2603.12248](https://arxiv.org/abs/2603.12248)
- **关键词**: `#fine-tuning` `#energy-based` `#feature-matching`
- **亮点**: 特征匹配目标，匹配 RLVR 并超越 SFT
- **笔记**: [[2026-03-12-EBFT-Energy-Based-Fine-Tuning]] (已存在)

### 4. Reasoning LLMs-as-Judges: LLM 后训练中的推理判断器
- **arXiv**: [2603.12246](https://arxiv.org/abs/2603.12246)
- **关键词**: `#LLM-alignment` `#reasoning-models` `#RLHF`
- **亮点**: 揭示 reasoning judges 的双刃剑效应，需警惕对抗性输出
- **笔记**: [[2026-03-12-Reasoning-LLMs-as-Judges]]

### 5. SNA: 可分离神经架构
- **arXiv**: [2603.12244](https://arxiv.org/abs/2603.12244)
- **关键词**: `#neural-architecture` `#tensor-decomposition` `#language-modeling`
- **亮点**: 跨域统一原语，混沌系统与语言自回归的结构类比
- **笔记**: [[2026-03-12-SNA-Separable-Neural-Architectures]]

### 6. STAMP: 任务感知的文本隐私机制
- **arXiv**: [2603.12237](https://arxiv.org/abs/2603.12237)
- **关键词**: `#differential-privacy` `#text-privacy` `#EACL2026`
- **亮点**: Polar Mechanism 仅扰动嵌入方向，保留语义邻域
- **笔记**: [[2026-03-12-STAMP-Text-Privacy]]

### 7. Neural Thickets: 预训练权重周围的任务专家密度
- **arXiv**: [2603.12228](https://arxiv.org/abs/2603.12228)
- **关键词**: `#pretraining` `#post-training` `#ensemble`
- **亮点**: 大模型预训练权重邻域密集存在任务专家，简单随机采样即可
- **笔记**: [[2026-03-12-Neural-Thickets-Task-Experts]]

### 8. Idea-Catalyst: LLM 驱动的跨学科创新
- **arXiv**: [2603.12226](https://arxiv.org/abs/2603.12226)
- **关键词**: `#LLM` `#scientific-discovery` `#interdisciplinary`
- **亮点**: 新颖性 +21%，洞察力 +16%，增强创造性推理
- **笔记**: [[2026-03-12-Idea-Catalyst-Interdisciplinary]]

## 📈 趋势分析

### 本日热点主题
1. **LLM 推理与对齐** (3 篇)
   - Chain-of-Thought 在多模态/扩散中的应用
   - Reasoning models 作为判断器
   - 跨学科创新辅助

2. **微调与后训练** (2 篇)
   - 能量-based 微调
   - 预训练权重邻域的任务专家

3. **多模态与文档理解** (1 篇)
   - 科学文档推理基准

4. **神经架构设计** (1 篇)
   - 可分离架构统一

5. **隐私保护** (1 篇)
   - 任务感知的文本隐私

## 🔗 相关 MOC
- [[00-MOC/LLM-Research-MOC|LLM 研究地图]]
- [[00-MOC/Training-Methods-MOC|训练方法地图]]
- [[00-MOC/Multimodal-MOC|多模态地图]]

## 📝 备注
- 由于 Web Search API 限流，本次直接使用 arXiv API 查询
- 周末 arXiv RSS 不更新，但 API 仍可获取最近提交
- EBFT 笔记已存在，未重复创建

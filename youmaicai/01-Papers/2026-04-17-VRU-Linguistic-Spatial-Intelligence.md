# How Do LLMs and VLMs Understand Viewpoint Rotation Without Vision?

## 基本信息
- **arXiv**: [2604.15294](https://arxiv.org/abs/2604.15294) [cs.AI]
- **作者**: Zhen Yang, Ping Jian, Zhongbin Guo et al.
- **发表**: 2026-04-16
- **会议**: **ACL 2026 Main Conference**
- **代码**: [GitHub](https://github.com/Young-Zhen/VRU_Interpret)

## 核心贡献

### VRU 任务 (Viewpoint Rotation Understanding)
从纯语言视角研究空间智能：
- 给定文本描述的视点旋转和观察
- LLM/VLM 需推断最终视点并预测对应观察
- 无视觉输入，仅靠语言智能

### 可解释性分析
1. **Layer-wise Probing Analysis**：逐层探测分析
2. **Head-wise Causal Intervention**：逐头因果干预

## 关键发现

### 性能差距
- LLMs 和 VLMs 在 VRU 上表现均差
- 人类轻松达到 100% 准确率
- **模型与人类能力存在重大差距**

### 机制洞察
- 模型在隐藏状态中编码视点信息
- 但无法将视点位置与对应观察绑定
- 在最终层产生幻觉

### 选择性微调
- 通过因果干预识别关键注意力头
- 选择性微调这些头
- 改善 VRU 性能
- 避免灾难性遗忘通用能力

## 方法论

### 探测分析
逐层检查模型如何编码视点信息

### 因果干预
- 逐一干预注意力头
- 识别对 VRU 任务关键的头

### 选择性微调
仅微调关键注意力头而非整个模型

## 局限性
- 仅限文本-only 设置
- VRU 任务可能无法完全覆盖空间智能

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：LLM/VLM 可解释性、空间推理、语言智能
- **创新点**：首个从纯语言视角研究空间智能的工作

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | LLM 可解释性与空间推理*

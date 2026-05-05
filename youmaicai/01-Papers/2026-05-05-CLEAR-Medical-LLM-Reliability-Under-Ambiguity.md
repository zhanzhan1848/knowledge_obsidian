# CLEAR: Revealing How Noise and Ambiguity Degrade Reliability in LLMs for Medicine

## 元信息
| 标题 | CLEAR: Revealing How Noise and Ambiguity Degrade Reliability in LLMs for Medicine |
|------|------|
| 作者 | Kevin H. Guo, Chao Yan, Avinash Baidya, Katherine Brown, Xiang Goa, Juming Xiong, Zhijun Yin, Bradley A. Malin |
| 链接 | [原文](https://arxiv.org/abs/2605.01011) |
| arXiv | arXiv:2605.01011 |
| 会议/期刊 | - |

## 核心贡献

1. **CLEAR 框架**：提出 CLinical Evaluation of Ambiguity and Reliability，系统评估医学 LLM 在决策空间呈现、歧义性和不确定性下的表现
2. **三大发现**：
   - 增加候选答案数量会同时损害正确识别和正确拒绝能力
   - 拒绝选项的语义措辞（"None of the Above" vs "I don't know"）显著影响模型谨慎程度
   - 提出" humility deficit"（谦逊缺口）概念：随模型规模增大而恶化
3. **17 个 LLM 系统评估**：覆盖多种医学基准

## CLEAR 框架设计

### 三维扰动
1. **候选答案数量**：从少到多变化
2. **Ground Truth/弃权选项存在性**：控制是否有正确答案或弃权选项
3. **语义措辞变化**：
   - Assertive rejection: "None of the Above"
   - Uncertainty admission: "I don't know" (IDK)

### 基准数据集
- 3 个医学基准 × 17 个 LLM

## 关键发现

### 1. 答案数量增加 → 可靠性下降
- 更多候选答案同时导致：
  - 正确识别正确答案的能力下降
  - 正确拒绝错误答案的能力下降

### 2. 弃权措辞效应
- 从 assertive rejection ("None of the Above") 转向 uncertainty admission ("I don't know") 时，模型谨慎程度降低
- **仅在答案空间中加入 IDK 选项就增加了错误选择率**

### 3. Humility Deficit 随规模恶化
- 提出 humility deficit = 正确答案识别能力与错误拒绝能力之间的性能差距
- 随着模型规模增大，这个缺口反而增大
- **意味着 scaling 无法解决 LLM 的可靠性问题**

## 局限性
- 基准测试为简化考试风格，未反映真实世界医学查询的复杂性

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：医学 LLM 评估、AI 辅助医疗决策
- **关键洞察**：Scaling 不能解决 LLM 可靠性问题，模型规模增大时 humility deficit 反而增大

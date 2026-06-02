# 🥬 Consilium Protocol: Multi-Model AI Deliberation

## 基本信息
- **标题:** Emergent Collaborative Deliberation in Multi-Model AI Systems: A BFT-Derived Protocol for Epistemic Synthesis
- **作者:** VD Doske
- **链接:** [arXiv:2606.00005](https://arxiv.org/abs/2606.00005)
- **arXiv:** arXiv:2606.00005
- **分类:** cs.AI

## 核心贡献

1. **Consilium Protocol** — 一种 BFT 启发的多模型 AI 协商架构，将模型间分歧视为认知信号而非错误
2. **认知人格工程** — 将语言模型的"身份"与"推理方式"分离，为模型分配认知人格
3. **In-Sample/Out-of-Sample 验证框架** — 从量化金融借鉴，用于区分训练数据共识与经验 grounded 的结论

## 关键发现

1. **认知人格决定认知行为** — 免费边缘推理模型（$0.0002/batch）与前沿模型（$10.69/batch）产生可比的分析输出，人格而非底层模型决定行为
2. **RLHF 对齐产生可测量的认知盲点**
   - 争议政策话题比确定科学话题少 12.3% 的对抗性挑战
   - AI 安全话题显示非对称偏见（Δ=11.6%）：模型更强烈地挑战"AI 是危险的"这一说法
3. **协议无方向偏见** — 移民话题 Δ=2.3%，可再生能源 Δ=1.2%
4. **样本外证据检索** — 验证 239 个 claims，100% 证据检索率，发现 167 个训练数据协商中不可见的盲点

## 方法细节

- **Cognitive Persona**: 分离模型"是什么"与"如何推理"
- **In-Sample/Out-of-Sample Validation**: 区分训练数据共识 vs 经验 grounded 结论
- **1,478 次协商会话**，32 个话题，10 个领域类别
- **可重复性**: 随机 model×persona 分配的标准差 ±2.2%

## 局限性

- 协议规范以 MIT 许可证发布，支持独立验证
- RLHF 对齐产生的认知盲点表明模型安全对齐的复杂性

## 建议
- **推荐程度:** ⭐⭐⭐⭐⭐
- **适用场景:** AI 安全、对齐研究、多模型决策系统

---
*2026-06-02 收录自 arXiv cs.AI*
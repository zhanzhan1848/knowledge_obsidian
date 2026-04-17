# 🥬 LLM 论文分析：HUOZIIME - On-Device LLM-enhanced Input Method

## 基本信息
- **作者**: Baocai Shan, Yuzhuang Xu, Wanxiang Che
- **发表**: arXiv (cs.CL / cs.AI)
- **链接**: [原文](https://arxiv.org/abs/2604.14159)
- **arXiv**: arXiv:2604.14159
- **代码**: [GitHub](https://github.com/Shan-HIT/HuoziIME)
- **公告日期**: 2026-04-17

## 核心贡献
1. 提出 **HUOZIIME**：首个完全端侧运行的个性化 LLM 输入法
2. **后训练策略**：在合成个性化数据上 post-train base LLM，赋予初始类人预测能力
3. **分层记忆机制**：持续捕获和利用用户输入历史
4. 针对端侧 LLM 部署的系统级优化（mobile constraints 下高效运行）

## 核心创新
- **个性化数据合成**：无需大量真实用户数据
- **分层记忆**：短周期 + 长周期用户历史
- **端侧优化**：内存占用、推理延迟、功耗优化

## 代码开源
`https://github.com/Shan-HIT/HuoziIME`

## 建议
- **是否推荐使用**: ✅ 是
- **适用场景**: 端侧 AI、移动输入法、个性化 NLP

---

标签: #on-device-LLM #personalization #input-method #mobile #privacy-preserving

# iFLYTEK-Embodied-Omni Technical Report

## 元信息
| 标题 | iFLYTEK-Embodied-Omni Technical Report |
|------|---------------------------------------|
| 作者 | Yuan Zhang, Jingfei Ni, Guanchen Lu, et al. (iFLYTEK) |
| 链接 | [原文](https://arxiv.org/abs/2607.02542) |
| arXiv | arXiv:2607.02542 |
| 类别 | cs.AI, cs.CV |
| 发表 | 2026-06-24（提交），2026-07-07（RSS 更新）|

## 核心贡献
1. **统一多模态基础模型**：在单一 Omni 框架下联合建模 vision（视频+图像）、language 和 action
2. **共享多模态自注意力**：各模态组件（VLM, VGM, AGM）通过共享多模态自注意力通信
3. **脑-小脑协作架构**：
   - **高层大脑**：VLM + VGM 负责指令理解、任务规划、进度追踪、未来视觉状态预测
   - **低层小脑**：AGM 负责将子目标和多模态上下文转换为可执行 action chunks
4. **四阶段训练策略**：逐步训练 VLM → VGM → AGM → 联合微调

## 架构设计
```
┌─────────────────────────────────────────┐
│         Shared Multimodal               │
│         Self-Attention                 │
├─────────────┬──────────────┬────────────┤
│     VLM     │     VGM      │    AGM    │
│  (Brain)    │   (Brain)    │(Cerebellum)│
│  Vision+    │   Video      │  Action    │
│  Language   │ Generation   │ Generation │
└─────────────┴──────────────┴────────────┘
```

## 训练数据
- 动作标注的 embodied 视频
- 无动作的 embodied 视频（人类演示 + 机器人交互）
- embodied reasoning + embodied perception 数据
- 通用图像-文本数据

## 核心创新点
- 端到端联合建模视觉、语言、动作，而非 cascaded pipeline
- 避免"先合成未来观测再推断动作"的接口瓶颈和误差累积
- 视频生成模型用于未来状态预测

## 相关方向
- [[多模态大模型]]
- [[具身智能]]
- [[视觉-语言-动作模型]]
- [[世界模型]]
- [[Video Generation]]

---
*🥬 多模态具身智能 - 视觉-语言-动作联合建模的统一框架*

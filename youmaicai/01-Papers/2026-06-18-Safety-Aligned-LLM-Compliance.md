# What Do Safety-Aligned LLMs Learn From Mixed Compliance Demonstrations?

## 元信息

| 属性 | 内容 |
|------|------|
| 标题 | What Do Safety-Aligned LLMs Learn From Mixed Compliance Demonstrations? |
| 作者 | Sihui Dai, et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2606.20508) |
| arXiv | arXiv:2606.20508 |
| 领域 | cs.AI, cs.LG |
| 发表 | 2026-06-18 |

## 核心贡献

1. **系统性分析上下文演示对 LLM 安全的影响**：混合良性演示（无害请求+有帮助响应）与有害演示（有害请求+有帮助响应）
2. **三个假设验证**：研究演示组成如何驱动有害遵从行为
3. **Preference Optimization 的关键作用**：偏好优化是防止良性演示增加有害遵从行为的关键训练阶段
4. **演示顺序的近因偏差**：演示顺序存在强烈的近因偏差（recency bias）
5. **拒绝格式的 ICL 差异**：不同模型在拒绝时与 ICL 的交互方式不同

## 实验设计

### 演示类型
- **良性遵从演示**：无害请求 + 有帮助响应
- **有害遵从演示**：有害请求 + 有帮助响应

### 测试假设
1. 混合演示如何影响有害遵从？
2. 演示顺序是否影响行为？
3. 偏好优化如何调节 ICL 效果？

## 关键发现

| 发现 | 描述 |
|------|------|
| 良性/有害演示不可互换 | 良性演示可减少或增加有害遵从，取决于模型 |
| Preference Optimization 关键 | 偏好优化阶段防止良性演示增加有害遵从 |
| Recency Bias | 演示顺序有强烈近因偏差 |
| 拒绝格式 ICL 差异 | 部分模型采纳演示格式即使在拒绝时，部分覆盖所有 ICL 信号 |

## 实践意义

- 在 RLHF / SFT 中使用演示时需要注意组成和顺序
- 偏好优化阶段是安全对齐的关键防线
- ICL jailbreaking 攻击的机制取决于多个因素

## 关键词

#LLM-safety #RLHF #in-context-learning #jailbreaking #preference-optimization #alignment

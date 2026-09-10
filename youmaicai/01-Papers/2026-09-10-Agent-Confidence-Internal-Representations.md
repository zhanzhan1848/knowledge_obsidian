# 🥬 LLM 论文分析：Agent Confidence Calibration

## 基本信息
- **标题**: Do Agents Know When They Succeed? Calibrating Agent Confidence from Internal Representations
- **作者**: Priyanka Mary Mammen et al.
- **链接**: [arXiv:2609.09448](https://arxiv.org/abs/2609.09448)
- **arXiv**: arXiv:2609.09448v1
- **类别**: cs.AI

## 核心贡献

1. **Latent Trajectory Dynamics (LTD)**: 总结交互轨迹中残差流表示的变化
2. **Action Representation Probe (ARP)**: 从动作决策时形成的表示预测成功

## 核心洞察

- 现有方法依赖表面信号（生成内容、序列特征）进行置信度校准
- Agentic 工作流有复杂失败模式（规划、工具调用、动态环境交互）
- 内部表示提供更强的事后任务成功信号

## 方法

**LTD**:
- 跟踪残差流表示在交互轨迹中的变化
- 捕捉 Agent 推理过程的动态特征

**ARP**:
- 在动作决策点插入探针
- 从该点表示预测任务最终成功

## 实验结果

- 三个交互基准: Bash, SQL, Python
- 三个模型族: Qwen14B, Qwen7B, DeepSeek6.7B
- **始终优于表面级生成和序列级校准基线**
- 零开销：无需修改提示、无需多样本 rollout

## 局限性

- 探针需要额外训练
- 对新任务/领域的零样本泛化待验证

## 建议
- **是否推荐使用**: 是（对安全关键应用）
- **适用场景**: Agent 可信度监控、主动请求人类介入
- **亮点**: 首次利用内部表示进行 Agent 置信度校准，方法简洁有效

---

标签: #LLM-Agent #置信度校准 #内部表示 #Agent安全 #可解释性

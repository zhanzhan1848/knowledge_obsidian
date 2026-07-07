# Object-Centric Environment Modeling for Agentic Tasks

## 元信息
| 标题 | Object-Centric Environment Modeling for Agentic Tasks |
|------|-----------------------------------------------------|
| 作者 | Yiyang Li, Tianyi Ma, Zehong Wang, et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.02846) |
| arXiv | arXiv:2607.02846 |
| 类别 | cs.AI |
| 发表 | 2026-07-03 |

## 核心贡献
1. **OCM 方法**：提出 Object-Centric Environment Modeling，用可执行的对象中心环境模型组织 agent 经验
2. **双代码库设计**：
   - **Object Knowledge**：将环境实体和机制定义为 Python 类
   - **Procedure Knowledge**：记录可复用的交互模式（必须导入和使用 object model）
3. **在线学习**：每轮 episode 后，OCM 反思轨迹、更新两个知识库、验证所有 procedure 是否可执行
4. **渐进知识披露**：agent 先检查紧凑的代码签名，仅在需要时读取源代码

## 架构
```
OCM = {
  Object Knowledge (Python classes)
  Procedure Knowledge (interaction patterns)
}

在线循环:
  Episode → Reflect → Update Knowledge → Verify Procedures
                   ↓
  Future: Progressive Knowledge Disclosure
```

## 实验结果
- 在 benchmarks 上获得最佳平均排名
- 减少 invalid actions
- 证明 agent 可从构建对象中心环境模型中受益

## 与相关工作对比
| 方法 | 问题 |
|------|------|
| Free-form textual memory | 难以维护、验证和复用 |
| Symbolic approaches | 存储局部过程或假设简化动力学 |
| OCM | 对象中心可执行环境模型 + 在线验证 |

## 相关方向
- [[LLM Agent]]
- [[世界模型]]
- [[Agent Memory]]
- [[Object-Centric]]
- [[Symbolic Reasoning]]

---
*🥬 LLM Agent - 通过对象中心可执行环境模型增强 Agent 经验组织*

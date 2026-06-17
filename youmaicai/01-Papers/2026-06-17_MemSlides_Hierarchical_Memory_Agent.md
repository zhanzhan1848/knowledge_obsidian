# MemSlides: Hierarchical Memory Driven Agent for Personalized Slide Generation

## 元信息
| 标题 | MemSlides: A Hierarchical Memory Driven Agent Framework for Personalized Slide Generation with Multi-turn Local Revision |
|------|-----|
| 作者 | Ye Jin, Yangyang Xu, Jun Zhu, Yibo Yang |
| 链接 | [原文](https://arxiv.org/abs/2606.17162) |
| arXiv | arXiv:2606.17162 |
| 领域 | cs.CL, cs.HC, cs.MA |

## 核心贡献
1. 提出 **MemSlides**：分层记忆框架，分离长期记忆和工作记忆
2. 长期记忆进一步分为**用户画像记忆**和**工具记忆**
3. 结合 scoped slide-local revision，精准更新影响区域而非重生成整个演示文稿

## 核心问题
- 个性化演示文稿生成需要更多条件：跨任务保留稳定用户偏好、多轮修订中保留新引入的偏好和约束、可靠局部编辑

## 方法
### MemSlides 架构
#### 长期记忆
- **用户画像记忆**：存储 intent-conditioning profiles，用于 round-0 个性化
- **工具记忆**：存储可复用执行经验，用于可靠局部编辑

#### 工作记忆
- 跨修订轮次携带活跃偏好和会话约束

#### Scoped Slide-Local Revision
- 精准更新作用于最小影响区域
- 不重复重生成整个演示文稿

### 记忆设计
```
Long-term Memory
├── User Profile Memory (intent-conditioned profiles)
└── Tool Memory (reusable execution experience)
Working Memory (active preferences + session constraints)
```

## 实验结果
### 用户画像记忆
- 多角色多意图画像库上提升 persona-alignment 判断

### 工具记忆注入
- 诊断匹配对设置中改善闭环修改行为

### 工作记忆
- 定性案例说明跨偏好延续能力

## 结论
- 有效个性化演示文稿创作依赖于分离：
  - 持久用户画像
  - 会话级工作记忆
  - 跨生成和局部修订的可复用执行经验

## 关键词
`LLM Agent` `Memory` `Personalization` `Presentation Generation` `Hierarchical Memory` `MemSlides
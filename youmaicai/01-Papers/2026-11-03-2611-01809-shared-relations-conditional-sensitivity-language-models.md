# Shared relations, specific choices: conditional sensitivity and competing pathways in language models

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Shared relations, specific choices: conditional sensitivity and competing pathways in language models |
| 作者 | Kaixiang Shu |
| 链接 | [原文](https://arxiv.org/abs/2611.01809) |
| arXiv | arXiv:2611.01809 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-01 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **受控实体绑定实验揭示共享关系表征**：在 GPT-2 Small、Qwen2.5-1.5B、Llama-3.2-1B 上发现一个**低维（low-dimensional）关系背景（relational background）**，该成分在跨查询角色（query roles）间** predominantly shared**，并且**可迁移到未见过的名称（transfers to new names）**。
2. **「共享方向 ≠ 可迁移功能符号」的关键区分**：在 Qwen2.5 中固定模型权重，训练均值关系向量与编辑剂量（edit dose）在**二元选择**与**词汇映射**这两类答案词表不同的提示上产生**相反的选择效应**；由此提出用**跨属性—查询组合的下游敏感度阶乘对比**来局部确定共享方向的有符号选择增益。
3. **竞争通路的机制刻画**：晚期分量钳制（late-component clamps）表明 Llama3.2 中，仅经过被选注意力路径的**负向传递**会被**同时经过注意力与 MLP 集合的路径的正向传递**部分抵消；源坐标分析证明分布式因子覆盖（distributed factor coverage），隐藏接收者读出（hidden-receiver readouts）揭示布局依赖的组合，实例几何干预把**响应方向与幅度**分离。

## 问题背景
「跨查询共享的关系表征如何驱动查询特定的选择」是实体绑定（entity binding）与概念组合的核心机制问题。此前的工作往往默认：一个被识别的关系向量（如「红」）在所有上下文中都带有固定的正负作用方向，因此可以简单地用 steering vector / activation patching 干预。但这一默认假设可能不成立——同一个关系成分在不同答案词表、不同提示格式下可能产生**方向相反**的行为效应。此外，用某一任务的表征去干预另一任务（迁移性）究竟说明了什么？摘要指出，需要把「表征的可迁移性」与「功能的可迁移符号性」明确区分开。已有工作也缺乏对多个竞争性内部通路的联合刻画：一次干预的净效应可能是正负通路的叠加，单看残差流难以归因。

## 方法
### 1. 受控实体绑定实验
- 被试模型：**GPT-2 Small、Qwen2.5-1.5B、Llama-3.2-1B**（三个模型，规模与家族各异）。
- 任务构造：受控的实体绑定场景，模型需在若干属性域（attribute domains）间做选择。
- **低维关系背景（low-dimensional relational background）**的发现：
  - 跨 query roles ** predominantly shared**（在不同查询角色间共享）；
  - **transfers to new names**（可迁移到训练/测试中未出现的新名称）；
  - **Same-domain interactions persist when another attribute domain is queried**（当查询另一个属性域时，同域的交互效应依然存在）。
- 消融：移除该共享成分后，模型的输出对比（output contrasts）显著减弱。

### 2. 关系方向恢复实验（restoring independently trained relation directions）
- 移除共享成分后，分别注入**独立训练得到的关系方向**。
- 对照组设计：**sign-reversed（符号反转）** 与 **equal-norm random（等范数随机）** 控制组。
- 结果：在**全部三个模型**上，注入独立训练方向都能把输出对比**恢复到比符号反转或等范数随机对照更接近原始值**的水平。
- 推论：共享关系背景中确实**编码了关系方向**，而不仅仅是相关成分。

### 3. 「共享 ≠ 符号可迁移」的实验（Qwen2.5，权重固定）
- 固定 Qwen2.5 模型权重，使用**训练均值关系向量（training-mean relation vector）** 与**编辑剂量（edit dose）** 进行干预。
- 两类提示：
  - **binary（二元）提示**：答案词表为二元选择；
  - **lexical-mapping（词汇映射）提示**：答案词表不同。
- 结果：相同的关系向量与编辑剂量在两类提示上产生**相反的选择效应（opposite selection effects）**。
- 由此提出度量方式：**跨属性—查询组合的下游敏感度阶乘对比（factorial contrast of downstream sensitivities across attribute-query combinations）**，用于确定共享方向的**局部有符号选择增益（local signed selection gain）**。

### 4. 八条件协议下的局部增益符号
- 独立的 **eight-condition protocol**。
- 结果：**mean local gain 在 Qwen2.5 为正，在 Llama3.2 为负**。
- 说明同一套关系背景在不同模型家族中的默认符号并不一致。

### 5. 竞争通路分解（late-component clamps）
- 通过对**晚期分量**（late components）做钳制（clamp），隔离不同内部通路的贡献。
- Llama3.2 中的结构：
  - **attention-only paths**（仅经过选中注意力集合的路径）贡献**负向传递（negative transmission）**；
  - **paths traversing both selected attention and MLP sets**（同时穿过注意力与 MLP 集合的路径）贡献**正向传递（positive transmission）**；
  - 二者相互竞争，负向部分被正向部分**部分抵消（partially offset）**。

### 6. 源坐标 / 接收者 / 几何分析
- **Source-coordinate analyses**：证明**分布式因子覆盖（distributed factor coverage）**——关系成分并非局限在单一坐标/单一 token。
- **Hidden-receiver readouts**：揭示**布局依赖的组合（layout-dependent combination）**——下游接收者如何读取该成分取决于其在残差流布局中的位置。
- **Instance-geometry interventions**：把**响应方向（response direction）与幅度（amplitude）**分离，证明干预效应不是单纯的幅度缩放。

## 实验结果
### 共享成分的性质
| 性质 | 结论 | 覆盖模型 |
|------|------|----------|
| 低维关系背景存在 | 是 | GPT-2 Small / Qwen2.5-1.5B / Llama-3.2-1B |
| 跨 query roles 共享 | predominantly shared | 三模型 |
| 迁移到新名称 | 支持 | 三模型 |
| 跨属性域持久 | 支持 | 三模型 |

### 方向恢复对照实验
| 条件 | 输出对比恢复程度 |
|------|--------------------|
| 独立训练关系方向 | **最接近原始值（全部三个模型）** |
| sign-reversed 控制 | 更差 |
| equal-norm random 控制 | 更差 |

### 局部增益符号
| 模型 | 八条件协议 mean local gain |
|------|---------------------------|
| Qwen2.5 | **正（positive）** |
| Llama3.2 | **负（negative）** |

### 符号反转现象
| 模型 | 提示类型 | 同一方向+剂量的效应 |
|------|----------|----------------------|
| Qwen2.5（权重固定） | binary | 效应 A |
| Qwen2.5（权重固定） | lexical-mapping | **效应 −A（相反）** |

### Llama3.2 通路分解
| 通路类型 | 传递符号 |
|----------|----------|
| attention-only paths | 负向（negative） |
| attention + MLP 路径 | 正向（positive，抵消部分负向） |

## 关键洞察
1. **「表征可迁移」与「功能符号可迁移」是两件事**：同一个低维关系方向在 Qwen2.5 上对二元与词汇映射提示给出**相反**的选择效应，说明用表征相似性来推断功能方向是不可靠的；必须实测**下游敏感度的阶乘对比**才能得到有符号的局部增益。
2. **净效应不等于单一通路的效应**：Llama3.2 的负向增益其实是「attention-only 负通路」与「attention+MLP 正通路」相互抵消后的残差。只做整体干预或整体残差流探针会把两个通路混为一谈，late-component clamp 是必要的归因手段。
3. **跨模型符号不一致（Qwen2.5 正 / Llama3.2 负）提示：关系方向不宜跨模型迁移**。这解释了为什么在某一模型上提取的 steering vector 迁到另一模型常常失效——不是表示不同，而是功能符号约定不同。
4. **方向与幅度可分离**这一发现，使「干预是否真的改变了决策方向」这一问题可以在不做完整输出对比的情况下单独回答。

## 局限性
- 摘要未给出：低维背景的确切维度数、关系方向的提取方式（PCA？差异对比？）、编辑剂量的具体取值与扫描范围、输出对比的具体指标与数值、n 统计量与显著性检验。
- 实验限于三个小/中模型（GPT-2 Small、Qwen2.5-1.5B、Llama-3.2-1B），能否外推到前沿大模型未知。
- 实体绑定任务为受控合成任务，摘要未说明与真实自然语言任务的差距。
- 「factorial contrast of downstream sensitivities」这一新度量的具体定义与稳健性未在摘要中展开。
- 八条件协议与主实验之间的样本量、可复现性细节缺失。

## 适用场景
- 机制可解释性：分析实体绑定、属性组合等语言现象的内部实现通路。
- Activation steering / representation editing 的方法学：说明为何需要实测符号而非假设符号。
- 跨模型迁移 steering vector 的诊断：符号反转是常见失败模式。
- 理解「共享表征 + 查询特定选择」如何同时成立（条件敏感性与竞争通路的统一视角）。

## 相关工作
[[Mechanistic Interpretability]] [[Activation Steering]] [[Entity Binding]] [[Residual Stream]] [[Representation Engineering]] [[GPT-2]] [[Qwen]] [[Llama]]

---
#LLM #Research #mechanistic-interpretability #entity-binding #arXiv-2611

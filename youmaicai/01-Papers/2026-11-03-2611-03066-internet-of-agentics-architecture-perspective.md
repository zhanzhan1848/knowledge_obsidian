# Towards a Trustworthy and Governable Internet of Agentics: An Architectural Perspective on Protocols, Systems, and Services

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Towards a Trustworthy and Governable Internet of Agentics: An Architectural Perspective on Protocols, Systems, and Services |
| 作者 | Haoyi Xiong, Yi Liu, Jiang Bian, Peng Diao, Bin Zhu, Tingting Hu, Yi Wang, Sumi Helal |
| 链接 | [原文](https://arxiv.org/abs/2611.03066) |
| arXiv | arXiv:2611.03066 |
| 类别 | cs.AI, cs.DC |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 7 |

## 核心贡献
1. **提出「Internet of Agentics（IoA）」视角**：把异构 agent 视为**可治理的服务参与者（governable service participants）**，而非仅仅是独立的模型端点——这是本文的组织性概念贡献。
2. **三层演进图景**：从当今**碎片化的 agent 生态**，到**可互操作（interoperable）的 agent**，最终到**可信且可治理的自主性（trustworthy and governable autonomy）**。
3. **协议栈系统梳理**：以 **Agentic AI Foundation** 为中心的协议体系——**MCP**（agent–tool 交互）、**A2A**（agent–agent 协调）、**AGENTS.md 与 Skills 式过程清单（procedural manifests）**，以及发现、传输与信任机制（**AGNTCY**、**SLIM**）。
4. **系统抽象综述**：逻辑 agent 架构、编排模式（orchestration patterns）、网关、注册中心（registries）、运行时控制回路（runtime control loops）、硬件感知的推理基础设施。
5. **服务计算视角的统一**：论证 agentic 系统在**认知能力（cognitive capabilities）**这一层面上重新解释了 SOA / 微服务中的经典议题——发现、组合、治理、定价与信任。

## 问题背景
LLM 应用正日益被组织为**工具调用与多 agent 工作流**，而不是孤立的聊天界面。这一转变带来了一个新的架构问题：agent 可以推理、调用工具、委派工作，但**可依赖的部署**仍然要求跨框架、跨运行时、跨数据边界、跨组织控制域的互操作性。现有的讨论要么停留在单 agent 的提示工程，要么停留在单一协议（如仅 MCP）的工具接入层面，缺少一个把协议、系统与服务治理三个层面统一起来的架构视角。同时，当 agent 开始"代表组织行动"时，传统的治理机制（身份、审计、计费、责任归属）缺少适配认知型主体的语义基础。

## 方法
本文是一篇**perspective paper（视角/立场论文）**，采用综述与架构组织的方法而非新的算法或实验。核心分析装置是"Internet of Agentics"这一服务计算视角，方法可分解为三层递进的文献—架构映射：

### 第一层：协议栈（Protocol Stack）
以 **Agentic AI Foundation** 为中心的协议生态被拆成四个职能槽位：

- **agent ↔ tool**：**MCP**（Model Context Protocol）——规范 agent 如何调用工具与访问外部资源；
- **agent ↔ agent**：**A2A**（Agent-to-Agent）——规范 agent 之间的协调与委派；
- **procedural manifests**：**AGENTS.md** 与 **Skills 式清单**——把"怎么做"（过程性知识）从"能做什么"（能力描述）中分离出来，以声明式文件形式随 agent 分发；
- **发现、传输与信任**：**AGNTCY**（发现与目录）与 **SLIM**（安全、低延迟的消息传输）。

这一层的方法论要点是：把 agent 交互拆解为与网络协议同构的**功能分层**（发现 → 传输 → 语义 → 过程），从而可以直接复用互联网协议栈的成熟工程经验。

### 第二层：系统抽象（Systems Abstractions）
把 agent 做成可部署的**服务组件**所需的抽象清单：

- **逻辑 agent 架构**（logical agent architecture）：agent 的内部职责划分；
- **编排模式**（orchestration patterns）：如分层、路由、并行/串行协作；
- **网关**（gateways）：协议转换、鉴权、限流；
- **注册中心**（registries）：agent 的注册与发现；
- **运行时控制回路**（runtime control loops）：运行时的心跳、健康检查、生命周期；
- **硬件感知的推理基础设施**（hardware-aware inference）：把 agent 的推理负载与异构硬件资源匹配。

### 第三层：服务计算（Services Computing）
将前两层重新定位到经典服务计算的关切上，并**以认知能力而非确定性函数为新的服务基本单元**，重新表述五个经典问题：

| SOA / 微服务经典关切 | 在 agentic 系统中的重述 |
|------|------|
| 发现（Discovery） | 如何发现具备某种认知能力的 agent |
| 组合（Composition） | 如何把非确定性的认知能力编排为端到端流程 |
| 治理（Governance） | 如何治理自主决策的主体 |
| 定价（Pricing） | 如何为认知能力（而非确定的函数调用）计费 |
| 信任（Trust） | 如何在多组织控制域间建立 agent 间信任 |

## 实验结果
**本文不包含实验。** 作为视角/综述论文，摘要未给出任何定量结果、基准测试或评测数据；其贡献是概念框架与文献组织。

## 关键洞察
1. **把 agent 视为"服务参与者"而非"模型端点"，是解决治理问题的关键转向**：一旦 agent 被赋予发现、组合、定价、信任这五个服务原语，自主性就不再是一个只能靠"安全护栏"外加约束的黑箱属性，而可以复用二十年积累的服务治理工程学。
2. **AGENTS.md / Skills 把"过程"提升为一等协议资产**：现有协议层（MCP/A2A）覆盖的是能力与通信，而 agent 间的真正差异往往在**过程性知识**（如何完成任务）。这一区分是从"连接智能体"走向"协同智能体"的必要补充。
3. **"认知能力"作为服务契约的粒度问题被明确提出但未解决**：一个"能做推理的 agent"与"能做特定领域推理的 agent"在发现、定价和 SLA 上差异巨大，而这个粒度契约如何标准化正是综述留白的开放问题——这既是该视角的价值所在，也是它目前最脆弱的环节。

## 局限性
- **视角论文，无实证验证**：所有主张均为文献综合与概念论证，没有原型实现、基准或案例研究来检验该三层架构的可行性。
- **覆盖面依赖作者选择**：协议栈清单（MCP、A2A、AGNTCY、SLIM 等）反映的是当前生态快照，随生态演进会迅速过时；对 AG-UI、UCP 等其他候选标准的讨论摘要未涵盖。
- **治理机制多为概念性讨论**：身份、计费、责任归属在 agent 自主执行场景下的具体机制（谁为 agent 的错误负责）未给出可操作方案。
- **安全/对抗维度弱化**：摘要未涉及恶意 agent、prompt injection 经 MCP 传播、多 agent 间的 confused-deputy 问题——而这恰是"可信治理"最核心的技术难点之一。
- **未与相邻工作做明确对比**：如 FIPA/SOAP、W3C Web Agent 相关标准、以及经典 actor 模型的区隔未在摘要层面展开。

## 适用场景
- **制定 agent 平台的架构选型与分层**：需要决定"自研协议栈"还是"采用 MCP/A2A + 自建网关/注册中心"的团队。
- **面向审计与合规的 agent 部署**：把传统服务治理（发现、定价、审计）映射到 agent 体系的路线图。
- **多 agent 系统的组织设计与互操作性调研**：为跨组织 agent 协作确定协议边界与信任机制。
- **研究选题定位**：IoA 视角下的开放问题（认知能力契约粒度、跨域信任）可直接作为研究议程。

## 相关工作
- [[Model Context Protocol (MCP)]] — agent–tool 交互协议
- [[Agent2Agent (A2A)]] — agent–agent 协调协议
- [[Agentic AI Foundation]] — 协议治理主体
- [[AGENTS.md]] — 过程性清单格式
- [[AGNTCY]] — agent 发现与目录
- [[SLIM]] — 安全的低延迟消息传输
- [[Multi-Agent Systems]] — 多 agent 编排模式
- [[Service-Oriented Architecture]] — 经典 SOA 发现/组合/治理/定价/信任
- [[Microservices]] — 服务化架构范式
- [[LLM Agents]] — 工具使用与委派

---
#LLM #Research #LLM-Agents #Architecture #Interoperability #Governance #arXiv-2611

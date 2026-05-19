# 2605.16508 - The Scaling Laws of Skills in LLM Agent Systems

## 元信息

| 标题 | The Scaling Laws of Skills in LLM Agent Systems |
|------|------|
| 作者 | Charles Chen, Qiming Yu, Yuhang Gu, Zhuoye Huang, Hanjing Li, Hongyu Liu, Simin Liu, Jinhao Liu, Dengyun Peng, Jiangyi Wang, Zheng Yan, Fanqing Meng, Ethan Qin, Carl Che, Mengkang Hu |
| 链接 | [原文](https://arxiv.org/abs/2605.16508) |
| arXiv | arXiv:2605.16508v1 |
| 领域 | cs.CL, cs.AI |
| 日期 | 2026-05-15 |

## 核心贡献

1. **发现两条耦合定律**：在 15 个前沿 LLM、1,141 个真实世界技能、300 万+ 路由/执行决策上，发现技能库存在两条缩放定律
2. **Routing Law（路由定律）**：单步路由准确率随技能库规模对数衰减（R² > 0.97），错误从本地技能竞争 → 跨模型族漂移 → 被过度通用的"黑洞技能"捕获
3. **Execution Law（执行定律）**：在状态实现前，联合路由近似乘法；正确执行可将困难下游决策提升约 4×
4. **耦合参数**：单一参数——路由对数衰减斜率 b，耦合两条定律：路由侧拟合可预测跨模型的执行侧救援效果

## 核心方法

### 路由定律
- 单步路由准确率：$R = a - b \cdot \log(\text{lib size})$
- 路由误差 progression：
  1. Local skill competition（本地技能竞争）
  2. Cross-family drift（跨族漂移）
  3. Black-hole skill capture（黑洞技能捕获）

### 执行定律
- Joint routing 在状态实现前近似乘法
- 正确执行可 rescue 困难下游决策约 4×

### 可操作优化
- Law-guided optimization：
  - 路由准确率：71.3% → 91.7%
  - Hijack 率：22.4% → 4.1%
  - ClawBench pass rate：49.3% → 61.6%
  - ClawMark pass rate：28.4% → 34.5%

## 关键洞察

- Agent 性能不仅取决于模型能力，还取决于**技能库的结构、粒度和暴露策略**
- 同一参数 b 控制预执行崩溃和下游可恢复性
- 黑洞技能（overly general skills）会导致路由被劫持

## 局限性

- 目前在 ClawBench/ClawMark 上验证，其他 benchmark 的迁移效果待验证
- 技能库的 exposure policy 影响未被充分研究

## 建议

- **是否推荐使用**：✅ 是
- **适用场景**：LLM Agent 系统设计、工具路由优化、技能库管理
- **下一步**：关注技能库结构设计，避免黑洞技能
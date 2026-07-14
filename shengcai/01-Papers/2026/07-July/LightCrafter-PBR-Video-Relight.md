---
tags: [渲染, PBR, 视频重光照, 扩散模型, 神经渲染, 2026]
date: 2026-07-14
status: 已读
review: 待深入
---

# LightCrafter: PBR-Conditioned Video Diffusion Refinement for Controllable and Consistent Relighting

## 元信息

| 标题 | LightCrafter: PBR-Conditioned Video Diffusion Refinement for Controllable and Consistent Relighting |
|------|------|
| 作者 | Zixin Guo, Yehonathan Litman, Yifeng He, John Miller, Chuhan Chen, Deva Ramanan |
| 机构 | Carnegie Mellon University, University of Toronto, Bosch Research |
| 链接 | [arXiv:2607.08016](https://arxiv.org/abs/2607.08016) |
| 领域 | cs.GR, cs.CV |
| 日期 | 2026-07-08 |

## 核心贡献

1. **混合管线重构**：将视频重光照重新定义为"代理视频翻译"任务，而非直接翻译输入视频
2. **PBR 渲染作为代理**：利用逆渲染恢复场景属性，渲染 PBR 代理视频，再通过视频扩散模型细化
3. **Artifact-Matched 数据策展**：训练时将源视频经过相同的逆渲染管线，产生含有真实 artifact 的 PBR 渲染
4. **长时序一致性**：PBR 渲染天然提供时序一致性，无需处理扩散模型的长视频 chunk 问题

## 技术方案

### 三阶段管线

1. **逆渲染阶段**
   - 使用 DiffusionRenderer 提取反照率、法线、BRDF 参数
   - 使用 MegaSAM 提取几何表面
   - 使用 DiffusionLight 估计环境光照
   - 通过可微分渲染细化环境光照

2. **前向渲染阶段**
   - 使用物理材质模型（Lambertian 漫反射 + Cook-Torrance 微表面高光）
   - BRDF 参数：反照率 $a$、粗糙度 $r$、金属度 $m$

   ```math
   f(\omega_i, \omega_o) = \frac{(1-m)\,a}{\pi} + \frac{D\,G\,F}{4\,(\omega_o \cdot n)\,(\omega_i \cdot n)}
   ```

   - 渲染方程：
   ```math
   L_o(x, \omega_o) = \int_\Omega L_i(x, \omega_i)\,f(x;\omega_i,\omega_o)\,V(x,\omega_i)\,(\omega_i \cdot n)\,d\omega_i
   ```

3. **扩散细化阶段**
   - 以 CogVideoX-5B 为基础微调
   - 以 PBR 渲染为条件输入
   - 在合成视频对和真实无配对视频上训练

### 关键发现

> PBR 渲染本身已能超越部分 prior art，证明当代逆渲染器的质量已足够高

## 实验结论

- 在真实世界重光照 benchmark 上达到 SOTA
- 贡献了合成 benchmark 用于进一步分析
- 支持长视频重光照，时序漂移远少于 prior 方法
- 泛化到物体放置、材质编辑、光照调整等下游任务

## 局限性

- 逆渲染误差会传播到最终结果
- 动态内容建模困难
- 需要 per-scene 优化

## 评估

- **创新性**：⭐⭐⭐⭐（混合管线设计新颖）
- **实用性**：⭐⭐⭐⭐⭐（可控性好，工程可用）
- **难度**：高（需要逆渲染 + PBR + 视频扩散联合）

## 链接

- 主页： http://zixinguo.me/lightcrafter/
- PDF： https://arxiv.org/pdf/2607.08016

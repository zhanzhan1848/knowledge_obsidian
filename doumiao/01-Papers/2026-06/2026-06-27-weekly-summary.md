# 流体渲染论文笔记 - 2026年6月

> 生成时间: 2026-06-27
> 搜索范围: arXiv cs.GR 最近7天 + 流体渲染相关关键词

---

## 1. FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

**arXiv**: [2606.13465](https://arxiv.org/abs/2606.13465)  
**发表**: SIGGRAPH 2026  
**作者**: Qianfan Shen, Ningxiao Tao, Qiyu Dai, et al.  
**方向**: 火焰渲染 / 3DGS

### 核心创新
- **问题**: 传统CFD和图形管线依赖手工几何、专家调参，劳动密集，难以扩展到真实场景
- **方案**: 将物理信息集成到3D Gaussian Splatting中，合成真实场景中的逼真燃烧效果
- **方法**: 结合物理建模与3DGS场景重建

### 渲染技术
- **类型**: 粒子/体积混合
- **技术**: Physics-integrated 3DGS
- **应用**: 真实场景火焰合成

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐ (in-the-wild photorealistic)
- 风格化支持: 待评估

### 性能预期
- 帧率: 实时 (基于3DGS)
- GPU需求: 中等

### 实现建议
- 着色器复杂度: 中
- 管线要求: 3DGS + 物理模拟
- 推荐度: ✅ 高度相关

---

## 2. LivingWorld: Interactive 4D World Generation with Environmental Dynamics

**arXiv**: [2606.21162](https://arxiv.org/abs/2606.21162)  
**发表**: 2026  
**作者**: Hyeongju Mun, In-Hwan Jin, Sohyeong Kim, Kyeongbo Kong  
**方向**: 环境动态 / 云/水/烟

### 核心创新
- **问题**: 现有方法主要重建静态几何，场景级环境动态（云、水、烟）未被充分探索
- **方案**: 支持大规模环境创建，包含动态元素
- **挑战**: 运动必须在扩展场景中保持一致，同时支持低延迟用户反馈

### 渲染技术
- **类型**: 体积/表面混合
- **技术**: 4D world generation with dynamics
- **应用**: 云、水、烟动态模拟

### 视觉质量
- 逼真度: ⭐⭐⭐⭐
- 风格化支持: 是

### 性能预期
- 帧率: 实时交互
- GPU需求: 待评估

### 实现建议
- 着色器复杂度: 高
- 管线要求: 动态场景生成
- 推荐度: ✅ 相关

---

## 3. Gaussian Swaying: Surface-Based Framework for Aerodynamic Simulation with 3D Gaussians

**arXiv**: 2025年12月 (相关)  
**作者**: Hongru Yan, Xiang Zhang, Zeyuan Chen, et al.  
**方向**: 风吹效果 / 水面交互

### 核心创新
- **应用场景**: 树枝在风中摇摆、旗帜飘动、船在水上摇晃
- **方案**: 基于3D Gaussian的表面空气动力学模拟框架
- **创新点**: 不同于基于网格的方法，无需昂贵的显式网格生成

### 渲染技术
- **类型**: 表面/粒子
- **技术**: 3DGS + 空气动力学
- **应用**: 水面船体摇晃、旗帜飘动

### 视觉质量
- 逼真度: ⭐⭐⭐⭐
- 风格化支持: 是

### 性能预期
- 帧率: 实时 (基于3DGS)
- GPU需求: 中等

### 实现建议
- 着色器复杂度: 中
- 管线要求: 3DGS
- 推荐度: ✅ 高度相关 (水面+空气动力学)

---

## 4. SmokeGS-R: Physics-Guided Pseudo-Clean 3DGS for Real-World Multi-View Smoke Restoration

**arXiv**: 相关  
**发表**: NTIRE 2026 Challenge  
**作者**: Xueming Fu, Lixia Han  
**方向**: 烟雾去除 / 3D重建

### 核心创新
- **问题**: 真实烟雾同时衰减场景辐射、添加空气光、破坏多视角外观一致性
- **方案**: 解耦几何恢复与外观恢复的两阶段管线
- **关键思想**: 将折射表面与目标物体显式解耦

### 渲染技术
- **类型**: 体积渲染后处理
- **技术**: Physics-guided 3DGS
- **应用**: 烟雾场景3D重建

### 实现建议
- 推荐度: ⚠️ 相关但不直接 (烟雾去除 vs 烟雾渲染)

---

## 5. 3D Smoke Scene Reconstruction Guided by Vision Priors from Multimodal LLMs

**arXiv**: 相关  
**作者**: Xinye Zheng, Fei Wang, Yiqi Nie, et al.  
**方向**: 烟雾场景重建

### 核心创新
- **问题**: 从烟雾降质的多视角图像重建3D场景非常困难
- **方案**: 使用多模态LLM的视觉先验引导重建
- **方法**: 结合LLM视觉语言模型先验

### 渲染技术
- **类型**: 体积重建
- **技术**: LLM-guided 3D reconstruction
- **应用**: 烟雾环境场景重建

### 实现建议
- 推荐度: ⚠️ 相关 (烟雾+3DGS)

---

## 6. PIAvatar: Physically Interactive Avatars via Deformation Gradient Decoupling

**arXiv**: [2606.21162](https://arxiv.org/abs/2606.21162)  
**发表**: 2026  
**作者**: Sang-Hun Han et al.  
**方向**: 可变形人体模拟 / MPM

### 核心创新
- **问题**: 现有3D化身视觉保真度高，但缺乏物理交互能力
- **方案**: 将运动学速度与变形梯度解耦，实现物理感知的交互
- **方法**: 在MPM框架内集成骨骼框架

### 渲染技术
- **类型**: 粒子/体积 (MPM)
- **技术**: Material Point Method
- **应用**: 人体-物体、人体-人体物理交互

### 视觉质量
- 逼真度: ⭐⭐⭐⭐
- 风格化支持: 是

### 性能预期
- 帧率: 实时
- GPU需求: 中等

### 实现建议
- 着色器复杂度: 高
- 管线要求: MPM物理求解器
- 推荐度: ✅ 相关 (流体/粒子物理模拟)

---

## 7. HiPR: Hierarchical Progressive Rendering for Immediate Feedback

**arXiv**: [2606.26612](https://arxiv.org/abs/2606.26612)  
**发表**: 2026  
**作者**: Rafael Padilla et al.  
**方向**: 路径追踪 / 实时渲染

### 核心创新
- **问题**: 大多数渲染器在任何场景变化后重新计算整个帧
- **方案**: 基于优先级顺序更新部分像素，从变化元素向外组织光路依赖层次
- **目标**: 即时视觉反馈，最终收敛到无偏结果

### 渲染技术
- **类型**: 表面 (路径追踪)
- **技术**: Progressive rendering, render scheduling
- **应用**: 交互式路径追踪

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐ (无偏)
- 风格化支持: 是

### 性能预期
- 帧率: 渐进式实时
- GPU需求: 高

### 实现建议
- 着色器复杂度: 高
- 管线要求: 路径追踪器
- 推荐度: ✅ 相关 (渲染管线优化)

---

## 8. MeshFlow: Mesh Generation with Equivariant Flow Matching

**arXiv**: [2606.23489](https://arxiv.org/abs/2606.23489)  
**发表**: SIGGRAPH 2026  
**作者**: Qi Sun et al.  
**方向**: 网格生成 / 流匹配

### 核心创新
- **问题**: 直接生成网格具有挑战性，因为表示包含重要对称性
- **方案**: 学习直接生成三角形网格（作为三角形汤），避免序列化成长自回归序列
- **创新**: 等变最优传输流匹配模型

### 技术要点
- 保持面和顶点排列不变性
- 18倍推理加速

### 实现建议
- 推荐度: ⚠️ 间接相关 (网格生成对流体模拟有用)

---

## 9. DJM: Compact Base Meshes for Displacement Mapping using Triangle Jacobians

**arXiv**: [2606.22880](https://arxiv.org/abs/2606.22880)  
**发表**: SIGGRAPH 2026  
**作者**: Congyi Zhang et al.  
**方向**: 位移映射 / 网格简化

### 核心创新
- **问题**: 将复杂几何转换为位移函数表示时，计算尽可能少三角形的基网格
- **方案**: 使用位移函数的Jacobian引导基网格计算
- **创新**: QEM简化变体，约束位移映射双射且低扭曲

### 技术要点
- 避免不可靠的射线-网格相交
- 重建精度与尺寸权衡优于先前方法

### 实现建议
- 推荐度: ⚠️ 间接相关 (渲染优化)

---

## 10. DOT3D: Lighting-Consistent Object Transfer Across Radiance Fields

**arXiv**: [2606.22481](https://arxiv.org/abs/2606.22481)  
**发表**: EGSR 2026  
**作者**: George Drettakis et al.  
**方向**: 3DGS编辑 / 光照和谐化

### 核心创新
- **问题**: 从源场景提取对象并简单粘贴到目标场景会因光照条件不同而失败
- **方案**: 扩散模型和谐化光照不一致的合成图像
- **应用**: VFX、建筑、室内设计、营销

### 技术要点
- 异构数据集训练（合成、生成、真实数据对）
- 3DGS后优化步骤

### 实现建议
- 推荐度: ⚠️ 间接相关 (3DGS编辑)

---

## 11. RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing

**arXiv**: 2026年3月  
**作者**: Yiming Shao, Qiyu Dai, et al.  
**方向**: 水面折射 / 3DGS

### 核心创新
- **问题**: 现有方法在水下场景中失效，产生明显伪影
- **方案**: 联合重建折射水面及其下方场景
- **关键洞察**: 将折射边界与目标物体显式解耦

### 渲染技术
- **类型**: 表面 (折射)
- **技术**: 3DGS + 神经隐式水面
- **应用**: 水下场景新视角合成

### 视觉质量
- 逼真度: ⭐⭐⭐⭐⭐
- 风格化支持: 是

### 实现建议
- 推荐度: ✅ 高度相关 (水面折射渲染)

---

## 12. FieryGS: Physics-Integrated 3DGS for Fire Synthesis

**arXiv**: 2606.13465  
**发表**: SIGGRAPH 2026  
**方向**: 火焰渲染 / 物理模拟

### 核心创新
- 结合物理信息与3D Gaussian Splatting
- 真实场景中合成照片级燃烧效果
- 解决传统CFD方法的劳动密集问题

### 渲染技术
- **类型**: 体积/粒子混合
- **技术**: Physics-integrated 3DGS
- **创新点**: 将物理约束嵌入3DGS优化过程

### 性能与质量
- 视觉质量: ⭐⭐⭐⭐⭐
- 实时性能: 是 (基于3DGS)
- GPU需求: 中等

### 实现建议
- 着色器复杂度: 中
- 管线要求: 3DGS框架 + 物理模拟
- 推荐度: ✅✅ 最高优先级 (火焰渲染)

---

## 13. Real-time Neural Six-way Lightmaps for Participating Media

**arXiv**: 2026年4月  
**作者**: Wei Li, Hanxiao Sun, et al.  
**方向**: 参与介质 / 实时渲染

### 核心创新
- **问题**: 参与介质（如雾、烟）在虚拟环境中普遍存在，实时渲染困难
- **方案**: 神经六向光图方法
- **应用**: 体积光效果

### 渲染技术
- **类型**: 体积渲染
- **技术**: Neural lightmaps, participating media
- **创新点**: 实时体积光估计

### 实现建议
- 推荐度: ✅ 相关 (体积渲染技术)

---

## 14. Dehaze-then-Splat: Generative Dehazing with Physics-Informed 3DGS

**arXiv**: 2026年4月  
**发表**: NTIRE 2026  
**方向**: 烟雾去除 / 3DGS

### 核心创新
- 两阶段管线：生成去雾 + 3DGS重建
- 物理信息引导的去雾过程

### 实现建议
- 推荐度: ⚠️ 相关 (烟雾相关但偏向去除)

---

## 15. Fire as a Service: Augmenting Robot Simulators with Thermally and Visually Accurate Fire Dynamics

**arXiv**: 2026年3月  
**作者**: Anton R. Wagner, Madhan Balaji Rao, et al.  
**方向**: 火焰模拟 / 机器人仿真

### 核心创新
- 机器人仿真器中的热力学和视觉精确火焰
- 区分于传统优先刚体动力学和照片级渲染的仿真器

### 实现建议
- 推荐度: ✅ 相关 (火焰物理模拟)

---

## 📊 本周总结

### 高相关度论文 (流体渲染直接相关)
| 论文 | 方向 | 会议 | 推荐度 |
|------|------|------|--------|
| FieryGS | 火焰渲染 | SIGGRAPH 2026 | ✅✅ |
| RefracGS | 水面折射 | - | ✅✅ |
| Gaussian Swaying | 空气动力学/水面 | - | ✅ |
| LivingWorld | 环境动态(云水烟) | - | ✅ |
| Real-time Neural Six-way Lightmaps | 体积光 | - | ✅ |
| Fire as a Service | 火焰模拟 | - | ✅ |

### 中相关度论文 (技术相关)
| 论文 | 方向 | 会议 | 推荐度 |
|------|------|------|--------|
| PIAvatar | MPM物理模拟 | - | ✅ |
| HiPR | 路径追踪优化 | - | ✅ |
| SmokeGS-R | 烟雾3DGS | NTIRE 2026 | ⚠️ |
| 3D Smoke Reconstruction | 烟雾重建 | - | ⚠️ |

### 关键趋势
1. **3DGS在流体领域的应用快速增长** - FieryGS, RefracGS, SmokeGS-R等
2. **物理信息集成** - 将CFD/物理约束嵌入神经网络
3. **实时体积渲染** - Neural lightmaps等方法
4. **环境动态** - 关注场景级动态元素（云、水、烟）

---
*由豆苗自动收集整理 - 2026-06-27*
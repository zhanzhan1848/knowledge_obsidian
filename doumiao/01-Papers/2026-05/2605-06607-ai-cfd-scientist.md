# AI CFD Scientist: Toward Open-Ended Computational Fluid Dynamics Discovery

## 论文信息
- **arXiv**: [2605.06607](https://arxiv.org/abs/2605.06607)
- **日期**: 2026-05-07 (提交)
- **分类**: physics.flu-dyn, cs.AI
- **作者**: Nithin Somasekharan

## 核心创新点
- **方法**: 首个覆盖完整科学发现流程的 CFD AI 系统
- **组件**: 文献 grounding 构思 → 验证执行 → 基于视觉的物理验证 → 源代码修改 → 图表写作
- **突破**: 视觉-语言物理验证门控，检查渲染流场后才接受结果

## 技术细节

### 三个耦合路径
1. **固定求解器内参数扫描**
2. **Case-local C++ 库编译** (新物理模型)
3. **开放假设搜索** (对抗参考比较器)

### 核心：视觉-语言物理验证
- 检查渲染流场图像
- 检测 solver 日志中不显现的失败模式
- 检测 14/16 静默失败（被 solver 级检查遗漏）

### 成果
- Spalart-Allmaras 运行时校正：降低壁面 Cf RMSE 7.89%
- 周期山丘 Re_h=5600 上相比 DNS

## 渲染相关度
- **类型**: 计算流体动力学 + AI
- **相关性**: ⭐⭐⭐ (3/5)
- **适用场景**: 流体模拟研究、自动化 CFD

## 可行性分析

### 渲染方法
- 类型：CFD 物理仿真
- 技术：LLM Agent + Vision-language verification

### 视觉质量
- 逼真度：N/A (物理仿真)
- 风格化支持：N/A

### 性能预期
- 自动化程度：高
- 物理验证：视觉驱动
- 适用性：研究/离线

### 实现建议
- 着色器复杂度：N/A
- 管线要求：OpenFOAM + LLM
- 推荐度：⚠️ 研究导向，与渲染管线间接相关

## 代码资源
- GitHub: https://github.com/csml-rpi/cfd-scientist

## URL
- Paper: https://arxiv.org/abs/2605.06607
- PDF: https://arxiv.org/pdf/2605.06607

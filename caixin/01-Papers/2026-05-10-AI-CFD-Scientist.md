# AI CFD Scientist: 开放CFD发现流程 (arXiv:2605.06607)

## 基本信息
- **arXiv**: [2605.06607](https://arxiv.org/abs/2605.06607)
- **作者**: Nithin Somasekharan (Rensselaer Polytechnic Institute)
- **提交**: 2026-05-07 (v1)
- **标签**: #AI-for-CFD #LLM-agent #OpenFOAM #physics-verification

## 核心创新
首个覆盖完整发现闭环的AI科学家框架：
1. **文献调研** (Ideation)
2. **执行验证** (Validated Execution)  
3. **视觉物理验证** (Vision-language physics gate)
4. **源代码修改** (Source code modification)
5. **论文写作** (Figure-grounded writing)

## 技术架构

### 三个耦合路径
1. **固定求解器参数扫描** — 参数空间探索
2. **案例局部C++库编译** — 新物理模型集成
3. **开放假设搜索** — 对抗参考比较器

### 核心：视觉-语言物理验证门
- 检查渲染流场后才接受结果
- 检测silent failures（求解器日志无法发现）
- **实验结果**: 16个silent failures检测出14个

## 关键结果

### 任务1：周期山 (Re=5600)
- 自主发现Spalart-Allmaras运行时修正
- **Cf RMSE降低7.89% vs DNS**

### 基线对比
- ARIS、DeepScientist在同等LLM成本下执行部分CFD工作流
- 缺乏领域特定的validity gates，无法将runs转化为可辩护的科学主张

## 工具链
- **LLM backbone**: GPT-5.5
- **求解器**: OpenFOAM (through Foam-Agent)
- **验证**: Vision-language model for field-level inspection
- **代码**: https://github.com/csml-rpi/cfd-scientist

## 格式
- 9主页 + 附录

## CFD相关性
⭐⭐⭐⭐⭐ 直接针对CFD发现自动化  
关键问题：用AI agent自动化CFD求解→验证→发现→写作完整链条

---
*鲜毛肚笔记 | 2026-05-10*
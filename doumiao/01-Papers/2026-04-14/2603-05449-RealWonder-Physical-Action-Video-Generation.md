# RealWonder: Real-Time Physical Action-Conditioned Video Generation

## 论文信息
- **arXiv ID**: 2603.05449v1
- **作者**: Hong-Xing Yu et al.
- **发表日期**: 2026-03-05
- **分类**: cs.CV / cs.AI / cs.GR
- **PDF**: https://arxiv.org/pdf/2603.05449v1
- **项目主页**: https://liuwei283.github.io/RealWonder/

## 研究领域
- [[视频生成]]
- [[物理仿真]]
- [[流体模拟]]
- [[扩散模型]]

## 核心创新点

### 问题
当前视频生成模型无法模拟 3D 动作（如力和机器人操作）的物理后果，因为它们缺乏对动作如何影响 3D 场景的结构理解。

### 方法：RealWonder 系统
1. **物理仿真作为中间桥梁**: 不直接编码连续动作，而是通过物理仿真将动作翻译成视频模型可处理的视觉表示（光流和 RGB）
2. **三组件集成**:
   - 单图像 3D 重建
   - 物理仿真
   - 蒸馏视频生成器（仅需 4 步扩散）
3. **实时性能**: 480x832 分辨率下达 13.2 FPS

### 支持场景
- 刚体 (rigid objects)
- 可变形体 (deformable bodies)
- **流体 (fluids)**
- 粒状材料 (granular materials)

## 渲染方法
- **类型**: 数据驱动 + 物理仿真
- **技术**: 3D Reconstruction + Physics Simulation + Diffusion (4-step)

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 是

## 性能预期
- **帧率**: 13.2 FPS
- **GPU 需求**: 中等
- **内存占用**: 待定

## 实现建议
- **着色器复杂度**: 中等
- **管线要求**: 物理仿真 + 扩散模型
- **推荐度**: ✅ 流体等物理仿真视频生成的有趣应用

## 相关工作
- Video Diffusion Models
- Physics Simulation
- 3D Reconstruction
- Action-Conditioned Video Generation

## 待深入
- [ ] 查看项目主页了解流体效果演示
- [ ] 分析物理仿真与渲染的集成方式

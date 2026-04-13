# Real-time Neural Six-way Lightmaps

## 论文信息
- **arXiv ID**: [2604.03748](https://arxiv.org/abs/2604.03748)
- **标题**: Real-time Neural Six-way Lightmaps
- **作者**: Tao Huang et al.
- **分类**: cs.GR (Graphics)
- **提交日期**: 2026-04-04
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2604.03748)

## 研究领域
- **主题**: 烟雾渲染 (Smoke Rendering)
- **技术**: 神经渲染、体积光照、实时渲染
- **应用**: 游戏、VR/AR

## 核心创新点

### 问题背景
参与介质（烟雾、雾、云、火）在虚拟环境中普遍存在，但实时渲染面临挑战。传统六向光照图（six-way lightmaps）技术虽然能实现烟雾渲染，但仅限于预计算动画序列，无法支持相机移动和动态光照。

### 解决方案
提出**神经六向光照图方法**，从2D屏幕空间引导图学习光照散射：
1. 使用大采样步长的光线步进生成引导图
2. 通过 U-Net + 通道适配器预测六向光照图和透明度图
3. 可无缝集成到游戏引擎渲染管线

### 关键贡献
- 渲染管线整体耗时 < 4ms
- 支持物体-烟雾交互、动态相机移动、动态光照
- 比传统蒙特卡洛或学习型3D体积渲染方法快一个数量级

## 技术细节

### 体积渲染方程
$$L(\mathbf{x}, \omega) = \int_0^z T(\mathbf{x} \leftrightarrow \mathbf{y})[\sigma_a(\mathbf{y})L_e(\mathbf{y},\omega) + \sigma_s(\mathbf{y})L_s(\mathbf{y},\omega)]d\mathbf{y} + T(\mathbf{x} \leftrightarrow \mathbf{z})L_o(\mathbf{z},\omega)$$

### 网络架构
- **输入**: 屏幕空间引导图（相机视角的光线步进近似）
- **骨干**: U-Net + 专用通道适配器
- **输出**: 六向光照图 + 透明度图

### 透射率函数
$$T(\mathbf{x} \leftrightarrow \mathbf{y}) = e^{-\int_0^y \sigma_t(\mathbf{x} - s\omega)ds}$$

## 实验评估
- 测试场景: 喷射流、爆炸、刚体-烟雾交互
- 集成到 Unreal Engine 验证实时渲染能力

## 相关工作对比

| 方法 | 优点 | 局限性 |
|------|------|--------|
| 传统光线步进/MC | 高真实感 | 计算昂贵 |
| 六向光照图 | 效率高 | 静态场景 |
| 神经NeRF类 | 可学习 | 预计算重 |
| **本文方法** | 实时+动态 | - |

## 代码/资源
- 项目主页: (待补充)

## 标签
#烟雾渲染 #体积渲染 #神经渲染 #实时渲染 #六向光照图 #游戏引擎

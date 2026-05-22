---
tags: [渲染, 体渲染, Ray Marching, WebGPU, 医学可视化, 2026]
date: 2026-05-22
status: 待读
---

# Decentralized Direct Volume Rendering: A Browser-Native GPU Architecture for MRI Digital Twins in Resource-Constrained Settings

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Oserebameh Beckley et al. |
| 发表 | cs.GR (2026-05-19) |
| 链接 | [arXiv:2605.19737](https://arxiv.org/abs/2605.19737) |
| 代码 | [GitHub](https://github.com/Bahdmanbabzo/webgpu-mri) |
| Demo | [WebGPU MRI](https://webgpu-mri.vercel.app/) |

## 核心贡献

1. **去中心化的客户端 WebGPU 架构**：直接在浏览器中执行体渲染，绕过服务端渲染
2. **单次传递确定性 Ray Marching**：在低端集成 GPU 上实现高性能体绘制
3. **Morphological gradient calculations**：用于医学图像分析
4. **零延迟交互**：通过 uniform buffers 实现组织参数实时操控

## 技术方案

### 架构设计
```
传统方案: MRI → Server → SSR → Client (高延迟)
本方案:   MRI → Client WebGPU → Direct Ray Marching (无延迟)
```

### 核心算法
- **Ray Marching**: 单次传递确定性地遍历体数据
- **Morphological Gradient**: 计算体数据的梯度用于边界检测
- **确定性渲染**: 无随机性，保证结果可重复

### 性能指标
| 指标 | 值 |
|------|-----|
| TTFP (首像素时间) | < 920ms |
| 帧率 | ≥ 82 FPS |
| 硬件要求 | 低成本集成 GPU |
| 无需深度学习 | True |
| 无外部计算依赖 | True |

## 实现细节

### WebGPU 优势
- 原生 GPU 访问
- 跳过网络延迟
- 客户端渲染管线优化

### 体渲染管线
1. 从 MRI 数据创建 3D 纹理
2. 通过 ray marching 采样体数据
3. 应用传输函数进行颜色映射
4. 合成最终图像

## 关键代码

```glsl
// Ray marching 核心
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec3 rayDir = getRayDirection(fragCoord);
    vec3 rayOrigin = cameraPos;
    
    float accumulatedAlpha = 0.0;
    vec3 accumulatedColor = vec3(0.0);
    
    for (int i = 0; i < MAX_STEPS; i++) {
        vec3 pos = rayOrigin + rayDir * stepSize * float(i);
        
        float density = sampleVolume(pos);
        vec3 color = transferFunction(density);
        
        accumulatedColor += color * (1.0 - accumulatedAlpha);
        accumulatedAlpha += color.a * (1.0 - accumulatedAlpha);
        
        if (accumulatedAlpha >= 0.95) break;
    }
    
    fragColor = vec4(accumulatedColor, 1.0);
}
```

## 实验结论

- 在资源受限环境下实现实时交互式体渲染
- TTFP < 920ms，FPS ≥ 82
- 可扩展且经济实惠的医疗 Digital Twin 基础架构

## 局限性

- 仅适用于体数据渲染
- 需要 WebGPU 兼容浏览器

## 相关工作

- Server-Side Rendering (SSR)
- Cloud-rendered solutions
- 传统体渲染方法

## 标签

#体渲染 #RayMarching #WebGPU #DigitalTwin #医学可视化 #浏览器渲染
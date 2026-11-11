---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, rasterization, sorting, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.01534
arxiv_id: 2611.01534
---

# AbacusGS: Gaussian Splatting without Per-Splat Sorting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AbacusGS: Gaussian Splatting without Per-Splat Sorting |
| **作者** | Jiacheng Ding, Yanliang Qi, Cong Guo, Peihua Mai（University of Waterloo） |
| **发表** | arXiv cs.CV / cs.GR, 2026-11-01（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.01534) |
| **DOI** | - |
| **代码** | 论文承诺开源（"The code will be released."） |
| **篇幅** | 10 页 / 5 图 / 6 表 |

---

## 核心贡献

> 把 3DGS 的**混合顺序直接存进场景布局**，每帧只排序可见的 box，而不是排序每一个 splat。

1. **场景布局内嵌排序**：把 splat 分组成**至多 128 个 splat 的八叉树 box**，每个 box 在**写入时**选定一个轴并按该轴排好序。
2. **每帧只排 box**：只对**可见** box 排序；**每 box 一次点积**决定该 box 正向读还是反向读。
3. **3DGS 的 over 算子完全不变**：alpha blending 公式一字未改。
4. **紧凑格式 + CUDA tile 渲染器**：17 bytes/splat 的紧凑存储，配套 CUDA tile renderer，使用同一套顺序。
5. **短时顺序感知微调**：把已有 3DGS 模型转换过来只需一段简短微调。

---

## 技术方案

### 核心思想

3DGS 每帧都要按深度排序所有 splat。**用硬件光栅器绘制、在 CPU 端排序的查看器**（绝大多数 Web/移动端查看器都是这样）把大部分帧时间花在排序上。

AbacusGS 的洞察：深度排序本质上是**沿视线方向的一维排序**。若每个 box 预先沿某个轴排好序，只要该轴与视线方向的点积符号确定，就知道整个 box 应正读还是反读。

### 关键技术

| 技术 | 说明 |
|------|------|
| **八叉树 box 分组** | 每 box ≤128 splat |
| **写入时轴选择** | 静态存储时选定排序轴并排好序 |
| **可见性筛选** | 每帧只对可见 box 排序 |
| **点积方向判定** | 每 box 一次点积决定正/反向读 |
| **紧凑格式** | 17 bytes/splat |
| **CUDA tile renderer** | 配套 GPU 渲染器，复用同一顺序 |
| **顺序感知微调** | order-aware fine-tuning，把现成 3DGS 模型转过来 |

### 公式

```math
// 方向判定（每 box 一次点积）
// 视线方向 v 与 box 排序轴 a 的点积符号决定读取方向
float s = dot(viewDir, boxAxis);       // boxAxis 为写入时选定的轴
bool reverse = (s < 0.0f);

// 盒内 splat 按预排顺序读入
for (int i = 0; i < box.count; ++i) {
    int idx = reverse ? (box.count - 1 - i) : i;
    blend(splats[box.start + idx]);
}
```

---

## 代码片段

```cpp
// 场景构建（离线 / 一次性）
struct AbacusBox {
    uint32_t start;      // splat 起始索引
    uint16_t count;      // <= 128
    uint8_t  axis;       // 写入时选定的排序轴 (0/1/2)
    uint8_t  flags;
};

// 写入：按选定轴排序并分组
void buildScene(Scene& s) {
    for (auto& box : makeOctreeBoxes(s.splats, /*maxPerBox=*/128)) {
        box.axis = chooseAxis(box);                 // 写入时选定
        std::sort(box.begin(), box.end(),
                  [&](auto& a, auto& b) { return a.p[box.axis] < b.p[box.axis]; });
    }
}

// 每帧：只排可见 box
void render(Frame& f) {
    std::vector<AbacusBox*> visible;
    for (auto& box : scene.boxes)
        if (testVisibility(box, f)) visible.push_back(&box);

    std::sort(visible.begin(), visible.end(), [&](AbacusBox* a, AbacusBox* b) {
        return dot(f.viewDir, a->center) < dot(f.viewDir, b->center);
    });

    for (auto* box : visible) {
        float s = dot(f.viewDir, boxAxis(*box));    // 每 box 一次点积
        bool rev = (s < 0.0f);
        blendBox(*box, rev);                        // over 算子不变
    }
}
```

---

## 实验结论

- **数据集**: 13 个标准 3DGS 场景
- **基线**: 等价微调后的 3DGS（per-splat sorting）
- **结果**:
  - **PSNR 平均仅损失 0.13 dB**
  - 在 **CPU 端排序的 OpenGL 查看器**中，AbacusGS 渲染帧率 **快 4.5×**
  - 紧凑格式 **17 bytes/splat**
  - 附带 CUDA tile renderer，使用同一套顺序
- **方法优势**: 不改 3DGS 的 over 算子；短时顺序感知微调即可转换现有模型

---

## 局限性

- **主要收益场景是 CPU 排序的查看器**（Web/移动端）。GPU 端已有 3DGS 排序优化（如 per-GPU sorting）时，收益会显著缩小
- box 内 128 个 splat 的固定排序轴是近似——轴选择不当会造成 box 内顺序错误（论文用微调补偿）
- 论文未说明对**半透明/高 alpha 重叠**场景的排序误差上界
- 承诺开源但截至记录时未见仓库链接
- 预印本，未见同行评审

---

## 相关工作

- [[2026-09-08_TileGS-Gaussian-Rasterization]]
- [[2026-11-09_SM-Level-Load-Imbalance-3DGS-Persistent-Kernel-Scheduling]]
- [[2026-08-22_3DGART-3D-Gaussian-Accelerated-Ray-Tracing]]
- 概念：[[3D高斯泼溅]], [[深度排序]], [[光栅化]], [[紧凑存储格式]]

---

## 实现建议

- **实现难度**: 中（需改造场景加载格式 + box 可见性剔除 + 顺序感知的 tile renderer）
- **预期性能**: CPU 排序查看器 4.5× 帧率提升，PSNR 仅损失 0.13 dB，17 bytes/splat
- **适用场景**: **Web / 移动端 / 低端设备 3DGS 查看器**——这是当前 3DGS 生态最大的部署瓶颈之一
- **与团队的关系**: 与 [[2026-11-09_SM-Level-Load-Imbalance]] 同属"3DGS 性能"方向但解决不同瓶颈（排序 vs 调度），**可叠加**。建议 @墨鱼丸 评估"Web 端 3DGS 查看器"的排序优化——投入产出比高
- **优先级**: 高（对 Web/移动端部署场景是直接可用的加速）

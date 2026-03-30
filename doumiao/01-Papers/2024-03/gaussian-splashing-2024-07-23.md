# Gaussian Splashing: Unified Particles for Versatile Motion Synthesis and Rendering
**Paper ID**: arXiv:2401.15318  
**Date**: July 23, 2024  
**Category**: 3D Gaussian Splatting + Fluid Simulation  
**Authors**: Yutao Feng, Xiang Feng, Yintong Shang, Ying Jiang, Chang Yu, Zeshun Zong, Tianjia Shao, Hongzhi Wu, Kun Zhou, Chenfanfu Jiang, Yin Yang  
**Institutions**: University of Utah, Zhejiang University, UCLA  

## Abstract
We demonstrate the feasibility of integrating physics-based animations of solids and fluids with 3D Gaussian Splatting (3DGS) to create novel effects in virtual scenes reconstructed using 3DGS. Leveraging the coherence of the Gaussian Splatting and Position-Based Dynamics (PBD) in the underlying representation, we manage rendering, view synthesis, and the dynamics of solids and fluids in a cohesive manner.

## Key Contributions
1. **Gaussian Splashing (GSP)**: Unified framework combining 3DGS and PBD
2. **Physics Integration**: Realistic solid-fluid interactions
3. **Surface Enhancement**: Added normals for better surface reflections
4. **Dynamic Surface Rendering**: Realistic highlights on dynamic fluids
5. **View Synthesis**: Novel views with interacting deformable bodies, rigid objects, and fluids

## Technical Approach
### Core Framework
- **3D Gaussian Splatting**: Scene representation with Gaussian kernels
- **Position-Based Dynamics (PBD)**: Physics simulation for solids and fluids
- **Unified Representation**: Shared particle-based system for rendering and simulation

### Enhancements
- **Normal Augmentation**: Added surface normals to Gaussian kernels
- **Surface Normal Alignment**: Kernel orientation aligned with surface normal
- **Specular Shading**: Enhanced surface reflections on fluids
- **Anisotropy Loss**: Mitigates stretching artifacts during training

## Surface Reconstruction
- **Volume-based**: 3D Gaussian kernels encode geometry
- **Dynamic Updates**: Real-time mesh reconstruction from particles
- **Surface Tension**: Approximated for fluid surface normals
- **Depth Volume**: Scattered droplet normal estimation

## Applications
- **Dynamic Scenes**: Cliff battered by waves
- **Interactive Effects**: Flooding garden scenarios
- **Object Interaction**: LEGO excavator surfing on waves
- **Real-time Rendering**: 334,815 solid + 280,000 fluid Gaussian kernels

## Performance Metrics
- **Particle Count**: High (600k+ Gaussian kernels)
- **Rendering Quality**: High (diffuse + specular shading)
- **Real-time**: Interactive performance capability
- **Memory**: Moderate (optimized Gaussian representation)

## Related Work
- **Dynamic Neural Radiance Fields**: Time-varying scene representation
- **Lagrangian Fluid Simulation**: Particle-based fluid dynamics (SPH)
- **3DGS Extensions**: Physics-based simulation integration

## Keywords
- 3D Gaussian Splatting
- Position-Based Dynamics
- Fluid-solid interaction
- Physics-based animation
- Real-time rendering

---

## Rendering Analysis
### Method Type
- **Type**: Hybrid (Volume + Particle-based)
- **Technique**: 3D Gaussian Splatting + PBD simulation

### Visual Quality
- **Realism**: ⭐⭐⭐⭐⭐ (Photorealistic with specular highlights)
- **Style**: Realistic with dynamic surface reflections
- **Performance**: Real-time capability with high particle count

### Performance Metrics
- **Frame Rate**: Interactive (real-time capable)
- **GPU Requirements**: High (600k+ Gaussian kernels)
- **Memory Usage**: Moderate (efficient Gaussian representation)

### Implementation Complexity
- **Shaders**: High (custom Gaussian shading with normals)
- **Pipeline**: Complex (3DGS + PBD integration)
- **Recommended**: ⚠️ (High quality but complex implementation)

## Notes
This paper represents cutting-edge work in unifying neural rendering with physics simulation, enabling realistic fluid-solid interactions with high-quality rendering. The integration of surface normals and specular shading significantly enhances visual quality for fluid dynamics.
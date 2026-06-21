# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

## Paper Info
- **Title**: Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing
- **Authors**: Doug James, Ethan James
- **arXiv**: N/A (SIGGRAPH 2026 Best Paper)
- **Category**: Fluid Rendering / Fluid Simulation
- **Date**: 2026
- **URL**: [SIGGRAPH 2026 Session](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108)

## Abstract (Key Points)
Mixwell introduces sharp 2D fluid brushes and GPU-accelerated analytical methods for progressive, resolution-independent, physics-based mixing. Derived from potential flow around cylindrical tines, Mixwell evaluates drift per sample without grids or intermediate resampling, enabling real-time, arbitrary-resolution fluid mixing and rendering with negligible numerical dissipation.

## Innovation Points
1. **Sharp 2D Fluid Brushes**: Novel fluid mixing approach using sharp brushes
2. **GPU-Accelerated Analytical Methods**: Analytical computation of drift based on potential flow theory
3. **Grid-Free**: No grids or intermediate resampling required
4. **Progressive**: Supports progressive/incremental rendering
5. **Resolution-Independent**: Results don't depend on grid resolution
6. **Negligible Numerical Dissipation**: High quality mixing without numerical artifacts

## Technical Details

### Core Method
- Derives drift from potential flow around cylindrical tines
- Evaluates drift per sample directly on GPU
- Uses analytical methods instead of numerical simulation

### Performance Characteristics
- Real-time fluid mixing
- Arbitrary resolution support
- Negligible numerical dissipation

## Relevance to Fluid Rendering
- **Type**: Surface/Fluid Simulation
- **Technique**: Particle-based fluid with sharp brushes
- **Application**: Real-time fluid mixing and rendering

## Related Research
- Best Paper Award at SIGGRAPH 2026
- Related to: potential flow theory, particle-based fluids, GPU fluid simulation

## Tags
#fluid-rendering #fluid-simulation #gpu #real-time #particle-system #siggraph2026 #best-paper

---
*Note created by Doumiao - 豆苗 (Fluid Rendering Research Agent)*
*Date: 2026-06-21*
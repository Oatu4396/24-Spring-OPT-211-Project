# OPT211S24 Final Report: far-field diffraction

Tianqiao Zhang, Qiuran Zhu, Yuan xing, Mengru Zhang

## Introduction

This project focuses on the simulation of far-field diffraction patterns generated by various shaped apertures, utilizing a MATLAB-based computational approach. By examining how light waves diffract through apertures of distinct geometries—such as squares, single and double slits, circles, and equilateral triangles—we aim to deepen our understanding of wave optics principles. The scientific purpose of this study is to explore the characteristics of diffraction and interference, which are fundamental to numerous applications in optical engineering and physics, including the design of optical instruments and the analysis of light behavior in various mediums.

## Script Description

The MATLAB script developed for this project effectively combines graphical user interface (GUI) elements with computational physics to simulate and visualize far-field diffraction patterns of various apertures. The core functionality of the script is encapsulated in several key components, each designed to handle specific tasks within the simulation process.

User Interface Setup: The script initiates by constructing a user-friendly GUI, labeled interference, which houses a grid layout filled with buttons. Each button represents a different aperture shape, including standard geometries like squares and circles, as well as more complex shapes such as rings and ellipticals. Users can interact with these buttons to select the type of aperture they wish to simulate. Upon selection, the script triggers the fourierInterference function, which is responsible for computing and displaying the diffraction pattern corresponding to the chosen aperture.

Diffraction Pattern Computation and Visualization: The fourierInterference function is at the heart of the script, where the Fourier transform of the aperture's binary matrix is computed to simulate the diffraction pattern. This function not only calculates the pattern but also adjusts the intensity for better visualization, catering to both the full-field and a zoomed-in center-field view. Additionally, it plots intensity cross- sections to provide a detailed analysis of the pattern's characteristics, which is essential for understanding the underlying physics of diffraction.

Plotting Utilities: To aid in the visualization, the script includes specific plotting functions, draw and crossSection. The draw function is designed to display the diffraction patterns with appropriate scaling and coloring, ensuring that the visualization accurately represents the physical phenomena. The crossSection function further enhances the analysis by plotting the intensity distribution across a specified section of the diffraction pattern, highlighting the symmetry and peak distribution.

Aperture Definition Functions: The script defines various apertures through dedicated functions such as squareAP, circleAP, and doubleSlitAP, each crafting a binary matrix to represent the aperture shape spatially. These functions are pivotal as they set up the initial conditions for the Fourier transform computations.

Custom and Complex Aperture Functions: Extending the versatility of the script,
functions like triangleRingAP, qiuranRingAP, and ellipseAP are included to handle more intricate aperture designs. These functions utilize advanced geometric calculations and logical operations to craft unique aperture shapes, thereby broadening the scope of diffraction patterns that can be studied.

## Conclusion

In this study, we have successfully utilized MATLAB to develop a script for simulating and visualizing far-field diffraction patterns generated by various shaped apertures. Through the examination of diffraction and intensity cross-section graphs, we observed the characteristic spreading of waves as they passed through an aperture. Despite variations in aperture shapes, such as changes from circular to ring, or from single to double slit, common patterns emerged. Each diffraction pattern exhibited a central brightest spot, followed by alternating bright and dark fringes expanding outward with consistent spacing, gradually fading away from the center.

Specifically, the diffraction patterns manifested distinct features depending on the aperture shape. As for square apertures, the bright spots appeared in a rectangle configuration, while for circular and elliptical apertures, they formed concentric circles. Triangular apertures yielded diffraction patterns in the form of lines at three angles. Notably, our analysis revealed that narrower openings resulted in more obvious diffraction, as demonstrated by single slit and elliptical openings. In summary, our finding underscores the consistent rule behavior of diffraction patterns across various aperture shapes and enhances our understanding of wave optics principles.

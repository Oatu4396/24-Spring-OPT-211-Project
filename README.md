# 24 Spring OPT 211 Project

## How to create/test your apertures

Create a file name besides your aperture function's name. Then, put the following code to the beginning of the file:

``` matlab
figure
imagesc(YourApertureFunction()) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 5000 0 5000]) % Set axes limits to size of aperture field
```

Remember change the function inside imagesc() to your aperture function's name.

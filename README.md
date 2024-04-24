# 24 Spring OPT 211 Project

## How to create/test your apertures

Create a file with the same name of your aperture function's name. Then, put the following code to the beginning of the file:

``` matlab
figure
imagesc(YourApertureFunction()) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 5000 0 5000]) % Set axes limits to size of aperture field
```

Remember change the function inside imagesc() to your aperture function's name.

The file is named test.m inside Aperture folder which you can directly use it by only change the function name.
Please DON'T commit any changes on this file to the repository.

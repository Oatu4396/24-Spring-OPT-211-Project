% Draw A Circular Aperture:
function ap = circleAP
% Define Aperture field
apl = 5000; % Size of the aperture field
ap = zeros(apl); % Define actual aperture plane

% Define the center and the radius of the circle:
circle_xcenter = apl / 2;
circle_ycenter = apl / 2;
r = 275; % The radius is 275 pixels.

% Create a grid of (x,y) coordinates
[X, Y] = meshgrid(1:apl, 1:apl);

% Calculate the distance from the center to each point in the grid
distances = sqrt((X - circle_xcenter).^2 + (Y - circle_ycenter).^2);

% Set the points within the specified radius to 1
ap(distances <= r) = 1;


figure;
imagesc(ap);
colormap gray;
axis equal;
axis([0 apl 0 apl]);
title('The Circular Aperture');

return
end

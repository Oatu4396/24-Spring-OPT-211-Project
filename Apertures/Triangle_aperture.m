% Define the size of the aperture field
fieldSize = 5000;
aperture = zeros(fieldSize, fieldSize);

% Define the length of the side of the equilateral triangle
sideLength = 900;

% Calculate the height of the triangle
triangleHeight = (sqrt(3)/2) * sideLength;

% Find the center of the field
centerX = fieldSize / 2;
centerY = fieldSize / 2;

% Calculate the vertices of the triangle
% Vertex A (top vertex)
Ax = centerX;
Ay = centerY - (triangleHeight / 2);

% Vertex B (bottom left)
Bx = centerX - (sideLength / 2);
By = centerY + (triangleHeight / 2);

% Vertex C (bottom right)
Cx = centerX + (sideLength / 2);
Cy = centerY + (triangleHeight / 2);

% Scan each pixel in the field to determine if it lies within the triangle
for x = 1:fieldSize
    for y = 1:fieldSize
        % Use the barycentric coordinate method or half-plane method to test
        % if the point lies within the triangle defined by A, B, and C
        b1 = sign(x * (Ay - By) + y * (Bx - Ax) + Ax * By - Ay * Bx) < 0;
        b2 = sign(x * (By - Cy) + y * (Cx - Bx) + Bx * Cy - By * Cx) < 0;
        b3 = sign(x * (Cy - Ay) + y * (Ax - Cx) + Cx * Ay - Cy * Ax) < 0;

        % If the point is within the triangle, set it to 1
        if ((b1 == b2) && (b2 == b3))
            aperture(y, x) = 1;  % MATLAB uses y,x for row,column indexing
        end
    end
end

% Display the aperture
imagesc(aperture);
colormap gray;
axis equal;
axis tight; % Ensure there are no extra white space around the image
title('The Circular Aperture');
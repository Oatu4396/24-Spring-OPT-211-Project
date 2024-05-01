function ap = triangleRingAP
    % Define Aperture field
    apl = 5000; % Size of the aperture field
    ap = zeros(apl); % Define actual aperture plane
  
    % Define the center and the side lengths for the triangles
    triangle_center = [apl / 2, apl / 2];
    sideLength_outer = 900; % Side length of the outer triangle
    sideLength_inner = 600; % Side length of the inner triangle
    
    % Define vertices for the outer triangle
    outer_vertices = [
        triangle_center(1), triangle_center(2) - (sqrt(3)/3)*sideLength_outer; % Top vertex
        triangle_center(1) - sideLength_outer/2, triangle_center(2) + (sqrt(3)/6)*sideLength_outer; % Bottom left vertex
        triangle_center(1) + sideLength_outer/2, triangle_center(2) + (sqrt(3)/6)*sideLength_outer; % Bottom right vertex
    ];
    
    % Define vertices for the inner triangle
    inner_vertices = [
        triangle_center(1), triangle_center(2) - (sqrt(3)/3)*sideLength_inner; % Top vertex
        triangle_center(1) - sideLength_inner/2, triangle_center(2) + (sqrt(3)/6)*sideLength_inner; % Bottom left vertex
        triangle_center(1) + sideLength_inner/2, triangle_center(2) + (sqrt(3)/6)*sideLength_inner; % Bottom right vertex
    ];
    
    % Create a grid of (x,y) coordinates
    [X, Y] = meshgrid(1:apl, 1:apl);
    
    % Check if each point is inside the outer triangle but outside the inner triangle
    in_outer_triangle = inpolygon(X, Y, outer_vertices(:,1), outer_vertices(:,2));
    in_inner_triangle = inpolygon(X, Y, inner_vertices(:,1), inner_vertices(:,2));
    
    ap(in_outer_triangle & ~in_inner_triangle) = 1;
    return
end

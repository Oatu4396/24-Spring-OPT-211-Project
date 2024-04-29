% Draw A Circular Ring Aperture:
function ap = qiuranRingAP
    % Define Aperture field
    apl = 5000; % Size of the aperture field
    ap = zeros(apl); % Define actual aperture plane
  
    % Define the center and the radius
    circle_xcenter = apl / 2;
    circle_ycenter = apl / 2;
    r1 = 275; % The bigger radius ==> 275 pixels.
    r2 = 175; % The smaller radius ==> 175 pixels.
  
    % Create a grid of (x,y) coordinates
    [X, Y] = meshgrid(1:apl, 1:apl);
    
    % Calculate the distance from the center to each point in the grid
    distances = sqrt((X - circle_xcenter).^2 + (Y - circle_ycenter).^2);
    
    ap(r2 <= distances & distances <= r1) = 1;
    
    
    figure;
    imagesc(ap);
    colormap gray;
    axis equal;
    axis([0 apl 0 apl]);
    title('The Circular Aperture');
  
    return
end

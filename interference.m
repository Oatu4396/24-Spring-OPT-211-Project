%% Aperture Selection UI

function interference()
    % Create the aperture selection UI
    fig = uifigure('Name', 'Apertures', 'Position', [100 100 400 150]);
    buttonGrid = uigridlayout(fig, [2, 5]);

    % Populate the button grid
    buttons = cell(2, 5);  % Create a cell array to store buttons
    for i = 1:2
        for j = 1:5
            buttons{i,j} = uibutton(buttonGrid);
            buttons{i,j}.Layout.Row = i;
            buttons{i,j}.Layout.Column = j;
        end
    end
    % Square Aperture
    buttons{1,1}.Text = 'Square';
    buttons{1,1}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(squareAP(),'Square');
    % Single Slit Aperture
    buttons{1,2}.Text = 'Single Slit';
    buttons{1,2}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(singleSlitAP(),'Single Slit');
    % double Slit Aperture
    buttons{1,3}.Text = 'Double Slit';
    buttons{1,3}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(doubleSlitAP(),'Double Slit');
    % circular Aperture
    buttons{1,4}.Text = 'Circlar';
    buttons{1,4}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(circleAP(),'Circular');
    % triangular Aperture
    buttons{1,5}.Text = 'Triangular';
    buttons{1,5}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(triangleAP(),'Triangular');
    % ring Aperture
    buttons{2,1}.Text = 'Ring';
    buttons{2,1}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(qiuranRingAP(),'Ring');
    % grid Aperture
    buttons{2,2}.Text = 'Grid';
    buttons{2,2}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(gridAP(),'Grid');
    % triangular Aperture
    buttons{2,3}.Text = 'Triangular Ring';
    buttons{2,3}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(triangleRingAP(),'Triangular Ring');
    % mengru's AP (pending)
    buttons{2,4}.Text = 'Elliptical';
    buttons{2,3}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(ellipseAP(),'Elliptical');
    % Quit button
    buttons{2,5}.Text = 'Quit';
    buttons{2,5}.ButtonPushedFcn = @(btn,event) ...
        delete(fig);
end

%% Interference Calculation & Plot

function fourierInterference(ap,apName)
    I = abs(fftshift(fft2(ap))).^2; % Calculate intensity
    centeredI = I(2376:2626,2376:2626);

    brightI = I.^0.25; % Adjust brightness
    brightCenteredI = centeredI.^0.25;

    % Draw Full-Field Far Field Diffraction Pattern
    draw(brightI);
    hold on
    % Put plot parameters here
    title(['Full-Field Far Field Diffraction Pattern of ' apName ' Aperture']);

    hold off
    
    % Draw Center-Field Far Field Diffraction Pattern
    
    draw(brightCenteredI);
    hold on
    % Put plot parameters here
    title(['Center-Field Far Field Diffraction Pattern of ' apName ' Aperture']);

    hold off

    % Draw Intensity Cross Sections of the Diffraction Pattern
    crossSection(centeredI);
    hold on
    % Put plot parameters here
    title(['Intensity Cross Section of the ' apName ' Aperture Diffraction Pattern (x-axis)']);

    hold off

    % Draw Intensity Cross Sections of the Diffraction Pattern
    crossSection(centeredI.');
    hold on
    % Put plot parameters here
    title(['Intensity Cross Section of the ' apName ' Aperture Diffraction Pattern (y-axis)']);

    hold off
end

%% Plot Function

function draw(pattern)
    % Plot the aperture field
    figure
    imagesc(pattern) % Plot image of the aperture field
    colormap gray % Set the color of the aperture field plot
    axis equal % Set the display scale of the axes
    [x,y] = size(pattern);
    axis([0 x 0 y]) % Set axes limits to size of aperture field
end

function crossSection(pattern)
    figure
    sideLength = size(pattern(:,1));
    x = 1:1:sideLength(1);
    y = pattern((sideLength(1)+1)/2,:);
    plot(x,y,LineWidth=1);
    
    xlim([0 sideLength(1)]);
    xlabel('Position [pixels]')
    ylabel('Intensity [Arb. Units]')
end

%% Apertures

function ap = squareAP
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane
    sql=500; % Define square length
    
    for i=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
        for j=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
            ap(i,j)=1;
        end
    end

    return
end

function ap = singleSlitAP
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane
    w=200; % Define square length
    h=2500;

    for i=round(1+apl/2-h/2):round(1+apl/2+h/2)
        for j=round(1+apl/2-w/2):round(1+apl/2+w/2)
            ap(i,j)=1;
        end
    end

    return
end

function ap = doubleSlitAP
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane
    w=175; % Define square length
    h=2500;
    spc=500;

    for i=round(1+apl/2-h/2):round(1+apl/2+h/2)
        for j=round(1+apl/2-spc/2-w/2):round(1+apl/2-spc/2+w/2)
            ap(i,j)=1;
        end
    end
    for i=round(1+apl/2-h/2):round(1+apl/2+h/2)
        for j=round(1+apl/2+spc/2-w/2):round(1+apl/2+spc/2+w/2)
            ap(i,j)=1;
        end
    end

    return
end

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
    return
end

function ap = triangleAP
    % Define the size of the aperture field
    fieldSize = 5000;
    ap = zeros(fieldSize, fieldSize);
    
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
                ap(y, x) = 1;  % MATLAB uses y,x for row,column indexing
            end
        end
    end
end

function ap = gridAP
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane
    w=200; % Define square length
    h=2500;

    % '+' Part
    for i=round(1+apl/2-h/2):round(1+apl/2+h/2)
        for j=round(1+apl/2-w/2):round(1+apl/2+w/2)
            ap(i,j)=1;
        end
    end
    for i=round(1+apl/2-w/2):round(1+apl/2+w/2)
        for j=round(1+apl/2-h/2):round(1+apl/2+h/2)
            ap(i,j)=1;
        end
    end

    % '口' part
    for i=round(1+apl/2-h/2-w/2):round(1+apl/2+h/2+w/2)
        for j=round(1+apl/2+h/2-w/2):round(1+apl/2+h/2+w/2)
            ap(i,j)=1;
        end
    end

    for i=round(1+apl/2-h/2-w/2):round(1+apl/2+h/2+w/2)
        for j=round(1+apl/2-h/2-w/2):round(1+apl/2-h/2+w/2)
            ap(i,j)=1;
        end
    end

    for i=round(1+apl/2-h/2-w/2):round(1+apl/2+h/2+w/2)
        for j=round(1+apl/2+h/2-w/2):round(1+apl/2+h/2+w/2)
            ap(j,i)=1;
        end
    end

    for i=round(1+apl/2-h/2-w/2):round(1+apl/2+h/2+w/2)
        for j=round(1+apl/2-h/2-w/2):round(1+apl/2-h/2+w/2)
            ap(j,i)=1;
        end
    end
    return
end

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
    return
end

function ap = ellipseAP
    % Define Aperture field
    apl=5000; % Size of the aperture field 
    ap=zeros(apl); % Define actual aperture plane

    % Define ellipse aperture
    r=170;a=0.5;b=1.3;
    [xx, yy] = meshgrid(1:apl, 1:apl);
    distances = (((xx - apl/2)./a).^2 + ((yy - apl/2)./b).^2).^0.5;
    ap(distances <= r)=1;
    return
end


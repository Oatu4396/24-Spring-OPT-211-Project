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
        fourierInterference(squareAP());
    % Single Slit Aperture
    buttons{1,2}.Text = 'Single Slit';
    buttons{1,2}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(singleSlitAP());
    % double Slit Aperture
    buttons{1,3}.Text = 'Double Slit';
    buttons{1,3}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(doubleSlitAP());
    % circle Aperture
    buttons{1,3}.Text = 'Circle';
    buttons{1,3}.ButtonPushedFcn = @(btn,event) ...
        fourierInterference(circleAP());
    % Quit button
    buttons{2,5}.Text = 'Quit';
    buttons{2,5}.ButtonPushedFcn = @(btn,event) ...
        delete(fig);
end

%% Interference 
function fourierInterference(ap)
    I=(abs(fftshift(fft2(ap))).^2); % Calculate intensity
    I=I.^0.3; % Adjust brightness
    draw(I);
    hold on
    % Put plot parameters here
    title('Normal');

    hold off
    
    draw(I(2376:2626,2376:2626));
    hold on
    % Put plot parameters here
    title('Enlarged');

    hold off
end

%% Draw Aperture Function
%  Only for test
function draw(pattern)
    % Plot the aperture field
    figure
    imagesc(pattern) % Plot image of the aperture field
    colormap gray % Set the color of the aperture field plot
    axis equal % Set the display scale of the axes
    [x,y] = size(pattern);
    axis([0 x 0 y]) % Set axes limits to size of aperture field
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
    
    
    figure;
    imagesc(ap);
    colormap gray;
    axis equal;
    axis([0 apl 0 apl]);
    title('The Circular Aperture');
    
    return
end

function ap = tianqiaoAP
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

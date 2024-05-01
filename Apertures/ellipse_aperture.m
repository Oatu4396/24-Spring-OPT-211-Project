% Draw A Circular Aperture:
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

    % Plot the aperture field
    figure
    hold on
    imagesc(ap)
    colormap gray % Set the color of the aperture field plot
    axis equal % Set the display scale of the axes
    axis([0 apl 0 apl]) % Set axes limits to size of aperture field
    set(gca, 'YDir', 'reverse'); % Get current axis and change direction of y-axis
    xlabel('x-axis [pixels]','FontSize', 16)
    ylabel('y-axis [pixels]','FontSize', 16)
    title('double slit aperture','FontSize', 18)

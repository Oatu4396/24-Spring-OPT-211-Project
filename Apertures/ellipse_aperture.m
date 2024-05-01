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

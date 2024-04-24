% Plot the aperture field
figure
imagesc(singleSlitAP()) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 5000 0 5000]) % Set axes limits to size of aperture field

function ap = squareAP
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane
    sql=2000; % Define square length
    
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
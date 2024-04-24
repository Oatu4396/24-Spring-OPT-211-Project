% Draw a '田' shaped aperture
% Plot the aperture field
figure
imagesc(tianqiaoAP()) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field

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
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
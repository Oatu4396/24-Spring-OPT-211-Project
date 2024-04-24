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
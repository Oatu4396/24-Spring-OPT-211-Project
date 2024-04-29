# Create Apertures
In order to combine apertures later, aperture codes have to follow the function format below:
``` matlab
function ap = APERTURENAME
    apl=5000; % Size of the aperture field
    ap=zeros(apl); % Define actual aperture plane

    % PUT YOUR APERTURE CODE HERE

    return
end
```
Name your file the same as your aperture name.

### Here's a valid aperture example:

Filename: singleSlitAP.m
``` matlab
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
```

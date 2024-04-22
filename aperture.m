% Define Aperture field
apl=5000; % Size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define square aperture
sql=2000; % Define square length

for i=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for j=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
        ap(i,j)=1;
    end
end

% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
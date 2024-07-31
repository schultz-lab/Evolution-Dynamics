function plotcircle(x,y,radius,c)

% Define the center and radius of the circle
circleCenter = [x, y];  % Define the center (x, y) coordinates
circleRadius = radius;

% Define the angles for the sector
theta = linspace(0, pi/2, 100);  % Adjust the angle range as needed

% Define the colors for each quadrant
colors = {[230 25 75]/256, [0 130 200]/256, [225 225 25]/256, [60 180 75]/256};

% Plot the sectors of the circle
for i = 1:4
    sectorStart = (i - 1) * pi / 2;
    sectorEnd = i * pi / 2;
    
    x_sector = [circleCenter(1), circleCenter(1) + circleRadius * cos(theta + sectorStart), circleCenter(1)];
    y_sector = [circleCenter(2), circleCenter(2) + circleRadius * sin(theta + sectorStart), circleCenter(2)];
    
    if c(i)
        color=colors{i};
    else
        color=[1 1 1];
    end

    h = patch(x_sector, y_sector, color);
    set(h, 'EdgeColor', 'k', 'LineWidth', 2);
end

% Set axis limits and labels
axis equal;  % Equal scaling for x and y axes
xlabel('X-axis');
ylabel('Y-axis');

end
close all;

syms x;

f = input("Enter the function: ");
fL = input("Enter the interval on which the function is defined: ");
yr = input("Enter the axis of rotation y = c (enter only c value): ");
iL = input("Enter the integration limits: ");

Volume = pi*int((f-yr)^2,iL(1),iL(2));

sprintf("Volume is %3f", double(Volume))

fx = @(x) eval(vectorize(f));

xvals = linspace(fL(1), fL(2), 201);
xvalsr = fliplr(xvals);

xivals = linspace(iL(1), iL(2), 201);
xivalsr = fliplr(xivals);

xlim = [fL(1) fL(2)+0.5];
ylim = fx(xlim);

figure('Position',[100 200 560 420]) 
subplot(2,1,1)

hold on;

plot(xvals, fx(xvals), 'k-', 'LineWidth', 2);
plot([fL(1) fL(2)], [yr yr], 'r-', 'LineWidth',2);
fill([xivals xivalsr], [fx(xivals) ones(size(xivalsr))*yr], [0.8 0.8 0.8], 'FaceAlpha', 0.8)

legend('Function plot', 'Axis of Rotation', 'Filled Region', 'Location', 'Best');
title('Function y=f(x) and Region')

set(gca, 'XLim', xlim)
xlabel('x-axis')
ylabel('y-axis')

subplot(2,1,2)
hold on;

plot(xivals, fx(xivals), 'b-', 'LineWidth', 2);
plot([iL(1) iL(2)], [yr, yr], 'r-', 'LineWidth',2);
fill([xivals xivalsr], [fx(xivals) ones(size(xivalsr))*yr], [0.8 0.8 0.8], 'FaceAlpha', 0.8)

plot(xivals, -fx(xivals)+2*yr, 'm-', 'LineWidth',2);
fill([xivals xivalsr], [ones(size(xivals))*yr -fx(xivalsr)+2*yr], [1 0.8 0.8], 'FaceAlpha', 0.8)
title('Rotated Region in xy-Plane');

set(gca, 'XLim', xlim)
xlabel('x-axis')
ylabel('y-axis')

[X, Y, Z] = cylinder(fx(xivals)-yr, 100);

figure('Position', [700 200 560 420])
Z = iL(1) + Z.*(iL(2)-iL(1));

surf(Z, Y+yr, X, 'EdgeColor', 'none', 'FaceColor', 'flat', 'FaceAlpha', 0.6)
hold on;
plot([iL(1) iL(2)], [yr yr], 'r-', 'LineWidth',2)
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
view(21, 11)

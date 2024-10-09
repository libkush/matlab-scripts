close all;

syms x

y1 = 1/x;
y2 = x+1;

intersections = double(solve(y1-y2));
poi = sort(intersections);
n = length(poi);
mn = min(poi);
mx = max(poi);

fplot(y1, [mn-2, mx+2]);
hold on
fplot(y2, [mn-2, mx+2]);

total_area = 0;

for i=1:n-1
    area = int(y1-y2, poi(i), poi(i+1));
    total_area = total_area + abs(area);
    general_x = linspace(poi(i), poi(i+1));
    upper = subs(y1, x, general_x);
    lower = subs(y2, x, general_x);
    xx = [general_x, fliplr(general_x)];
    yy = [upper, fliplr(lower)];
    % fill(xx, yy, 'g')
    grid on
end
hold off
sprintf("Total area is %d", total_area)

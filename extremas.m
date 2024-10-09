close all;
syms x real
% x is the side of the cut-out square
% hence length and width of the box will
% be given by 9 - 2x and height will be x
% hence the volume is given by the function
% V = x*(9-2x)^2
V = x * (9 - 2*x)^2;
Vx = diff(V,x);
c = solve(Vx, x);
cmin = min(double(c));
cmax = max(double(c));
fplot(V, [cmin-2, cmax+2]);
hold on
Vxx = diff(Vx, x);
for i = 1:1:size(c)
    T1 = subs(Vxx, x, c(i));
    T3 = subs(V, x, c(i));
    X = double(c(i));
    if (double(T1) < 0)
        sprintf('Side of cut-out square is %d', X)
        sprintf('Area of cutout square is %d', X^2)
        sprintf('The maximum value of volume is %d', T3)
    end
    plot(double(c(i)), double(T3), 'r*', MarkerSize=15)
end
hold off

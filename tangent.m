close all;
syms x
y = x + cos(x);

x1 = pi/2;
D = [0 2*pi];
fplot(y, D)
hold on

yd = diff(y,x);
slope = subs(yd, x, x1);
y1 = subs(y, x, x1);

plot(x1, y1, 'ko');

Tgt_line = slope*(x-x1)+y1;
h = fplot(Tgt_line, D);
set(h, 'color', 'r')

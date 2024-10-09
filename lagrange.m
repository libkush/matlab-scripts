close all;
syms x y lam real;

f = input("Enter f(x, y) to be extremized:");
g = input("Enter the constraint function g(x, y):");

%f = x^2+2*y^2;
%g = x^2+y^2-1;

F = f-lam*g;

Fx = diff(F, x);
Fy = diff(F, y);
[ax, ay, alam] = solve([Fx, Fy, g], x, y, lam);
ax = double(ax);
ay = double(ay);

r=1;
for k=1:1:size(ax)
    if ((imag(ax(k))==0)&&(imag(ay(k))==0))
        ptx(r)=ax(k);
        pty(r)=ay(k);
        r=r+1;
    end
end

ax = ptx;
ay = pty;
T= double(subs(f, {x, y}, {ax, ay}));
epx = 3;
epy = 3;
figure (1)
for i = 1:length(T)
    D = [ax(i)-epx ax(i)+epx ay(i)-epy ay(i)+epy];
    fprintf('The critical point (x, y) is (%1.3f, %1.3f).', ax(i), ay(i))
    fprintf('The value of the function is %1.3f\n', T(i))
    fcontour(f, D)
    hold on
    h = ezplot(g, D);
    set(h, 'Color', [1, 0.7, 0.9])
    plot(ax(i), ay(i), 'k.', 'MarkerSize', 15+2*i)
end

f_min = min(T);
f_max = max(T);

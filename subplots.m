close all;

x = 0:0.1:4*pi;

subplot(2,1,1)
plot(x,exp(sin(x)), 'k-');

subplot(2,1,2)
plot(x,sin(exp(x)),'r-');

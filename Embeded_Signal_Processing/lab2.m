clear;
clc;

t1=-5;
t2=5;
fs=15;
N=4096;
tau=20*pi;
[t,y]=impulse_train(t1,t2,N,fs);
[f0,X1]=myfun_SA(t,y);
xt= tau*sinc((tau*t)/(2*pi));
[f1,X2]=myfun_SA(t,xt);
yt=xt.*y;


fc=8 ;
[z, p, k] = buttap(5) ;
[num, den] = zp2tf(z,p,k) ;
[num, den] = lp2lp(num, den, 2*pi*fc) ;
[num_d, den_d] = bilinear( num, den, 1/abs(t(2)-t(1)) ) ;
y_out = filter( num_d, den_d, yt ) ;
[f2,X3]=myfun_SA(t,yt);
[f3,X4]=myfun_SA(t,y_out);


% %f=20
% figure(1)
% subplot(321)
% plot(t,y)
% grid on;
% axis([-1 1 0 1.2])
% subplot(322)
% plot(f0,abs(X1))
% grid on;
% axis([-30 30 0 0.5])
% subplot(323)
% plot(t,xt)
% grid on;
% axis([-1 1 -20 80])
% subplot(324)
% plot(f1,abs(X2))
% grid on;
% axis([-30 30 0 8])
% subplot(325)
% plot(t,yt)
% grid on;
% axis([-1 1 -20 80])
% subplot(326)
% plot(f2,abs(X3))
% grid on;
% axis([-30 30 0 0.2])
% 
% figure(2)
% subplot(221)
% plot(t,yt)
% grid on;
% axis([-1 1 -20 80])
% subplot(222)
% plot(t,y_out)
% grid on;
% axis([-1 1 -1 3])
% subplot(223)
% plot(f2,abs(X3))
% grid on;
% axis([-30 30 0 0.2])
% subplot(224)
% plot(f3,abs(X4))
% grid on;
% axis([-30 30 0 0.35])



% %f=10
% figure(1)
% subplot(321)
% plot(t,y)
% grid on;
% axis([-1 1 0 1.2])
% subplot(322)
% plot(f0,abs(X1))
% grid on;
% axis([-30 30 0 0.25])
% subplot(323)
% plot(t,xt)
% grid on;
% axis([-1 1 -20 80])
% subplot(324)
% plot(f1,abs(X2))
% grid on;
% axis([-30 30 0 8])
% subplot(325)
% plot(t,yt)
% grid on;
% axis([-1 1 -20 80])
% subplot(326)
% plot(f2,abs(X3))
% grid on;
% axis([-30 30 0 0.2])
% 
% figure(2)
% subplot(221)
% plot(t,yt)
% grid on;
% axis([-1 1 -20 80])
% subplot(222)
% plot(t,y_out)
% grid on;
% axis([-1 1 -1 2.5])
% subplot(223)
% plot(f2,abs(X3))
% grid on;
% axis([-30 30 0.1 0.2])
% subplot(224)
% plot(f3,abs(X4))
% grid on;
% axis([-30 30 0 0.2])



%f=15
figure(1)
subplot(321)
plot(t,y)
grid on;
axis([-1 1 0 1.2])
subplot(322)
plot(f0,abs(X1))
grid on;
axis([-30 30 0 0.4])
subplot(323)
plot(t,xt)
grid on;
axis([-1 1 -20 80])
subplot(324)
plot(f1,abs(X2))
grid on;
axis([-30 30 0 8])
subplot(325)
plot(t,yt)
grid on;
axis([-1 1 -20 80])
subplot(326)
plot(f2,abs(X3))
grid on;
axis([-30 30 0 0.25])

figure(2)
subplot(221)
plot(t,yt)
grid on;
axis([-1 1 -20 80])
subplot(222)
plot(t,y_out)
grid on;
axis([-1 1 -1 2.5])
subplot(223)
plot(f2,abs(X3))
grid on;
axis([-30 30 0 0.25])
subplot(224)
plot(f3,abs(X4))
grid on;
axis([-30 30 0 0.25])
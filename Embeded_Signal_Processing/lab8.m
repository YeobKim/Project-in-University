clear;
clc;

% % 3.1
% r = 1;
% A = 0:0.001:2*pi;
% ox = r*cos(A);
% oy = r*sin(A);
% a = [0 0 0 1];
% b = [1 2 2 1];
% fs1 = 5;
% fs2 = 10;
% [z,p,k] = tf2zp(a,b);
% for i = 1:length(p)
%     p_r(i) = real(p(i));
%     p_i(i) = imag(p(i));
% end
% for i = 1:length(z)
%     z_r(i) = real(z(i));
%     z_i(i) = imag(z(i));
% end
% 
% [x1, y1] = bilinear(a, b, fs1);
% [z1,p1,k1] = tf2zp(x1,y1);
% 
% for i = 1:length(p1)
%     p_r1(i) = real(p1(i));
%     p_i1(i) = imag(p1(i));
% end
% for i = 1:length(z1)
%     z_r1(i) = real(z1(i));
%     z_i1(i) = imag(z1(i));
% end
% 
% [x2, y2] = bilinear(a, b, fs2);
% [z2,p2,k2] = tf2zp(x2,y2);
% for i = 1:length(p2)
%     p_r2(i) = real(p2(i));
%     p_i2(i) = imag(p2(i));
% end
% for i = 1:length(z2)
%     z_r2(i) = real(z2(i));
%     z_i2(i) = imag(z2(i));
% end
% 
% figure(1)
% subplot(221)
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p)
%     plot(p_r(i), p_i(i),'xk');
% end
% for i = 1:length(z)
%     plot(z_r(i), z_i(i),'ok');
% end
% grid on;
% xlim([-1 1]);
% xlabel('Real(s)');
% ylabel('Imag(s)');
% 
% subplot(223)
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p1)
%     plot(p_r1(i), p_i1(i),'xk');
% end
% for i = 1:length(z1)
%     plot(z_r1(i), z_i1(i),'ok');
% end
% grid on;
% xlim([-1 1]);
% xlabel('Real(s)');
% ylabel('Imag(s)');
% 
% subplot(224)
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p2)
%     plot(p_r2(i), p_i2(i),'xk');
% end
% for i = 1:length(z2)
%     plot(z_r2(i), z_i2(i),'ok');
% end
% grid on;
% xlim([-1 1]);
% xlabel('Real(s)');
% ylabel('Imag(s)');
% 
% w = 0:0.001:2;
% H = freqs(a,b,w);
% % 이산주파수는 원신호 주파수와 표본화 주파수의 비율
% Hd1 = freqz(x1,y1,w/fs1);
% Hd2 = freqz(x2,y2,w/fs2);
% 
% figure(2)
% plot(w,abs(H));
% hold on;
% plot(w,abs(Hd1));
% hold on;
% plot(w,abs(Hd2));
% grid on;
% ylim([0 1.4]);
% xlabel('Frequency ω[rad/sec]')
% ylabel('|H(ω)|')
% legend('Analog Butterworth Filter','Digital Butterworth Filter, f_s=5Hz', 'Digital Butterworth Filter f_s=10Hz');
% 
% t1 = linspace(0,49,50);
% t2 = linspace(0,99,100);
% t3 = linspace(0,149,150);
% imp1 = [1 zeros(1,49)];
% yi1 = filter(x2,y2,imp1);
% imp2 = [1 zeros(1,99)];
% yi2 = filter(x2,y2,imp2);
% imp3 = [1 zeros(1,149)];
% yi3 = filter(x2,y2,imp3);
% 
% figure(3)
% subplot(311)
% stem(t1,yi1);
% grid on;
% xlabel('n');
% ylabel('h[n],L=50');
% subplot(312)
% stem(t2,yi2);
% grid on;
% xlabel('n');
% ylabel('h[n],L=100');
% subplot(313)
% stem(t3,yi3);
% grid on;
% xlabel('n');
% ylabel('h[n],L=150');

% % 3.2
% f = 1500:0.001:5500;
% fs = 50000;
% Ts = 1/fs;
% 
% [z1,p1,k1]=buttap(7);
% [b1,a1] = zp2tf(z1,p1,k1);
% [n1,d1] = lp2bp(b1,a1,3000,2000);
% H_1 = freqs(n1,d1,f);
% [n2,d2] = lp2hp(b1,a1,4000);
% H_2 = freqs(n2,d2,f);
% [n2,d2] = lp2hp(b1,a1,4000*2*pi);
% [n1,d1] = lp2bp(b1,a1,3000*2*pi,2000*2*pi);
% [x1, y1] = bilinear(n1, d1, fs);
% [x2, y2] = bilinear(n2, d2, fs);
% Hd1 = freqz(x1,y1,(f./fs)*(2*pi));
% Hd2 = freqz(x2,y2,(f./fs)*(2*pi));
% 
% figure(1)
% plot(f,abs(H_1));
% hold on;
% plot(f,abs(H_2))
% hold on;
% plot(f,abs(Hd1));
% hold on;
% plot(f,abs(Hd2));
% grid on;
% xlabel('Frequency,f[Hz]');
% ylabel('|H(f)|');
% legend('Anlog BPF','Digital BPF','Analog HPF','Digital HPF');

% 3.3
n = linspace(0,499,500);
fs = 3000;
t = n/fs;

[z1,p1,k1]=buttap(7);
[b1,a1] = zp2tf(z1,p1,k1);
[n1,d1] = lp2lp(b1,a1,300*2*pi);
[x1, y1] = bilinear(n1, d1, fs);

xn = cos(2*pi*(100/fs)*n)+cos(2*pi*(500/fs)*n);
yn = filter(x1,y1,xn);

[f1,X1] = myfun_SA(t,xn);
[f2,X2] = myfun_SA(t,yn);

Hdz = freqz(x1,y1,(f1/fs)*2*pi);

figure(1)
subplot(321);
plot(t,xn); 
grid on;
xlim([0 0.1]);
xlabel('t[sec]');
ylabel('x(t)');
subplot(325);
plot(t,yn);
xlim([0 0.1]);
ylim([-1.5 1.5]);
grid on;
xlabel('t[sec]');
ylabel('y(t)');
subplot(322);
stem(f1,abs(X1));
grid on;
xlim([0 600]);
xlabel('Frequency, f[Hz]');
ylabel('|X(f)|');
subplot(324);
plot(f1, abs(Hdz));
grid on;
xlabel('Frequency, f[Hz]');
ylabel('Frequency response, |H_d(f)|');
xlim([0 600]);
ylim([0 1]);
subplot(326);
stem(f2, abs(X2));
grid on;
xlim([0 600]);
xlabel('Frequency, f[Hz]');
ylabel('|Y(f)|');
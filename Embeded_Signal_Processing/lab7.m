clc;
clear;

% % 3.1 
% % Butterworth
% n = 5;
% r = 1;
% [z1,p1,k1] = buttap(n);
% A = 0:0.001:2*pi;
% ox = r*cos(A);
% oy = r*sin(A);
% 
% for i = 1:length(p1)
%     p1_r(i) = real(p1(i));
%     p1_i(i) = imag(p1(i));
% end
% 
% for i = 1:length(z1)
%     z1_r(i) = real(z1(i));
%     z1_i(i) = imag(z1(i));
% end
% % Chebyshev Type -弘/弗 
% Rp = 10;
% Rs = 30;
% [z2,p2,k2] = cheb1ap(n,Rp);
% for i = 1:length(p2)
%     p2_r(i) = real(p2(i));
%     p2_i(i) = imag(p2(i));
% end
% 
% for i = 1:length(z2)
%     z2_r(i) = real(z2(i));
%     z2_i(i) = imag(z2(i));
% end
% 
% [z3,p3,k3] = cheb2ap(n,Rs);
% for i = 1:length(p3)
%     p3_r(i) = real(p3(i));
%     p3_i(i) = imag(p3(i));
% end
% 
% for i = 1:length(z3)
%     z3_r(i) = real(z3(i));
%     z3_i(i) = imag(z3(i));
% end
% 
% %Elliptic
% [z4,p4,k4] = ellipap(n,Rp,Rs);
% for i = 1:length(p4)
%     p4_r(i) = real(p4(i));
%     p4_i(i) = imag(p4(i));
% end
% 
% for i = 1:length(z4)
%     z4_r(i) = real(z4(i));
%     z4_i(i) = imag(z4(i));
% end
% 
% figure(1)
% subplot(221);
% plot(ox,oy,'-.');
% hold on;
% grid on;
% for i = 1:length(z1)
%     plot(z1_r(i),z1_i(i),'ok')
% end
% hold on;
% for i = 1:length(p1)
%     plot(p1_r(i),p1_i(i),'xk')
% end
% xlabel('Real(s)');
% ylabel('Imag(s), Butterworth');
% subplot(222);
% plot(ox,oy,'-.');
% hold on;
% grid on;
% for i = 1:length(z2)
%     plot(z2_r(i),z2_i(i),'ok')
% end
% hold on;
% for i = 1:length(p2)
%     plot(p2_r(i),p2_i(i),'xk')
% end
% xlabel('Real(s)');
% ylabel('Imag(s), Chebyshev Type-弘');
% subplot(223);
% plot(ox,oy,'-.');
% hold on;
% grid on;
% for i = 1:length(z3)
%     plot(z3_r(i),z3_i(i),'ok')
% end
% hold on;
% for i = 1:length(p3)
%     plot(p3_r(i),p3_i(i),'xk')
% end
% xlabel('Real(s)');
% ylabel('Imag(s), Chebyshev Type-弗');
% subplot(224);
% plot(ox,oy,'-.');
% hold on;
% grid on;
% for i = 1:length(z4)
%     plot(z4_r(i),z4_i(i),'ok')
% end
% hold on;
% for i = 1:length(p4)
%     plot(p4_r(i),p4_i(i),'xk')
% end
% xlabel('Real(s)');
% ylabel('Imag(s), Elliptic');
% 
% w = 0:0.001:2;
% [b1,a1] = zp2tf(z1,p1,k1);
% H_b = freqs(b1,a1,w);
% 
% [b2,a2] = zp2tf(z2,p2,k2);
% H_c1 = freqs(b2,a2,w);
% 
% [b3,a3] = zp2tf(z3,p3,k3);
% H_c2 = freqs(b3,a3,w);
% 
% [b4,a4] = zp2tf(z4,p4,k4);
% H_e = freqs(b4,a4,w);
% 
% figure(2)
% subplot(221);
% plot(w,10*log10((abs(H_b)).^2));
% ylim([-40 5]);
% grid on;
% xlabel('Frequency 企 [rad/sec]');
% ylabel('|H(企)|^2 [dB], Butterworth');
% subplot(222);
% plot(w,10*log10((abs(H_c1)).^2));
% ylim([-70 5]);
% grid on;
% xlabel('Frequency 企 [rad/sec]');
% ylabel('|H(企)|^2 [dB], Chebyshev Type-弘');
% subplot(223);
% plot(w,10*log10((abs(H_c2)).^2));
% ylim([-70 5]);
% grid on;
% xlabel('Frequency 企 [rad/sec]');
% ylabel('|H(企)|^2 [dB], Chebyshev Type-弗');
% subplot(224);
% plot(w,10*log10((abs(H_e)).^2));
% ylim([-70 5]);
% grid on;
% xlabel('Frequency 企 [rad/sec]');
% ylabel('|H(企)|^2 [dB], Elliptic');

% 3.2
P_s = 10^(-4);
delta_w = 1;
N = (log10((1/P_s)-1))/(2*log10(1+delta_w));
n = ceil(N);
r = 1;
[z,p,k] = buttap(n);
A = 0:0.001:2*pi;
ox = r*cos(A);
oy = r*sin(A);
for i = 1:length(p)
    p_r(i) = real(p(i));
    p_i(i) = imag(p(i));
end

for i = 1:length(z)
    z_r(i) = real(z(i));
    z_i(i) = imag(z(i));
end

w = 0:0.001:2.5;
[b,a] = zp2tf(z,p,k);
H_b = freqs(b,a,w);

figure(1)
plot(ox,oy,'-.');
hold on;
grid on;
for i = 1:length(z)
    plot(z_r(i),z_i(i),'ok')
end
hold on;
for i = 1:length(p)
    plot(p_r(i),p_i(i),'xk')
end
xlabel('Real(s)');
ylabel('Imag(s), Butterworth');

figure(2)
plot(w,10*log10((abs(H_b)).^2));
ylim([-50 5]);
grid on;
xlabel('Frequency 企 [rad/sec]');
ylabel('|H(企)|^2 [dB], Butterworth');

w=0:0.001:5000;
[numt,dent]=lp2lp(b,a,300);
H_L=freqs(numt,dent,w);
[numt,dent]=lp2hp(b,a,4000);
H_B1=freqs(numt,dent,w);
[numt,dent]=lp2bp(b,a,650,700);
H_B2=freqs(numt,dent,w);
[numt,dent]=lp2bp(b,a,1500,1000);
H_B3=freqs(numt,dent,w);
[numt,dent]=lp2bp(b,a,3000,2000);
H_H=freqs(numt,dent,w);

figure(3)
ylim([-30 10]);
hold on;
plot(w,10*log10((abs(H_L)).^2));
plot(w,10*log10((abs(H_B1)).^2));
plot(w,10*log10((abs(H_B2)).^2));
plot(w,10*log10((abs(H_B3)).^2));
plot(w,10*log10((abs(H_H)).^2));
grid on;
xlabel('Frquency, [Hz]');
ylabel('|H(企)|2 [dB], Butterworth');
legend('Filter 1, LPF','Filter 2, BPF','Filter 3, BPF','Filter 4, BPF','Filter 5, HPF');
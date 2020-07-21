clc;
clear;

[y,fs] = audioread('Audio_Pop01_15sec.wav');
t=0:1/fs:(length(y)-1)/fs; 
[f0,X] = myfun_SA(t, y);

% % 3.1
% figure(1)
% subplot(211);
% plot(t,y);
% grid on;
% xlabel('Time[sec]');
% ylabel('Input audio,x(t)');
% subplot(212);
% plot(f0,abs(X));
% grid on;
% xlim([0 5000]);
% xlabel('Frequency[Hz]');
% ylabel('|X(f)|');
% 
% sound(y,fs);

% % 3.2
% r = 1;
% A = 0:0.001:2*pi;
% ox = r*cos(A);
% oy = r*sin(A);
% 
% f = linspace(0,5000,512);
% [num1,den1] = butter(7,500/(fs/2),'low');
% [num2,den2] = butter(6,[500/(fs/2),1500/(fs/2)],'bandpass');
% [num3,den3] = butter(6,[1500/(fs/2),2500/(fs/2)],'bandpass');
% [num4,den4] = butter(6,[2500/(fs/2),3500/(fs/2)],'bandpass');
% [num5,den5] = butter(10,3500/(fs/2),'high');
% 
% H_1 = freqz(num1,den1);
% H_2 = freqz(num2,den2);
% H_3 = freqz(num3,den3);
% H_4 = freqz(num4,den4);
% H_5 = freqz(num5,den5);
% 
% [z1,p1,k]=tf2zp(num1,den1);
% [z2,p2,k]=tf2zp(num2,den2);
% [z3,p3,k]=tf2zp(num3,den3);
% [z4,p4,k]=tf2zp(num4,den4);
% [z5,p5,k]=tf2zp(num5,den5);
% 
% for i = 1:length(p1)
%     p_r1(i) = real(p1(i));
%     p_i1(i) = imag(p1(i));
% end
% for i = 1:length(z1)
%     z_r1(i) = real(z1(i));
%     z_i1(i) = imag(z1(i));
% end
% for i = 1:length(p2)
%     p_r2(i) = real(p2(i));
%     p_i2(i) = imag(p2(i));
% end
% for i = 1:length(z2)
%     z_r2(i) = real(z2(i));
%     z_i2(i) = imag(z2(i));
% end
% for i = 1:length(p3)
%     p_r3(i) = real(p3(i));
%     p_i3(i) = imag(p3(i));
% end
% for i = 1:length(z3)
%     z_r3(i) = real(z3(i));
%     z_i3(i) = imag(z3(i));
% end
% for i = 1:length(p4)
%     p_r4(i) = real(p4(i));
%     p_i4(i) = imag(p4(i));
% end
% for i = 1:length(z4)
%     z_r4(i) = real(z4(i));
%     z_i4(i) = imag(z4(i));
% end
% for i = 1:length(p5)
%     p_r5(i) = real(p5(i));
%     p_i5(i) = imag(p5(i));
% end
% for i = 1:length(z5)
%     z_r5(i) = real(z5(i));
%     z_i5(i) = imag(z5(i));
% end
% 
% figure(1)
% plot(f,abs(H_1));
% hold on;
% plot(f,abs(H_2));
% hold on;
% plot(f,abs(H_3));
% hold on;
% plot(f,abs(H_4));
% hold on;
% plot(f,abs(H_5));
% grid on;
% legend('Channel 1 filter','Channel 2 filter','Channel 3 filter','Channel 4 filter','Channel 5 filter')
% 
% figure(2);
% subplot(321);
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p1)
%     plot(p_r1(i), p_i1(i),'xk');
% end
% for i = 1:length(z1)
%     plot(z_r1(i), z_i1(i),'ok');
% end
% grid on;
% xlabel('Ch1 filter');
% subplot(322);
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p2)
%     plot(p_r2(i), p_i2(i),'xk');
% end
% for i = 1:length(z2)
%     plot(z_r2(i), z_i2(i),'ok');
% end
% grid on;
% xlabel('Ch2 filter');
% subplot(323);
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p3)
%     plot(p_r3(i), p_i3(i),'xk');
% end
% for i = 1:length(z3)
%     plot(z_r3(i), z_i3(i),'ok');
% end
% grid on;
% xlabel('Ch3 filter');
% subplot(324);
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p4)
%     plot(p_r4(i), p_i4(i),'xk');
% end
% for i = 1:length(z4)
%     plot(z_r4(i), z_i4(i),'ok');
% end
% grid on;
% xlabel('Ch4 filter');
% subplot(325);
% plot(ox,oy,'-.');
% hold on;
% for i = 1:length(p5)
%     plot(p_r5(i), p_i5(i),'xk');
% end
% for i = 1:length(z5)
%     plot(z_r5(i), z_i5(i),'ok');
% end
% grid on;
% xlabel('Ch5 filter');

% 3.3
[num1,den1] = butter(7,500/(fs/2),'low');
[num2,den2] = butter(6,[500/(fs/2),1500/(fs/2)],'bandpass');
[num3,den3] = butter(6,[1500/(fs/2),2500/(fs/2)],'bandpass');
[num4,den4] = butter(6,[2500/(fs/2),3500/(fs/2)],'bandpass');
[num5,den5] = butter(10,3500/(fs/2),'high');

y1n = filter(num2,den2,y);
[f1,X1] = myfun_SA(t, y1n);
y2n = filter(num3,den3,y);
[f2,X2] = myfun_SA(t,y2n);
y3n = filter(num4,den4,y);
[f3,X3] = myfun_SA(t,y3n);
y4n = filter(num5,den5,y);
[f4,X4] = myfun_SA(t,y4n);

figure(1)
subplot(521);
plot(t,y);
grid on;
xlabel('Time[sec]');
ylabel('Ch1 out, y1[n]');
subplot(522);
plot(f0,abs(X));
grid on;
xlim([0 5000]);
xlabel('Frequency[Hz]');
subplot(523);
plot(t,y1n);
grid on;
xlabel('Time[sec]');
ylabel('Ch2 out, y1[n]');
subplot(524);
plot(f1,abs(X1));
grid on;
xlim([0 5000]);
xlabel('Frequency[Hz]');
subplot(525);
plot(t,y2n);
grid on;
xlabel('Time[sec]');
ylabel('Ch3 out, y1[n]');
subplot(526);
plot(f2,abs(X2));
grid on;
xlim([0 5000]);
xlabel('Frequency[Hz]');
subplot(527);
grid on;
xlabel('Time[sec]');
ylabel('Ch4 out, y1[n]');
plot(t,y3n);
subplot(528);
plot(f3,abs(X3));
grid on;
xlim([0 5000]);
xlabel('Frequency[Hz]');
subplot(529);
plot(t,y4n);
grid on;
xlabel('Time[sec]');
ylabel('Ch5 out, y1[n]');
subplot(5,2,10);
plot(f4,abs(X4));
grid on;
xlim([0 5000]);
xlabel('Frequency[Hz]');

% sound(y1n,fs);
% sound(y2n,fs);
% sound(y3n,fs);
% sound(y4n,fs);

figure(2)
c1=1;
c2=5;
c3=4;
c4=2;
c5=1;
w=1;
ym1=y*c1;
ym2=y1n*c2;
ym3=y2n*c3;
ym4=y3n*c4;
ym5=y4n*c5;
y0=ym1+ym2+ym3+ym4+ym5;

subplot(211)
t=linspace(0,15,length(y));
for i =1:length(y)
    c0_1(i)=y(i)^2;
    c0_2(i)=y0(i)^2;
end
c0_1=sum(c0_1);
c0_2=sum(c0_2);
final_c0=sqrt(c0_1/c0_2);
final_y=y0*final_c0*w;
hold on;
grid on;
plot(t,y,'r');
plot(t,final_y,'k');
xlabel('Time [sec], c1=1.0 c2=5.0, c3=4.0, c4=2.0, c5=1.0, w=1.0 ');
ylabel('Audio signal');
legend('Input','Output');

subplot(212)
[fm1,Xm1]=myfun_SA(t,y);
[fm2,Xm2]=myfun_SA(t,final_y);
plot(fm1,abs(Xm1),'r');
hold on;
grid on;
plot(fm2,abs(Xm2),'k');
xlim([0 5000])
xlabel('Frequency [Hz]');
ylabel('Magnitude spectrum');
legend('Input','Output');
grid on;

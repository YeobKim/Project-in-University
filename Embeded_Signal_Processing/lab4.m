clear;
clc;

% %3.1
% M=64;
% m = 0:M-1;
% for n=0:M-1
%     x(n+1) = cos(2*pi*0.1*(n));    
% end
% 
% [f_hat, Xk, N_mult] = Np_FFT(x,M);
% 
% subplot(211);
% stem(m,x, '.k');
% xlim([0 63]);
% xlabel('n')
% ylabel('x[n]')
% grid on;
% 
% subplot(212);
% stem(f_hat,abs(Xk), '.k');
% ylim([0 25]);
% xlabel('fhat')
% ylabel('|Xk|')
% grid on;

%3.2

clear;
clc;

M_1 = 16;
M_2 = 32;
M_3 = 64;
M_4 = 128;
m_1 = 0 : M_1 - 1;
m_2 = 0 : M_2 - 1;
m_3 = 0 : M_3 - 1;
m_4 = 0 : M_4 - 1;

for n_1 = 0 : M_1 - 1
    x_1(n_1+1) = 0.3*cos(2*pi*0.1*n_1) + 0.8*sin(2*pi*0.3*n_1);    
end
[f_hat_1, Xk_1, N_mult_1] = Np_FFT(x_1,M_1);
[f_hat_dft_1, X_1_dft, cnt_1] = func_1(x_1,M_1);

for n_2 = 0 : M_2 - 1
    x_2(n_2+1) = 0.3*cos(2*pi*0.1*n_2) + 0.8*sin(2*pi*0.3*n_2);    
end
[f_hat_2, Xk_2, N_mult_2] = Np_FFT(x_2,M_2);
[f_hat_dft_2, X_2_dft, cnt_2] = func_1(x_2,M_2);

for n_3 = 0 : M_3 - 1
    x_3(n_3+1) = 0.3*cos(2*pi*0.1*n_3) + 0.8*sin(2*pi*0.3*n_3);    
end
[f_hat_3, Xk_3, N_mult_3] = Np_FFT(x_3,M_3);
[f_hat_dft_3, X_3_dft, cnt_3] = func_1(x_3,M_3);

for n_4 = 0 : M_4 - 1
    x_4(n_4+1) = 0.3*cos(2*pi*0.1*n_4) + 0.8*sin(2*pi*0.3*n_4);    
end
[f_hat_4, Xk_4, N_mult_4] = Np_FFT(x_4,M_4);
[f_hat_dft_4, X_4_dft, cnt_4] = func_1(x_4,M_4);

figure(1)
subplot(2,1,1)
stem(m_1, x_1, 'k')
xlim([0 15])
xlabel('n');
ylabel('x[n]');
grid on;
subplot(2,1,2)
plot(f_hat_1, abs(Xk_1),':xr')
hold on
plot(f_hat_dft_1, abs(X_1_dft),'ok')
xlabel('fhat');
ylabel('|Xk|');
grid on;
legend('FFT','DFT')

figure(2)
subplot(2,1,1)
stem(m_2, x_2, 'k')
xlim([0 31]);
xlabel('n');
ylabel('x[n]');
grid on;
subplot(2,1,2)
plot(f_hat_2, abs(Xk_2),':xr')
hold on
plot(f_hat_dft_2, abs(X_2_dft),'ok')
xlabel('fhat');
ylabel('|Xk|');
grid on;
legend('FFT','DFT')

figure(3)
subplot(2,1,1)
stem(m_3, x_3, 'k')
xlim([0 63]);
xlabel('n');
ylabel('x[n]');
grid on;
subplot(2,1,2)
plot(f_hat_3, abs(Xk_3),':xr')
hold on
plot(f_hat_dft_3, abs(X_3_dft),'ok')
xlabel('fhat');
ylabel('|Xk|');
grid on;
legend('FFT','DFT')


figure(4)
subplot(2,1,1)
stem(m_4, x_4, 'k')
xlim([0 127]);
xlabel('n');
ylabel('x[n]');
grid on;
subplot(2,1,2)
plot(f_hat_4, abs(Xk_4),':xr')
hold on
plot(f_hat_dft_4, abs(X_4_dft),'ok')
xlabel('fhat');
ylabel('|Xk|');
grid on;
legend('FFT','DFT')

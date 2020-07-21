clc;
clear;

M_1 = 16;
M_2 = 32;
M_3 = 64;
M_4 = 128;
m_1 = 1 : M_1 - 1;
m_2 = 1 : M_2 - 1;
m_3 = 1 : M_3 - 1;
m_4 = 1 : M_4 - 1;

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

T = 4:7;
t = 2.^T;
cnt_mul = [N_mult_1 N_mult_2 N_mult_3 N_mult_4];
cnt = [cnt_1 cnt_2 cnt_3 cnt_4];
ratio = cnt_mul./cnt;

figure(1)
subplot(2,1,1)
semilogy(t, cnt_mul, '-^g')
hold on
semilogy(t, cnt, '-ob')
grid on
xlabel('N')
ylabel('Number of multiplications')
legend('FFT','DFT')

subplot(2,1,2)
plot(t,ratio, '-ok')
grid on
xlabel('N')
ylabel('Ratio of FFT computations over DFT')
clear;
clc;

% %3.1
% N = 50;
% for n=0:1:N-1
%     x1(n+1) = cos(2*pi*0.1*(n));    
% end
% for n=0:1:N-1
%     x2(n+1) = 0.5*cos(2*pi*0.2*(n));    
% end
% for n=0:1:N-1
%     x3(n+1) = 0.1*cos(2*pi*0.3*(n));    
% end
% 
% [f_hat,Xk1,N_mult] = Np_DFT(x1,N);
% [f_hat,Xk2,N_mult] = Np_DFT(x2,N);
% [f_hat,Xk3,N_mult] = Np_DFT(x3,N);
% figure(1)
% subplot(211);
% t = 0:N-1;
% stem(t,x1);
% grid on;
% 
% subplot(212);
% stem(f_hat,abs(Xk1));
% grid on;
% 
% figure(2)
% subplot(211);
% t = 0:N-1;
% stem(t,x2);
% grid on;
% 
% subplot(212);
% stem(f_hat,abs(Xk2));
% grid on;
% 
% figure(3)
% subplot(211);
% t = 0:N-1;
% stem(t,x3);
% grid on;
% 
% subplot(212);
% stem(f_hat,abs(Xk3));
% grid on;
% 
% %3.2.1
% N = 50;
% 
% for n=0:N-1
%     x(n+1) = cos(2*pi*abs(0.1)*n)+0.5*cos(2*pi*abs(0.2)*n)+0.1*cos(2*pi*abs(0.3)*n);
% end
% [f_hat,Xk,N_mult] = Np_DFT(x,N);
% 
% subplot(211)
% t = 0:N-1;
% stem(t,x)
% grid on
% subplot(212)
% stem(f_hat,abs(Xk))
% grid on
% xlim([-0.5 0.5])

%3.2.2
N1 = 50;
N2 = 1024;
L = 10;
PL1 = zeros(1,N1);
PL2 = zeros(1,N2);

for n=0:L-1
    PL1(n+1) = 1;   
end
x1 = PL1;

for n=0:L-1
    PL2(n+1) = 1;   
end
x2 = PL2;

[f_hat_1,Xk_1,N_mult1] = Np_DFT(x1,N1);
[f_hat_2,Xk_2] = Np_DFT(x2,N2);

subplot(211);
t = 0:N1-1;
stem(t,x1,'k');
grid on;

subplot(212);
hold on
plot(f_hat_2,abs(Xk_2),'k');
stem(f_hat_1,abs(Xk_1),'LineStyle','none','MarkerEdgeColor','r','LineWidth',1.2);
grid on;
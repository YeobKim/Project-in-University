clear;
clc;
row = 256;
col = 256;

% % 3.1
% Z = myfun_LoadImage('lena.raw', row, col);
% X = fft2(Z)./(row*col);
% Y = ifft2(X).*(row*col);
% Y = uint8(Y);
% 
% subplot(131);
% imshow(Z);
% subplot(132);
% imshow(abs(X));
% subplot(133);
% imshow(Y);

% % 3.2
% Z = myfun_LoadImage('lena.raw', row, col);
% X = dct2(Z)./256;
% Y = idct2(X).*256;
% Y = uint8(Y);
% 
% subplot(131);
% imshow(Z);
% subplot(132);
% imshow(abs(X));
% subplot(133);
% imshow(Y);

% % 3.3.1
% Z = myfun_LoadImage('lena.raw', row, col);
% X = dct2(Z)./256;
% 
% th1 = 0.01;
% th2 = 0.1;
% th3 = 0.25;
% th4 = 0.5;
% T1 = threshold(X,th1);  
% T2 = threshold(X,th2);
% T3 = threshold(X,th3);
% T4 = threshold(X,th4);
% 
% Y1 = idct2(T1).*256;
% Y1 = uint8(Y1);
% Y2 = idct2(T2).*256;
% Y2 = uint8(Y2);
% Y3 = idct2(T3).*256;
% Y3 = uint8(Y3);
% Y4 = idct2(T4).*256;
% Y4 = uint8(Y4);
% 
% subplot(241);
% imshow(Y1);
% subplot(242);
% imshow(Y2);
% subplot(243);
% imshow(Y3);
% subplot(244);
% imshow(Y4);
% subplot(245);
% imshow(T1);
% subplot(246);
% imshow(T2);
% subplot(247);
% imshow(T3);
% subplot(248);
% imshow(T4);

% 3.3.3
Z = myfun_LoadImage('lena.raw', row, col);
X = dct2(Z)./256;

th1 = 0.001;
th2 = 0.01;
th3 = 0.05;
th4 = 0.1;
th5 = 0.25;
th6 = 0.5;

T1 = threshold(X,th1);  
T2 = threshold(X,th2);
T3 = threshold(X,th3);
T4 = threshold(X,th4);

R1 = RMSE(X,Z,th1);
R2 = RMSE(X,Z,th2);
R3 = RMSE(X,Z,th3);
R4 = RMSE(X,Z,th4);
R5 = RMSE(X,Z,th5);
R6 = RMSE(X,Z,th6);

A1 = Zip(th1,X,Z);
A2 = Zip(th2,X,Z);
A3 = Zip(th3,X,Z);
A4 = Zip(th4,X,Z);
A5 = Zip(th5,X,Z);
A6 = Zip(th6,X,Z);

TR = [0.001,0.01,0.05,0.1,0.25,0.5];
RR = [R1,R2,R3,R4,R5,R6];
AR = [A1,A2,A3,A4,A5,A6];

subplot(211);
semilogy(TR,AR,'-or');
grid on;
xlabel('Threshold');
ylabel('Compression Rate');
subplot(212);
plot(TR,RR,'-ob');
grid on;
xlabel('Threshold');
ylabel('RMSE');
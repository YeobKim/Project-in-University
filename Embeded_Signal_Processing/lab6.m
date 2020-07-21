clc;
clear;

% 3.1
a = [0 1 5];
b = [1 2 5];
t1 = 0:0.01:10;
w = -4:0.01:4;
x = roots(a);
y = roots(b);
hh=0;
[r,p,k] = residue(a, b); 
for i = 1:length(r)
    h = r(i).*exp(p(i).*t1);
    hh = h+hh;
end 
Hw = (r(1)./(j*w-p(1))) + (r(2)./(j*w-p(2))); 

figure(1);
plot(real(x),imag(x),'o');
xlabel('Real(s)');
xlim([-6 0]);
hold on;
plot(real(y),imag(y),'x');
ylabel('Imag(s)');
ylim([-2.5 2.5]);
grid on;

figure(2);
plot(t1,hh);
xlabel('t[sec]');
ylabel('h(t)');
ylim([-0.4 1.6]);
grid on;

figure(3);
plot(w, abs(Hw));
grid on;
ylim([0.4 1.4]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|');

% 3.2
t = linspace(0,10,1000);
z1 = [-5];
p1 = [-1+(2i);-1-(2i)];
[b1, a1] = zp2tf(z1,p1,1);
[r1,p1,k1] = residue(b1, a1); 
h1 = r1(1)*exp(p1(1)*t) + r1(2)*exp(p1(2)*t); 

z2 = [-5];
p2 = [2i;-2i];
[b2, a2] = zp2tf(z2,p2,1);
[r2,p2,k2] = residue(b2, a2); 
h2 = r2(1)*exp(p2(1)*t) + r2(2)*exp(p2(2)*t); 
 
z3 = [-5];
p3 = [1+(2i);1-(2i)];
[b3, a3] = zp2tf(z3,p3,1);
[r3,p3,k3] = residue(b3, a3); 
h3 = r3(1)*exp(p3(1)*t) + r3(2)*exp(p3(2)*t); 
 
subplot(311);
plot(t,h1);
ylabel('h(t),system #1');
grid on;
subplot(312);
plot(t,h2);
ylabel('h(t),system #2');
grid on;
subplot(313);
plot(t,h3);
xlabel('t[sec]');
ylabel('h(t),system #3');
grid on;

% 3.3
a = [0 0 1 -0.3];
b = [1 0.3 0.36 0.108];
t1 = linspace(0,20,21);
w = -4:0.01:4;
x = roots(a);
y = roots(b);
[r,p,k] = residue(a, b); 
hh=0;

for i = 1:length(r)
    h = r(i).*(p(i).^t1);
    hh = h+hh;
end

rh = 0;

for i = 1:20
    rh(i+1) = hh(i);
end
 
% ¿øÀ» ±×¸®´Â ºÎºÐ
% A = 0:0.001:2*pi;
wx = cos(A);
wy = sin(A);
 
Hw = (r(1)./(exp(j*w)-p(1))) + (r(2)./(exp(j*w)-p(2))) + (r(3)./(exp(j*w)-p(3)));

figure(1)
plot(real(x),imag(x),'o');
xlabel('Real(z)');
xlim([-1 1]);
hold on;
plot(real(y),imag(y),'x');
ylabel('Imag(z)');
ylim([-1 1]);
hold on;
plot(wx,wy,'-.k');
grid on;
 
figure(2)
stem(t1,rh,'k');
xlabel('n');
ylabel('h[n]');
ylim([-0.6 1]);
grid on;
 
figure(3)
plot(w, abs(Hw));
grid on;
xlim([-3.3 3.3])
ylim([0.2 1.8]);
xlabel('Frequency ¥Ø[rad/sec]');
ylabel('|H(¥Ø)|');

% 3.4
t1 = linspace(0,20,21);
z1 = [-5];
p1 = [0.3536+0.3536*i;0.3536-0.3536*i];
[b1, a1] = zp2tf(z1,p1,1);
[r1,p1,k1] = residue(b1, a1);
hh1 = 0;
 
for i = 1:length(r1)
    h1 = r1(i)*(p1(i).^t1);
    hh1 = h1+hh1;
end

hh1 = hh1*step_fun(t1);

rh1 = 0;

for i = 1:20
    rh1(i+1) = hh1(i);
end

z2 = [-5];
p2 = [0.7071+0.7071i ; 0.7071-0.7071i];
[b2, a2] = zp2tf(z2,p2,1);
[r2,p2,k2] = residue(b2, a2);
hh2 = 0;
 
for i = 1:length(r2)
    h2 = r2(i)*(p2(i).^t1).*step_fun(t1);
    hh2 = h2+hh2;
end
 
hh2 = hh2*step_fun(t1);
 
rh2 = 0;
 
for i = 1:20
    rh2(i+1) = hh2(i);
end

z3 = [-5];
p3 = [1.0607+1.0607i;1.0607-1.0607i];
[b3, a3] = zp2tf(z3,p3,1);
[r3,p3,k3] = residue(b3, a3);
hh3 = 0;

for i = 1:length(r3)
    h3 = r3(i).*(p3(i).^t1);
    hh3 = h3+hh3;
end

hh3 = hh3*step_fun(t1);

rh3 = 0;

for i = 1:20
    rh3(i+1) = hh3(i);
end

subplot(311);
stem(t1,rh1);
xlabel('n');
ylabel('h[n],system #1');
grid on;

subplot(312);
stem(t1,rh2);
xlabel('n');
ylabel('h[n],system #2');
grid on;

subplot(313);
stem(t1,rh3);
xlabel('n');
ylabel('h[n],system #3');
grid on;

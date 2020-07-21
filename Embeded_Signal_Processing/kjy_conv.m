function p = sconv(k, j, h, g)

n1=k;
n2=j;

x1=h;
y1=g;
lx=length(x1);
ly=length(y1);
lt=lx+ly;

t=0+(-2):3+2;
x2=[zeros(1,ly) x1];
y2=[fliplr(y1) zeros(1,lx)];

for i=1:(lt-1)
    z=zeros(size(y2));
    z(i+1:end)=y2(1:end-i); 
    a=[x2;z];
    b(i)=sum(prod(a));
end
p = stem(b);
% 
% subplot(311);
% stem(n1,x1);
% grid on;
% subplot(312);
% stem(n2,y1);
% grid on;
% subplot(313);
% stem(t,b);
% grid on;
end
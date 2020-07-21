function [b,t] = myconv(k , w, j, q, h, g)
n1 = k:w;
n2 = j:q;

x1=h;
y1=g;
lx=length(x1); 
ly=length(y1);
lt=lx+ly;

x2=[zeros(1,ly) x1];
y2=[fliplr(y1) zeros(1,lx)];
t = k+j:w+q;

for i=1:(lt-1) % 시프트하면서 가는 부분
    z=zeros(size(y2)); 
    z(i+1:end)=y2(1:end-i); 
    a=[x2;z];
    b(i)=sum(prod(a));
end
end
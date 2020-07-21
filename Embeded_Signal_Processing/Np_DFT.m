function [f_hat,Xk,N_mult] = Np_DFT(x,N)
Xk = zeros(1,N);

for n=0:N-1
    if n < N/2
    f_hat(n+1) = n/N;
    elseif n>=N/2
    f_hat(n+1) = (n/N)-1;
    end
end

for k = 0:N-1
    for n = 0:N-1
        Xk(k+1) = Xk(k+1) + x(n+1)*exp(-j*(2*pi*k/N)*n);
    end
end

N_mult = N^2;
end
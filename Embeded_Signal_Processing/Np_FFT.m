function [f_hat, Xk, N_mult] = Np_FFT(x,N)

for n=0:N-1  % 결과로 나오는 f_hat의 범위를 설정
    if n < N/2
    f_hat(n+1) = n/N;
    elseif n>=N/2
    f_hat(n+1) = (n/N) - 1;
    end
end

q = log2(N);    
% N=length(x);
xtmp = zeros(1,N);
value = zeros(1,q);

for i = 0 : N-1 % 입력 x의 순서를 바꿔주는 포문
    shift = i;
    for t = 1 : q
        shift = bitshift(i,1-t); % 오른쪽으로 시프트 연산
        value(t) = bitand(shift,1); %2진수로 and연산을 
    end
    pos = 0; %pos가 넣는 위치를 정해줌 
    for k = 1 : q
        pos = pos + (value(k) * 2^(q-k)); %value값에서 2진 나온것을 다시 10진으로 
    end
    xtmp(pos + 1) = x(i + 1); % 바뀐 x의 순서가 나옴.
end


N_mult = 0;
for l = 1 : q %버터플라이 연산 총 단계를 설정                                
    new_W = 1;                                   
    W = exp((-1i)*2*pi/2^l); %원에서 몇번 나눌지 피자처럼 나눌지 l 결정 1부터 넘어가면서  %위상변화                  
    p = 0; 
    while p < 2^(l-1); % 다음 단계로 넘어가는 while문  %행렬연산 초과해서                         
        i = p; 
        while i < N % 단계별 연산 화살표                       
            ip = i + 2^(l-1); % ip하고 밑에 i가 플플 마마 이런식으로 W 연산되는 것을 결정 %-쪽                 
            t = new_W * xtmp(ip + 1); % 각 단계의 W*연산할 X   %t는 ppt에서 W                
            xtmp(ip + 1) = xtmp(i + 1) - t; % 연산 중 빼기 연산. 
            xtmp(i+1) = t +xtmp(i + 1); % 연산 중 더하기 연산.
            i = i + 2^l;  % while문 탈출하게 하려고 만들어줌
            N_mult = N_mult + 1; %필요한 곱셈연산 수
        end 
        new_W = new_W * W;                            
        p = p + 1; 
    end  
end
Xk = xtmp;
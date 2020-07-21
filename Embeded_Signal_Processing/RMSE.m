function R = RMSE(X,Z,th)

for i = 1:256
    for j = 1:256
        if abs(X(i,j))<th
            X(i,j) = 0;
        end
    end
end
Y = idct2(X).*256;
C = uint8(Y);

for i = 1:256
    for j = 1:256
        K(i,j) = abs(Z(i,j)-C(i,j))^2;
        p=sum(sum(K));
    end
end
R = sqrt((1/(256*256))*p);
end
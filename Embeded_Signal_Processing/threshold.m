function T= threshold(X, th)  

for i = 1:256
    for j = 1:256
        if abs(X(i,j))<th
            X(i,j) = 0;
        end
    end
end
T = X;
end
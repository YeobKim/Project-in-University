function A = Zip(th,X,Z)
cnt1=0;
cnt2=0;
for i = 1:256
    for j = 1:256
        if abs(X(i,j))<th
            X(i,j) = 0;
        end
        if X(i,j)~=0
            cnt1=cnt1+1;
        end
    end
end

for i = 1:256
    for j = 1:256
        if abs(Z(i,j))<th
            Z(i,j) = 0;
        end
        if Z(i,j)~=0
            cnt2 = cnt2+1;
        end
    end
end

A = cnt1/cnt2;
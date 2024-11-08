function A = companion(v)
    % returns companion matrix for any matrix A
    n = length(v);
    A = sparse(n,n);
    for i=1:n
        for j=1:n
            if (j-i == 1)
                A(i,j) = 1;
            elseif (i == n)
                A(i,j) = -1*v(j);
            end
        end
    end
end
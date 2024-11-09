function A = companion(v)
    % returns companion matrix for any matrix A
    n = length(v);
    dim = n-1;
    A = sparse(dim,dim);
    for i=1:n
        for j=1:n
            if (j-i == 1)
                A(i,j) = 1;
            elseif (i == n)
                A(i,j) = -1*v(dim-(j-1));
            end
        end
    end
end
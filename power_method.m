function [lambda, v] = power_method(A, x, tol, max_iter)
    %Power method on a matrix A with intial guess x
    %A is a matrix with size n
    %x is a vector in R^n
    %returns the dominant eigenvalue and corresponding eigen vector
    if isempty(tol)
        tol = 1e-6;
    end
    if isempty(max_iter)
        max_iter = 100;
    end
    x_n = x/norm(x,2);
    for i=1:max_iter
        y = A*x_n;
        v = y/norm(y,2);
        lambda = (v.')*A*v;
        if (norm(A*v-lambda*v)<tol)
            break;
        end
        x_n = v;
    end

end
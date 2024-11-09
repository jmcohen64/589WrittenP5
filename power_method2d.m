function [rp_n, rm_n] = power_method2d(A, x1, x2, tol, max_iter)
    %Power method on a matrix A with intial guess x
    %A is a matrix with size n
    %x is a vector in R^n
    %returns the dominant eigenvalue and corresponding eigen vector
    n = length(A);
    if isempty(x1)
        x1 = (randi(10,1,n)).';
        %disp(x1);
    end
    if isempty(x2)
        x2 = (randi(10,1,n)).';
    end

    rp_n = 0;
    rm_n = 0;
    
    iter  = 1;
    for i=1:max_iter
        y1 = A*x1;
        y2 = A*x2;
        q1 = y1/norm(y1,2);
        q2 = y2-((q1.')*y2)*q1;
        q2 = q2/norm(q2,2);
        B11 = (q1.')*(A*q1);
        B12 = (q1.')*(A*q2);
        B21 = (q2.')*(A*q1);
        B22 = (q2.')*(A*q2);
        trace = (B11+B22)/2;
        del = ((B11-B22)/2)^2+B12*B21;
        rp_n1 = trace + sqrt(del);
        rm_n1 = trace - sqrt(del);
        if (norm(A*x2-rm_n1*x2)<tol)
            disp('tolerance met');
            break;
        end
        if iter == 90
            disp(rp_n);
            disp(rm_n);
        end
        rp_n = rp_n1;
        rm_n = rm_n1;
        x1 = q1;
        x2 = q2;
        iter = iter + 1;
    end

end
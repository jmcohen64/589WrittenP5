function p = synthetic_division(v,r)
    %synthetic division algorithm
    %v = is the vector of coefficients of the polynomial
    %r is the float value of the root
    %returns a vector of the coefficients of the polynomial after synthetic
    %division of (x-r)
    p = [v(1)];
    for i=2:(length(v)-1)
        a_n = v(i) + r*p(i-1);
        p = cat(2,p,[a_n]);
    end
end



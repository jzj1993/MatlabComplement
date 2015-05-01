%Complement Calculate
function [c,n] = complement(x, N)
    n = 0;
    if(nargin == 2)
        n = max(n, N);
    end
    a = max(x);
    if(a > 0) % max(x) = 127: n = 8; max(x) = 128: n = 9
        n = max(n, ceil(log2(a+1)) + 1);
    end
    a = min(x);
    if(a < 0) % min(x) = -128: n = 8; min(x) = -129: n = 9
        n = max(n, ceil(log2(-a)) + 1);
    end
    for i = 1 : length(x)
        if x(i) < 0
            x(i) = x(i) + 2^n;
        end
    end
    c = dec2bin(x, n);
end

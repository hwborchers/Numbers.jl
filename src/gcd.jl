##  Extended Greatest Common Divisor
function extgcd(a::Integer, b::Integer)
    # The Blankinship method, MAA Mathematical Monthly, Jul-Aug 1963

    sign_ab = sign([a, b])
    A = [a b; 1 0; 0 1]'

    while A[1, 1]*A[2, 1] != 0
        if A[1, 1] > A[2, 1]
            m = div(A[1, 1], A[2, 1])
            A[1, :] = A[1, :] - m * A[2, :]
        else
            m = div(A[2, 1], A[1, 1])
            A[2, :] = A[2, :] - m * A[1, :]
        end
    end

    if A[1, 1] == 0
        g = A[2, :]
    else 
        g = A[1, :]
    end

    g[2:3] = sign_ab .* g[2:3]
    return g[1], g[2], g[3]
end

##  Coprimality
function coprime(n::Integer, m::Integer)
    if n == 0 && m == 0
        return false
    end

    if extgcd(n, m)[1] > 1 
        false
    else
        true
    end
end


##  Modular inverse
function modinv(n::Integer, m::Integer)
    g, an, am = extgcd(n, m)
    if g != 1
        return NaN
    else
        if an >= 0
            return an
        else
            return an + m
        end
    end
end

function primesieve(n::Integer)
    p = [1:2:n]
    q = length(p)
    p[1] = 2
    if n >= 9
        for k = 3:2:isqrt(n)
            if p[(k+1)/2] != 0
                p[(k*k+1)/2:k:q] = 0
            end
        end
    end
    return p[p .> 0]
end


function primes2(n::Integer, m::Integer)
    if n > m
        error("Argument 'm' must be bigger than 'n'.")
    end
    if m <= 1000
        p = primesieve(m)
        return p[p .>= n]
    end

    myPrimes = primesieve(isqrt(m))
    N = [n:m]
    l = length(N)  # m-n+1
    A = zeros(Int8, l)
    if n == 1
        A[1] = -1
    end

    for p in myPrimes
        r = n % p
        if r == 0
            i = 1
        else
            i = p - r + 1
        end
        if i <= l && N[i] == p
            i = i + p
        end
        while i <= l
            A[i] = 1
            i = i + p
        end
    end
    return N[A .== 0]
end


function primefactors(n::Integer)
    if n == 0
        return(0)
    elseif n < 0
        error("Argument 'n' must be a nonnegative integer.")
    end
    if n < 4
        return n
    end

    k = int(log2(n))
    F = Array(Integer, k)
    m = isqrt(n)
    P = primesieve(m)

    l = 0
    for p in P
        if mod(n, p) == 0
            l += 1
            F[l] = p
            n = div(n, p)
            while mod(n, p) == 0
                l += 1
                F[l] = p
                n = div(n, p)
            end
        end
    end

    if (n > 1)
        l += 1
        F[l] = n
    end

    return F[1:l]
end


function nextprime(n::Integer)
    if n <= 1
        n = 1
    end
    n = n + 1

    # m = 2*n  # Bertrands law
    d1 = max(3, int(log(n) + 1))
    P  = primes2(n, n + d1)

    while length(P) == 0
        n = n + d1 + 1
        P = primes2(n, n + d1)
    end

    return minimum(P)
end


function prevprime(n::Integer)
    if n <= 2
        return Array(typeof(n), 0)
    end
    n = n - 1

    if n <= 10
        P = [2, 3, 5, 7]
        return max(P[P .<= n])
    end

    # m <- 2*n  # Bertrands law
    d1 = max(3, int(log(n) + 1))
    P  = primes2(n - d1, n)

    while length(P) == 0 || n - d1 < 3
        n = n - d1 - 1
        P = primes2(n - d1, n)
    end

    return maximum(P)
end


function isprime(n::Integer)
    if n <= 0
        error("Argument 'n' must be a natural number (greater zero).")
    elseif n == 1
        return false
    end

    l = true
    P = primesieve(isqrt(n))
    for p in P
        if mod(n, p) == 0
            l = false
            break
        end
    end

    return l
end


function twinprimes(n::Integer, m::Integer)
    P = primes2(n, m)
    inds = find(diff(P) .== 2)

    return hcat(P[inds], P[inds+1])
end


function eulerphi(n::Integer)
    if n <= 0
        error("Argument 'n' must be a (positive) natural number.")
    end

    m = n
    for p in unique(primefactors(n))  # must be unique
        m = m - div(m, p)  # m = m * (1 - 1/p)
    end

    return int(round(m))
end

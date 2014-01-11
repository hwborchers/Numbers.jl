# Numbers #

Package **Numbers** will provide some basic number-theoretic functions for Julia, mostly centered around properties of prime numbers. At the moment, no attempt has been made to integrate *big* natural numbers, all calculations have to stay below `2^63-1`.

The following integer functions from Base are used: `isprime(n)`, `primes(n)` all primes below n, `gcd(a,b)` resp. `gcdx(a,b)` the (extended) Euclidean algorithm, `lcm(a,b)`, `factor(n)` prime factorization of n, `powermod(n,p,m)` p-th power of n modulo m, and `invmod(n,m)` the inverse of n modulo m.

## Available functions ##

In the following, all input parameters are assumed to be natural numbers.

* `primesieve(n)`:
  returns all primes up to `n`; works up to 10^10 and 
  is slightly faster than the function `primes()` in Julia's Base.
* `primes2(n, m)`:
  computes all prime numbers between `n` and `m`;  
  this is often *much* faster than using `primes(m)` and removing primes less 
  than `n`, or using `isprime` iteratively.
* `nextprime(n)`, `prevprime(n)`:
  finds the next or previous prime resp. to `n`.
* `primefactors(n)`:
  returns all unique prime factors increasingly sorted.
* `twinprimes(n, m)`:
  computes all twin primes (prime pairs) between `n` and `m`.
* `coprime(n, m)`:
  returns `false` or `true` depending on whether `n` and `m` have a nontrivial 
  common divisor or not.
* `linmod(a, b, m)` solves the linear equation `a * x = b mod m`. 
* `ordermod(n, m)`:
  Determine the order of n in the multiplicative group modulo m.
* `primroot(m)`:
  Determine the smallest primitive root modulo m, i.e. a generating element
  of the cyclic multiplicative group modulo m.
* `eulerphi(n)`:
  counts the number of integers `k` between `1` and `n` that are coprime to 
  `n`, i.e. `gcd(k,n)==1` and `1<=k<=n` (Euler's Phi or totient function).

## Usage examples ##

    # all primes between 1e06 and 1e06+50
    julia> primes2(1000000, 1000050)
    4-element Array{Int64,1}:
     1000003
     1000033
     1000037
     1000039

    # nearest primes to 1e06, above and below
    julia> [prevprime(1000000), nextprime(1000000)]
    2-element Array{Int64,1}:
      999983
     1000003
    julia> nextprime(47326693)

    # unique prime factors increasingly sorted
    julia> primefactors(1002001)
    3-element Array{Int64,1}
      7
     11
     13

    # twin prime pairs above 1e09
    julia> twinprimes(1000000000, 1000000500)
    2x2 Array{Int64,2}:
     1000000007  1000000009
     1000000409  1000000411

    # are adjacent Fibonacci numbers coprime?
    julia> coprime(46368, 75025)  # Fib23, Fib24
    true
    julia> coprime(1001, 4199)
    false

    # linear equations modulo m
    julia> linmod(14, 30, 100)
    2-element Array{Int64,1}:
     95
     45
    julia> linmod(-14, 30, 100)
    2-element Array{Int64,1}:
      5
     55

    # 7 is primitive root modulo 17, 13 not
    julia> ordermod(7, 17)
    16
    julia> ordermod(13, 17)
    4

    # Find the smallest primitive root modulo m
    julia> primroot(17)
    3
    julia> primroot(71)
    7

    # Euler's Phi (or totient) function
    julia> for i = 10:20
           println("eulerphi($(i)) = ", eulerphi(i))
           end
    eulerphi(10) = 4
    eulerphi(11) = 10
    eulerphi(12) = 4
    eulerphi(13) = 12
    eulerphi(14) = 6
    eulerphi(15) = 8
    eulerphi(16) = 8
    eulerphi(17) = 16
    eulerphi(18) = 6
    eulerphi(19) = 18
    eulerphi(20) = 8

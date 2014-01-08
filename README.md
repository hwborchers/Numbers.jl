# Numbers #

Package **Numbers** will provide some basic number-theoretic functions for Julia, mostly centered around properties of prime numbers. At the moment, no attempt has been made to integrate *big* natural numbers, all calculations have to stay below `2^63-1`.


## Available functions ##

In the following, all input parameters are assumed to be natural numbers.

* `primesieve(n)`:
  returns all primes up to `n`;  
  this is slightly faster than the function `primes()` in Julia Base.
* `primes2(n, m)`:
  computes all prime numbers between `n` and `m`;  
  this is *much* faster than using `primes(m)` and removing all primes less than `n`.
* `nextprime(n)`, `prevprime(n)`:
  finds the next or previous prime resp. to `n`.
* `primefactors(n)`:
  returns all prime factors of `n` with multiplicities.
* `isprime(n)`:
  returns `true` or `false` depending on whether `n` is prime or not.
* `twinprimes(n, m)`:
  computes all twin primes (prime pairs) between `n` and `m`.
* `extgcd(a, b)`:
  the *extended* Euclidean algorithm not only returns the greatest common divisor `g`, but also two numbers `n` and `m` such that `g = n * a + m * b`. Significantly faster than `gcd` in Julia Base. (`a` and `b` may also be negative integers.)
* `coprime(n, m)`:
  returns `false` or `true` depending on whether `n` and `m` have a nontrivial common divisor or not.
* `modinv(n, m)`:
  calculates the modular inverse of `n` modulo `m`.
* `eulerphi(n)`:
  counts the number of integers `k` between `1` and `n` that are coprime to `n`, i.e. `gcd(k,n)==1` for `1<=k<=n` (Euler's Phi function).

## Examples ##

    # all primes between 1e06 and 1e06+50
    julia> primes2(1000000, 1000050)
    4-element Array{Int64,1}:
     1000003
     1000033
     1000037
     1000039

    # nearest primes to 1e06
    julia> [prevprime(1000000), nextprime(1000000)]
    2-element Array{Int64,1}:
      999983
     1000003

    # Euler's decomposition of the Fermat number 2^32 + 1
    julia> n = 2^32 + 1; primefactors(n)
    2-element Array{Integer,1}:
         641
     6700417

    # is 2^32 +1 prime or not
    julia> n = 2^32 + 1; isprime(n)     # Fermat number
    false
    julia> n = 2^31 - 1; isprime(n)     # eighth Mersenne prime
    true

    # twin prime pairs above 1e09
    julia> twinprimes(1000000000, 1000000500)
    2x2 Array{Int64,2}:
     1000000007  1000000009
     1000000409  1000000411

    # extended Euclidean algorithm
    julia> g,n,m = extgcd(1001, 1334)
    (1,-665,499)                  # -665*1001 + 499*1334 == 1  is true

    # are adjacent Fibonacci numbers coprime?
    julia> coprime(46368, 75025)  # fib23, Fib24
    true
    julia> coprime(1001, 1334)
    true

    # modular inverse modulo 1001
    julia> modinv(5, 1001)        #=> 801 because 5*801 = 4005 = 1 mod 1001
    801

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

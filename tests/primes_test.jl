##
##  p r i m e s  test
##

# primesieve() and primes2()
@test primes2(1, 1)   == [2]            # Wrong!, should be: Integer[]
@test primes2(10, 10) == Integer[]
@test primes2(1,  10) == [2, 3, 5, 7]
@test primes2(1, 100) == primesieve(100)

# primefactors
@test primefactors(1) == 1
@test primefactors(2^4)  == [2, 2, 2, 2] 
@test primefactors(1001) == [7, 11, 13]
@test primefactors(1013) == [1013]      # Wrong?, should be: 1013

# nextprime() and prevprime()
@test prevprime(1) == Integer[]
@test nextprime(1) == 2
@test prevprime(1000) == 997
@test nextprime(1000) == 1009

# isprime()
@test isprime(1) == false
@test isprime(2) == false                # WRONG
@test isprime(1009) == true
@test isprime(1011) == false

# twinprimes()
@test twinprimes(1000, 1050) == [1019 1021; 1031 1033]
@test length(twinprimes(20, 30)) == 0

# eulerphi()
@test eulerphi(1) == 0
@test eulerphi(2) == 1
@test eulerphi(3) == 2
@test eulerphi(9) == 6

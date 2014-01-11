##
##  p r i m e s  test
##

# primesieve() and primes2()
@test primes2(1, 1)   == Integer[]
@test primes2(10, 10) == Integer[]
@test primes2(1,  10) == [2, 3, 5, 7]
@test primes2(1, 100) == primesieve(100)

# primefactors
@test primefactors(1) == []
@test primefactors(2^4)  == [2]
@test primefactors(1001) == [7, 11, 13]
@test primefactors(1013) == [1013]

# nextprime() and prevprime()
@test prevprime(1) == Integer[]
@test nextprime(1) == 2
@test prevprime(1000) == 997
@test nextprime(1000) == 1009

# twinprimes()
@test twinprimes(1000, 1050) == [1019 1021; 1031 1033]
@test length(twinprimes(20, 30)) == 0

# coprime()
@test coprime(1, 3) == true
@test coprime(2, 3) == true
@test coprime(11*13*17, 13*17*19) == false
@test coprime(2*3, 5*7) == true

# linmod()
@test linmod(3, 5, 6) == []
@test linmod(3, 4, 5) == [3]
@test linmod(3, 6, 9) == [2, 5, 8]
@test linmod(-14, 30, 100) == [5, 55]

# ordermod()
@test ordermod(1, 11) == 1
@test ordermod(2, 7) == 3
@test ordermod(3, 7) == 6
@test ordermod(7, 5) == 4

# primroot()
@test primroot(2) == 1
@test primroot(17) == 3
@test primroot(71) == 7
@test primroot(101) == 2

# eulerphi()
@test eulerphi(1) == 1
@test eulerphi(2) == 1
@test eulerphi(3) == 2
@test eulerphi(9) == 6

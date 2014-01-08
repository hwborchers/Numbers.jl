##
##  g c d  test
##

# extgcd()
@test gcd(1, 2) == 1
@test gcd(2, 8) == 2
@test gcd(7, 7) == 7
@test gcd(55, 1001) == 11

# coprime()
@test coprime(1, 1) == true
@test coprime(1, 11) == true
@test coprime(2, 8) == false
@test coprime(16, 27) == true

# modinv()
@test modinv(1, 1) == 1
@test modinv(3, 10) == 7
@test modinv(10, 3) == 1
# @test modinv(5, 5)
# @test modinv(15, 35)

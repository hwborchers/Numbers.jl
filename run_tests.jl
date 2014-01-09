##
##  T e s t s  for Number.primes
##

using Numbers
using Base.Test

tests = ["primes"]

println("Running NUMBER tests ...")

for t in tests
    println(" -> $(t)")
    include("tests/$(t)_test.jl")
end

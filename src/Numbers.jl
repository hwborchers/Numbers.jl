module Numbers

# package code goes here

  export primesieve, primes2,
         nextprime, prevprime,
         primefactors, twinprimes,
         isprime, coprime,
         extgcd, modinv,
         eulerphi

  include("primes.jl")
  include("gcd.jl")

end # module

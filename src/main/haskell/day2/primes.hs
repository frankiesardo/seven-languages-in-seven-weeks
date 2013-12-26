module Main where
    primes = filter prime [2..]
        where 
            prime x = null [d | d <- [2..x-1], rem x d == 0] 

    primes' = filterPrimes [2..]
        where
            filterPrimes (p:xs) = p : filterPrimes [x | x <- xs, rem x p /= 0]
module Main where
    my_gcd x y = maximum (commonDivisor x y)
        where
            commonDivisor x y 
                | x < y =  [z | z <- [1..x], divisor x y z] 
                | otherwise = [z | z <- [1..y], divisor x y z]
            divisor x y z = rem x z == 0 && rem y z == 0
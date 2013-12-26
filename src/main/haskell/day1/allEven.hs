module Main where
    allEven :: [Integer] -> [Integer]
    allEven [] = []
    allEven (h:t) = if even h then h:allEven t else allEven t

    allEven2 numbers = [n | n <- numbers, (even n)]

    allEven3 numbers = filter even numbers
module Main where
    step3 x = [x, (x + 3) ..]
    step5 y = [y, (y + 5) ..]
    step8 x y = (zipWith (+) (step3 x) (step5 y))
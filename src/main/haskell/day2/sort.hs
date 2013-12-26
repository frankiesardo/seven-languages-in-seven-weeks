module Main where
    sort [] = []
    sort (h:t) = (sort lesser) ++ [h] ++ (sort greater)
        where
            lesser = filter (< h) t
            greater = filter (>= h) t    

module Main where
    sortWith f [] = []
    sortWith f (h:t) = (sort lesser) ++ [h] ++ (sort greater)
        where
            lesser = filter (not . f h) t
            greater = filter (f h) t    

    sort list = sortWith (\a b -> (a < b)) list
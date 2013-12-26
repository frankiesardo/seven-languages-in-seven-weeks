module Main where
    get key [] = Nothing
    get key ((k,v):tail) = if (key == k) then Just v else get key tail 
    

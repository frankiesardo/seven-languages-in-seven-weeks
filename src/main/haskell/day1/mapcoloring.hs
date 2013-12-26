module Main where
    mapcolors = ["red", "green", "blue"]
    mapcoloring = [(a, m, g, t, f) | a <- mapcolors, m <- mapcolors, g <- mapcolors, t <- mapcolors, f <- mapcolors, m /= t, m /= a, a /= t, a /= m, a /= g, a /= f, g /= f, g /= t] 
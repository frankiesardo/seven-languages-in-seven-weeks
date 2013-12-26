module Main where
    dollarPrice :: String -> Float
    dollarPrice price = read sanitisedValue ::Float
        where
            sanitisedValue = filter invalidChar price
            invalidChar = (\c -> c /= '$' && c /= ',')
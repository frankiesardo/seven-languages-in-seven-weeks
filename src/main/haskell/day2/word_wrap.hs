module Main where
    import Data.List

    wrap string columns
        | length string < columns = string
        | spaceInRangeIndex /= -1 = wrapReplacingSpace string spaceInRangeIndex
        | otherwise = wrapBreakingWord string columns

        where
            spaceInRangeIndex = lastIndexOf ' ' string (columns + 1)
            wrapReplacingSpace string spaceIndex = split string spaceIndex 1 
            wrapBreakingWord string columnIndex =  split string columnIndex 0
            split string index gap = (take index string) ++ "\n" ++  wrap (drop (index + gap) string) columns 


    lastIndexOf elm coll boundary
        | matchingElements == [] = -1
        | otherwise = maximum matchingElements
        where
            matchingElements = elemIndices elm (take boundary coll)


    addLineNumbers string = unlines (zipWith toLineNum [1..] (lines string))
        where
             toLineNum num line = show num ++ " " ++ line


    justifyLeft string columns = unlines (map appendSpaces (lines string))
        where
            appendSpaces string = string ++ (take (columns - (length string)) (repeat ' '))

    justifyRight string columns = unlines (map prependSpaces (lines string))
        where
            prependSpaces string = (take (columns - (length string)) (repeat ' ')) ++ string

    center string columns = (justifyLeft (justifyRight string leftMargin) columns)
        where            
            leftMargin = columns - (quot (columns - (length string)) 2)
        
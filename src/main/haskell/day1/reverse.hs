module Main where
    reverseList x = reverseResult(reverseTuple(x, []))

    reverseTuple ([], reverse) = ([], reverse)
    reverseTuple (h:t, reverse) = reverseTuple(t, h:reverse)

    reverseResult (original, reverse) = reverse
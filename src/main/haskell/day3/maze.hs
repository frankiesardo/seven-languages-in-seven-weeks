module Main where
       type Maze = [[Node]]

       data Node = Exits [(Int, Int)] deriving (Eq, Show)

       solveMaze m start end = solveMazeR [start] []
           where
               solveMazeR [] visitedQueue = Nothing
               solveMazeR (h:t) visitedQueue
                   | h == end = Just (reverse (end:visitedQueue))
                   | elem h visitedQueue = solveMazeR t visitedQueue
                   | otherwise = minPath (pathWith h t visitedQueue) (pathWithout h t visitedQueue)

               pathWith h t visitedQueue = solveMazeR ((exits h) ++ t) (h:visitedQueue)
               pathWithout h t visitedQueue = solveMazeR t (h:visitedQueue)

               minPath path1 path2
                   | path1 == Nothing && path2 == Nothing = Nothing
                   | path1 == Nothing = path2 
                   | path2 == Nothing = path1
                   | otherwise = minMonad path1 path2
               minMonad (Just p1) (Just p2) = if (length p1) < (length p2) then Just p1 else Just p2

               exits (Exits e) = map nodeAt e
               nodeAt (x, y) = (m !! y) !! x

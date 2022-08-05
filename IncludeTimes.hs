module IncludeTimes (includesTimes, includesPattern, includesElement) where

includesTimes :: Eq a => [a] -> [a] -> Int
includesTimes s [] = -1
includesTimes s p
 | fst inc = (includesTimes (snd inc) p) + 1
 | not (fst inc) = 0
  where
   inc = includesPattern s p

includesPattern :: Eq a => [a] -> [a] -> (Bool,[a])
includesPattern s [] = (True,s)
includesPattern s (x:xs) = (fst inclX && fst recRes, snd recRes)
 where
  inclX = includesElement s x
  recRes = includesPattern (snd inclX) xs

includesElement :: Eq a => [a] -> a -> (Bool,[a])
includesElement [] _ = (False,[])
includesElement s@(x:xs) c
 | x == c = (True,xs)
 | x /= c = (fst recRes, [x] ++ snd recRes)
  where
   recRes = includesElement xs c

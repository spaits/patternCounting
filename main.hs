includesTimes :: [Char] -> [Char] -> Int
includesTimes s p
 | fst inc = (includesTimes (snd inc) p) + 1
 | not (fst inc) = 0
  where
   inc = includesString s p

includesString :: [Char] -> [Char] -> (Bool,[Char])
includesString s "" = (True,s)
includesString s (x:xs) = (fst inclX && fst recRes, snd recRes)
 where
  inclX = includesChar s x
  recRes = includesString (snd inclX) xs

includesChar :: [Char] -> Char -> (Bool,[Char])
includesChar "" _ = (False,"")
includesChar s@(x:xs) c
 | x == c = (True,xs)
 | x /= c = (fst recRes, [x] ++ snd recRes)
  where
   recRes = includesChar xs c

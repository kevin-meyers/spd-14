module Prime
  ( nth
  ) where

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

isPrime :: Int -> Bool
isPrime n = not . any (\x -> n `rem` x == 0) $ [2 .. (isqrt n)]

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ fromIntegral . last . take n $ 2 : filter isPrime [3,5 ..]

module CollatzConjecture
  ( collatz
  ) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just (doCollatz n 0)
  where
    doCollatz x c
      | x == 1 = c
      | even x = doCollatz (x `quot` 2) (c + 1)
      | otherwise = doCollatz (3 * x + 1) (c + 1)

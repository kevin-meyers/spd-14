module Luhn
  ( isValid
  ) where

import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid n
  | length cleaned < 2 = False
  | otherwise = sumDigits (reverse cleaned) `rem` 10 == 0
  where
    cleaned = filter isDigit n

sumDigits :: String -> Int
sumDigits = sum . zipWith (curry processNum) [0 ..]

processNum :: (Int, Char) -> Int
processNum (i, c)
  | even i = int_c
  | otherwise = ifGreater $ int_c * 2
  where
    int_c = digitToInt c
    ifGreater n
      | n > 9 = n - 9
      | otherwise = n

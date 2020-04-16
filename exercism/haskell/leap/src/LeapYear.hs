module LeapYear
  ( isLeapYear
  ) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | yearNotDivisablyBy 4 = False
  | yearNotDivisablyBy 100 = True
  | yearNotDivisablyBy 400 = False
  | otherwise = True
  where
    yearNotDivisablyBy = (/= 0) . rem year

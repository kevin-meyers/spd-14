module Clock
  ( addDelta
  , fromHourMin
  , toString
  ) where

data Clock =
  Clock
    { hours :: Int
    , minutes :: Int
    }
  deriving (Eq)

adjustedAddDelta :: Clock -> Int -> Int -> Clock
adjustedAddDelta c h m = addDelta h m c

fromHourMin :: Int -> Int -> Clock
fromHourMin = adjustedAddDelta Clock {hours = 0, minutes = 0}

zeroPad :: String -> String
zeroPad n
  | length n == 2 = n
  | otherwise = zeroPad $ '0' : n

toString :: Clock -> String
toString Clock {hours = h, minutes = m} =
  zeroPad (show h) ++ ":" ++ zeroPad (show m)

minuteRollover :: Int -> (Int, Int)
minuteRollover m
  | remMins < 0 = (carried - 1, 60 + remMins)
  | otherwise = (carried, remMins)
  where
    (carried, remMins) = m `quotRem` 60

hourRollover :: Int -> Int
hourRollover h
  | h < 0 = hourRollover $ 24 + h
  | otherwise = h `rem` 24

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute Clock {hours = h, minutes = m} =
  Clock {hours = newHours, minutes = newMinutes}
  where
    (carried, newMinutes) = minuteRollover $ m + minute
    newHours = hourRollover $ hour + h + carried

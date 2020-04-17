module Acronym
  ( abbreviate
  ) where

import Data.Char (isLower, isUpper, toLower, toUpper)

isDelimeter :: Char -> Bool
isDelimeter y =
  case y of
    ' ' -> True
    '-' -> True
    '_' -> True
    _ -> False

wordHeadTail :: String -> String -> (String, String)
wordHeadTail "" word = (word, "")
wordHeadTail [x] word = (x : word, "")
wordHeadTail (x:y:xs) word
  | isDelimeter x = (word, y : xs)
  | isDelimeter y = (x : word, xs)
  | isUpper y
  , isLower x = (x : word, toLower y : xs)
  | otherwise = x `appendFirst` wordHeadTail (y : xs) word

appendFirst :: a -> ([a], b) -> ([a], b)
appendFirst x (xs, b) = (x : xs, b)

split :: String -> [String]
split "" = []
split xs = word : split remainder
  where
    (word, remainder) = wordHeadTail xs ""

abbreviate :: String -> String
abbreviate s = map (toUpper . head) (filter (/= []) (split s))

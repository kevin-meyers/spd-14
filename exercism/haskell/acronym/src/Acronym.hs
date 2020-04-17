module Acronym
  ( abbreviate
  ) where

import Data.Char (isAlpha, isLower, isUpper, toUpper)

isDelimiter :: Char -> Bool
isDelimiter x =
  case x of
    ' ' -> True
    '_' -> True
    '-' -> True
    _ -> False

abbreviate' :: String -> String
abbreviate' "" = ""
abbreviate' [x] = ""
abbreviate' (x:y:xs)
  | not $ isDelimiter x = abbreviate' $ y : xs
  | isDelimiter y = abbreviate' $ y : xs
  | otherwise = y : abbreviate' xs

fromCamel :: String -> String
fromCamel [] = []
fromCamel [x] = [x]
fromCamel (x:y:xs)
  | isLower y = x : fromCamel (y : xs)
  | isUpper x = x : fromCamel (y : xs)
  | otherwise = x : ' ' : y : fromCamel xs

abbreviate :: String -> String
abbreviate xs = map toUpper $ abbreviate' $ ' ' : fromCamel (map (\x -> case (isAlpha x) of True -> x False -> ' ') xs)

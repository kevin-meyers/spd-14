module CryptoSquare
  ( encode
  ) where

import Data.Char (isAlpha, toLower)
import Data.List (intersperse)

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

encode :: String -> [String]
encode xs
  --intersperse " " $
 =
  buildRect
    (filter isAlpha $
     foldr (\index acc -> map (!! index) rect ++ acc) [] [0 .. height])
    height
  where
    processed = preprocess xs
    (width, height) = rectShape $ length processed
    rect = buildRect processed width

rectShape :: Int -> (Int, Int)
rectShape n
  | isq * isq < n = (isq + 1, isq)
  | otherwise = (isq, isq)
  where
    isq = isqrt n

preprocess :: String -> String
preprocess = map toLower . filter isAlpha

buildRect :: String -> Int -> [String]
buildRect s width = map (buildRow width) $ group width s

group :: Int -> String -> [String]
group _ "" = []
group n l = take n l : group n (drop n l)

buildRow :: Int -> String -> String
buildRow 0 "" = ""
buildRow n "" = replicate n ' '
buildRow n (x:xs) = x : buildRow (n - 1) xs

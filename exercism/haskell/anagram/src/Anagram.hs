module Anagram
  ( anagramsFor
  ) where

import Data.MultiSet (MultiSet)
import qualified Data.MultiSet as M

import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs =
  filter
    (\text ->
       let t = map toLower text
        in t /= word && checkAnagram word t)
  where
    word = map toLower xs
    checkAnagram = isAnagram . M.fromList

isAnagram :: MultiSet Char -> String -> Bool
isAnagram xset ""
  | M.null xset = True
  | otherwise = False
isAnagram xset (y:ys)
  | M.null xset = False
  | otherwise = isAnagram (M.delete y xset) ys

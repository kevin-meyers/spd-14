module Pangram
  ( isPangram
  ) where

import Data.Char (toUpper)
import Data.Set (Set)
import qualified Data.Set as S

isPangram :: String -> Bool
isPangram s =
  null $ foldr (removeExisting . toUpper) (S.fromList ['A' .. 'Z']) s

removeExisting :: (Ord a) => a -> Set a -> Set a
removeExisting x acc
  | S.member x acc = S.delete x acc
  | otherwise = acc

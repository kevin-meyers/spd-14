module SumOfMultiples
  ( sumOfMultiples
  ) where

import Data.Set (Set)
import qualified Data.Set as Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum allFactorsSet
  where
    combine x = Set.union . multiplesSet limit
    allFactorsSet = foldr combine Set.empty factors

multiplesSet :: Integer -> Integer -> Set Integer
multiplesSet _ 0 = Set.empty
multiplesSet limit x = Set.fromAscList [x,x * 2 .. (limit - 1)]

module DNA
  ( toRNA
  ) where

import Data.Either.Combinators (mapRight)
import qualified Data.Map.Strict as Map
import Data.Maybe (fromJust)

toRNA :: String -> Either Char String
toRNA = toRNA' (Map.fromList assoc)
  where
    assoc = [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]

toRNA' :: Map.Map Char Char -> String -> Either Char String
toRNA' _ "" = Right ""
toRNA' dnaFrom (x:xs)
  | Map.notMember x dnaFrom = Left x
  | otherwise =
    mapRight ((fromJust $ Map.lookup x dnaFrom) :) $ toRNA' dnaFrom xs

module DNA
  ( toRNA
  ) where

import Data.Either.Combinators (mapRight)
import qualified Data.Map.Strict as Map

toRNA :: String -> Either Char String
toRNA = toRNA' dnaFrom
  where
    dnaFrom = Map.fromList [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]

toRNA' :: Map.Map Char Char -> String -> Either Char String
toRNA' _ "" = Right ""
toRNA' dnaFrom (x:xs) =
  case Map.lookup x dnaFrom of
    Nothing -> Left x
    Just c -> mapRight (c :) $ toRNA' dnaFrom xs

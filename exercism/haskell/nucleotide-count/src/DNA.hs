module DNA
  ( nucleotideCounts
  , Nucleotide(..)
  ) where

import Data.Map (Map)
import qualified Data.Map as Map

import Control.Monad (foldM)

data Nucleotide
  = A
  | C
  | G
  | T
  deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts =
  foldM (\acc x -> maybe (Left "GOD WHY") (`addOne` acc) (parse x)) dict
  where
    dict = Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

addOne :: Nucleotide -> Map Nucleotide Int -> Either String (Map Nucleotide Int)
addOne x acc =
  case Map.lookup x acc of
    Nothing -> Left "NOT IN"
    Just i -> Right $ Map.insert x (i + 1) acc

parse :: Char -> Maybe Nucleotide
parse 'A' = Just A
parse 'C' = Just C
parse 'G' = Just G
parse 'T' = Just T
parse _ = Nothing

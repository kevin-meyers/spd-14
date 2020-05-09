{-# LANGUAGE TupleSections #-}

module DNA
  ( nucleotideCounts
  , Nucleotide(..)
  ) where

import Data.Map (Map)
import qualified Data.Map as M

import Control.Monad (foldM)

data Nucleotide
  = A
  | C
  | G
  | T
  deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts = foldM addOne dict
  where
    dict = M.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

addOne :: Map Nucleotide Int -> Char -> Either String (Map Nucleotide Int)
addOne acc x = (\i -> M.adjust (+ 1) i acc) <$> parse x

parse :: Char -> Either String Nucleotide
parse 'A' = Right A
parse 'C' = Right C
parse 'G' = Right G
parse 'T' = Right T
parse x = Left $ x : " Is not a nucletide."

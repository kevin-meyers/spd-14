module DNA
  ( toRNA
  ) where

import Control.Error.Util (note)
import qualified Data.Map.Strict as Map

toRNA :: String -> Either Char String
toRNA = traverse rnaToDna

rnaToDna :: Char -> Either Char Char
rnaToDna x = note x (Map.lookup x assoc)
  where
    assoc = Map.fromList [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]

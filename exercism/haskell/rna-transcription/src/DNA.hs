module DNA
  ( toRNA
  ) where

import qualified Data.Map.Strict as Map

toRNA :: String -> Either Char String
toRNA = foldr (\x acc -> either Left (whenValid dnaFrom x) acc) (Right "")
  where
    dnaFrom = Map.fromList [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]

whenValid :: Map.Map Char Char -> Char -> String -> Either Char String
whenValid dnaFrom x acc = maybe (Left x) (Right . (: acc)) found
  where
    found = Map.lookup x dnaFrom

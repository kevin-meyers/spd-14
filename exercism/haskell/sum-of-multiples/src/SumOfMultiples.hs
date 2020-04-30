module SumOfMultiples
  ( sumOfMultiples
  ) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum . removeDupsSorted . mergeSort $ foldr combine [] factors
  where
    combine f acc = findMultiples limit f ++ acc

findMultiples :: Integer -> Integer -> [Integer]
findMultiples _ 0 = []
findMultiples limit x = takeWhile (< limit) (map (x *) [1 ..])

mergeSort :: [Integer] -> [Integer]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort $ take half xs) (mergeSort $ drop half xs)
  where
    half = length xs `div` 2

merge :: [Integer] -> [Integer] -> [Integer]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x < y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

removeDupsSorted :: [Integer] -> [Integer]
removeDupsSorted [] = []
removeDupsSorted [x] = [x]
removeDupsSorted (x:y:xs)
  | x == y = removeDupsSorted $ x : xs
  | otherwise = x : removeDupsSorted (y : xs)

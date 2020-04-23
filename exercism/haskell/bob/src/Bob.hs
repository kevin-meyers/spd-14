module Bob
  ( responseFor
  ) where

import Data.Char (isAlpha, isLower, isSpace)

responseFor :: String -> String
responseFor xs
  | null xs || all isSpace xs = "Fine. Be that way!"
  | aQuestion && not isYelling = "Sure."
  | not aQuestion && isYelling = "Whoa, chill out!"
  | aQuestion && isYelling = "Calm down, I know what I'm doing!"
  | otherwise = "Whatever."
  where
    text = filter (\l -> isAlpha l || l == '?') xs
    isYelling = not (any isLower text) && any isAlpha text
    aQuestion
      | null text = False
      | otherwise = last text == '?'

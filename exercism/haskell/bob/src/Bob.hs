module Bob
  ( responseFor
  ) where

import Data.Char (isAlpha, isLower)

responseFor :: String -> String
responseFor xs
  | xs == "" || all isSilent xs = "Fine. Be that way!"
responseFor xs =
  case (isQuestion text, isAllCaps) of
    (True, False) -> "Sure."
    (False, True) -> "Whoa, chill out!"
    (True, True) -> "Calm down, I know what I'm doing!"
    (False, False) -> "Whatever."
  where
    text = toLettersAndQ xs
    isAllCaps = not (any isLower text) && any isAlpha text

isQuestion :: String -> Bool
isQuestion [] = False
isQuestion text = last text == '?'

isSilent :: Char -> Bool
isSilent x =
  case x of
    ' ' -> True
    '\t' -> True
    '\n' -> True
    '\r' -> True
    _ -> False

toLettersAndQ :: String -> String
toLettersAndQ = filter (\l -> isAlpha l || l == '?')

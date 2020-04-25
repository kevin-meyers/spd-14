module BST
  ( BST
  , bstLeft
  , bstRight
  , bstValue
  , empty
  , fromList
  , insert
  , singleton
  , toList
  ) where

data BST a
  = Empty
  | BST a (BST a) (BST a)
  deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft (BST _ Empty _) = Nothing
bstLeft (BST _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight (BST _ _ Empty) = Nothing
bstRight (BST _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue tree = error "You need to implement this function."

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList xs = error "You need to implement this function."

insert :: Ord a => a -> BST a -> BST a
insert x tree
  | x <= a = maybe (singleton x) (insert x) (bstLeft tree)
  | otherwise = maybe (singleton x) (insert x) (bstRight tree)
  where a =     

singleton :: a -> BST a
singleton x = BST x empty empty

toList :: BST a -> [a]
toList tree = error "You need to implement this function."

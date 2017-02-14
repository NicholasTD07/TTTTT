head' :: [a] -> a
head' xs = case xs of [] -> error "Cannot call head' on an empty list."
                      (x:_) -> x

-- length' :: (Num b) => [a] -> b
-- length' xs = case xs of [] -> 0
--                      (_:xs') -> 1 + length' xs'

-- sum' :: (Num a) => [a] -> a
-- sum' xs = case xs of [] -> 0
--                      (x:xs') -> x + sum' xs'

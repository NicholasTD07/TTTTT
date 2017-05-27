flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x: xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (x:xs)
    | f x = x: filter' f xs
    | otherwise = filter' f xs

sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs

-- mind-blowing stuff
-- map ($ 3) [(4+), (10*), (^2), sqrt]

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Cannot call maximum' on an empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = [] -- n must be Ord
    | otherwise = x: replicate' (n-1) x -- n must be Num

{-
*Main> take 1 [1,2,3,4,5]
[1]
*Main> take 2 [1,2,3,4,5]
[1,2]
*Main> take 3 [1,2,3,4,5]
[1,2,3]
*Main> take 4 [1,2,3,4,5]
[1,2,3,4]
*Main> take 7 [1,2,3,4,5]
[1,2,3,4,5]
-}
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n [] = []
take' n [x] = [x]
take' n (x:xs) -- = xs -- minimum implementation
    | n <= 0 = []
    | otherwise = x: take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x: repeat' x
-- take 5 $ repeat 3


zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y): zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys)
    | x == y = True
    | otherwise = elem' x ys

{-
 [3,2,1] = (3, [2,1])
 [2,1] ++ [3] ++ [] = [2,1,3] = (2, [1, 3])
 [1] + [2] + [3] = [1,2,3] = (1, [2,3])
 [] + [1] + [2,3] = [1,2,3]
 -}
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = [] -- Does this stop inifinite recursion?
quicksort (x:xs) = smaller ++ [x] ++ bigger
    where smaller = quicksort [ x' | x' <- xs, x' < x ]
          bigger = quicksort [x' | x' <- xs, x' > x]

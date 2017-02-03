elem' :: (Eq a) => a -> [a] -> Bool
elem' a as = if head as == a
                then True
                else elem a $ tail as

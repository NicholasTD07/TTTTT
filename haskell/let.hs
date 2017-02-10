squares :: (Num a) => [a] -> [a]
squares xs = [
    square | x <- xs,
    let square = x * x
    ]

t :: (a, b, c) -> (c, b, a)
t (a,b,c) =
    let (x, y, z) = (a, b, c)
    in (z, y, x)

-- let tt x y z = x*y + z in tt 4 10 2 -- run in ghci

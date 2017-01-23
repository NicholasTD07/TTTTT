let a: [Int?] = [nil, 1, 2, 3,]

func t(a: Int?, _: Int?) -> Int { return a! }

_ = a.reduce(0, t)

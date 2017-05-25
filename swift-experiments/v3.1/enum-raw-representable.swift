enum T: String {
    case t = "t"
}

func p<T: RawRepresentable>(_ t: T) where T.RawValue == String {
    print(t.rawValue)
}

p(T.t)

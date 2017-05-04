class T {
}

let t = T()

print(t)
print(T.self)
print(type(of: t))
print(type(of: type(of: t)))
print(type(of: type(of: type(of: t))))

let type: Any.Type = T.self

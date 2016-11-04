input_text = '''
struct Brand {
    let id: UUID
    let name: String
}

struct Tea {
    let id: UUID
    let name: String
    let brand: Brand
}
'''

expected_output = '''
extension Brand {
    func new(with id: UUID) -> Brand {
        return Brand(
            id: id,
            name: self.name
        )
    }

    func new(with name: String) -> Brand {
        return Brand(
            id: self.id,
            name: name
        )
    }
}

extension Tea {
    func new(with id: UUID) -> Tea {
        return Tea(
            id: id,
            name: self.name,
            brand: self.brand
        )
    }

    func new(with name: String) -> Tea {
        return Tea(
            id: self.id,
            name: name,
            brand: self.brand
        )
    }

    func new(with brand: Brand) -> Tea {
        return Tea(
            id: self.id,
            name: self.name,
            brand: brand
        )
    }
}
'''

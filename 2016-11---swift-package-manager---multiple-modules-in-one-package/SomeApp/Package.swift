import PackageDescription

let package = Package(
    name: "SomeApp",
    targets: [
        Target(name: "SomeApp", dependencies: []),
        Target(name: "SomeOtherApp", dependencies: []),
        Target(name: "SomeAppTests", dependencies: [
            "SomeApp",
            "SomeOtherApp",
        ]),
    ]
)

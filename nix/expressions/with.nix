# Read let-in.nix first
# import ./expressions/with.nix
let longName = { a = 3; b = 4; }; in with longName; a + b

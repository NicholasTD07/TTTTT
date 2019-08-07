# s = import ./data-structures/attribute-set.nix

{ foo = "bar"; a-b = "baz"; "123" = "num"; }

# nix-repl> s."123"
# "num"

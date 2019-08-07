# rs = import ./data-structures/recursive-attribute-set.nix

rec { a = 3; b = a+4; }

# nix-repl> rs
# { a = 3; b = 7; }

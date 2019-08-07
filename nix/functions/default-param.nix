# mulOrDouble = import ./functions/default-param.nix

{ a, b ? 2 }: a * b

$ nix-repl> mulOrDouble { a = 2;}
$ 4

# import ./functions/complex.nix { a = 5; trueMsg = "ok"; }
# trace: ok
# true

{ a, b ? 3, trueMsg ? "yes", falseMsg ? "no" }:
if a > b
  then builtins.trace trueMsg true
  else builtins.trace falseMsg false

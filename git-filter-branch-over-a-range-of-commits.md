# Run `git filter-branch` Over a Range of Commits

Say you want to add a prefix for commits between commit_A and commit_B,
inclusive, when there are commits before A and after B.

You can't just run `git filter-branch --msg-filter "printf '[prefix] ' && cat"
commit_A^..commit_B` because it would leave the commit after B without a parent
(git will ask you `which ref do you want to rewrite?`)

... --- A --- C --- D --- E --- B --- ...

## Steps

TODO

## Commands

```bash
# on master branch right now
# commit_A is 2383813
# commit_B is 7cebad5

# co = checkout
# cob = checkout -b

g cob filter-branch-rebase-magic # Create another branch for dark magic
g cob ios-double-nav-end 7cebad5 # Create a branch where commit_B is HEAD

# Apply change, in this case: add a space after the prefix
git filter-branch --msg-filter 'sed "s/\[ios-double-navigation\]/\[ios-double-navigation\] /"' 2383813^..HEAD
g co filter-branch-rebase-magic # Go back to magic-happening branch
g rebase ios-double-nav-end     # rebase onto the branch where filter-branch happened
# HEAD for filter-branch-rebase-magic is 51d2c97

g co master                     # Go back to the original branch

# undo = reset --hard
g undo 51d2c97                  # undo to the commit which is the HEAD of the magic-happening branch
```

## References

* http://stackoverflow.com/questions/15250070/running-filter-branch-over-a-range-of-commits
* https://davidwalsh.name/update-git-commit-messages

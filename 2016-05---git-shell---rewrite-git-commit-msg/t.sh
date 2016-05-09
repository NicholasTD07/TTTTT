# git filter-branch --msg-filter 'shell command' ref-list
git filter-branch --msg-filter '
                   cat &&
                   echo "Acked-by: Bugs Bunny <bunny@bugzilla.org>"
           ' HEAD~10..HEAD

# Added prefix to commit after 327530d to HEAD
git filter-branch --msg-filter 'echo "[django-rest-take-2]" && cat' "327530d..HEAD"

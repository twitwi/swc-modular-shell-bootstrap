
# Setup

(working on a ramdisk if you can to improve io speed)

To be able to find the scripts

    bootstrap=/where/you/cloned/this/repo

# Synthetic, after a git clone of the bc

    git checkout -b wip origin/master
    git filter-branch --tree-filter $bootstrap/erase.sh --prune-empty
    
    # I don't have the time to try again, but this next line might be useless by now
    git rebase --root --preserve-merges HEAD
    
    git filter-branch -f --prune-empty --parent-filter $bootstrap/rewrite-parent.rb
    git filter-branch -f --msg-filter $bootstrap/remessage.awk

    
# Old WIP

    bootstrap=/where/you/cloned/this/repo

at <https://github.com/wking/swc-modular-shell/issues/13>

from <https://github.com/wking/swc-modular-shell/issues/4> it seems the gen-*.py are gen-nene.py and gen-sequence.py



Let's also look at gen-nene.py as it is already done in #13 with gen-sequence.py

    $ git log --follow --oneline bc/master -- novice/shell/gen-sequence.py
    b8c7dc3 Reorganizing material to put novice + intermediate at top level
    3a38907 shell: Rename the new-style lessons from 'bash' to 'shell'
    f4cc356 Updating index file and moving utility scripts to the right place
    a41a27d Renaming directories with example files
    03b26ac Example files for intro to shell
    
    $ git log --follow --oneline bc/master -- novice/shell/gen-nene.py
    b8c7dc3 Reorganizing material to put novice + intermediate at top level
    3a38907 shell: Rename the new-style lessons from 'bash' to 'shell'
    f4cc356 Updating index file and moving utility scripts to the right place
    090b60b Put randomly generated data in files

Let's remind us of what is the breaking commit by searching the new history for these, again

    $ git log --oneline modular-shell/master | grep 'Reorganizing material\|shell: Rename the new-style\|Updating index file and moving\|Renaming directories with\|Example files for'
    c6ac923 Updating index file and moving utility scripts to the right place
    09fb561 Renaming directories with example files
    c08de6f Example files for intro to shell

So the breaking one is c6ac923 (the last one that is present) corresponding to f4cc356 in bc.

This means that from the breaking commit gen-nene.py is involved in exactly the same commits as gen-sequence.py.


git log  --oneline --topo-order  | awk '{print NR " " $0}'|less
e part de la fin


(cd .. && rm -rf bc && cp -r bcbase bc) && cd $(pwd) && git checkout -b wip origin/master

    # git checkout -b bash-novice 3a38907

    git filter-branch --tree-filter $bootstrap/erase.sh --prune-empty

(cd .. && cp -r bc bc-before-rebase)

    git rebase --root --preserve-merges HEAD
    # git filter-branch -f --prune-empty

    # (without --preserve-merges) … that will complain about an empty/conflict commit (rebase in progress; onto 30659e7) and it will also remove the merges (producing a linear history)
    # git reset    git rebase --continue    git checkout -b newone

(cd .. && cp -r bc bc-after-rebase)


but it is not sufficient, so we use this <http://git.661346.n2.nabble.com/Removing-useless-merge-commit-with-quot-filter-branch-quot-td7356544.html> that really cleans the empty commits


    git filter-branch -f --prune-empty --parent-filter $bootstrap/rewrite-parent.rb

Comparing this with the current master (modular-shell/master) that is supposed to be cloned in $modmaster

    git log --topo-order  --oneline > ,,here
    git -C $modmaster log --topo-order --oneline > ,,modmaster
    diff -u <(sed 's@^........@@g' ,,modmaster)  <(sed 's@^........@@g' ,,here)

still there are some messages that need to be cleaned up
rewrite the messages

    git filter-branch -f --msg-filter $bootstrap/remessage.awk

    git log --topo-order  --oneline > ,,here
    git -C $modmaster log --topo-order --oneline > ,,modmaster
    diff -u <(sed 's@^........@@g' ,,modmaster)  <(sed 's@^........@@g' ,,here)




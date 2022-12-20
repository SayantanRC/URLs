[Print README file](https://github.com/SayantanRC/URLs/blob/master/print%20readme%20file%20from%20github.md)  

- [Git Tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging)  
  [Tagging in Android studio](https://stackoverflow.com/questions/19862682/android-studio-push-tags-to-remote)  
  [More in tags](https://stackoverflow.com/questions/35979642/what-is-git-tag-how-to-create-tags-how-to-checkout-git-remote-tags)  

[Undo last commit - soft reset](https://gist.github.com/wilsonsilva/c6f870e6423a1c0076224d1f1e468dbb)  
[Git amend](https://www.git-tower.com/learn/git/faq/edit-fix-commit-message/)  
[Git rebase](https://about.gitlab.com/blog/2018/06/07/keeping-git-commit-history-clean/)  
[Branches](https://www.nobledesktop.com/learn/git/git-branches)  
[Sync a GitHub Repo: How To Ensure Your GitHub Fork Is Up To Date](https://www.earthdatascience.org/courses/intro-to-earth-data-science/git-github/github-collaboration/update-github-repositories-with-changes-by-others/)  
[Add upstream to local repo](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork)  
[Get a new branch from upstream into forked repo](https://stackoverflow.com/questions/4410091/github-import-upstream-branch-into-fork)  

[GitLab Guide: Clean Git history](https://about.gitlab.com/blog/2018/06/07/keeping-git-commit-history-clean/)  

## Git commands
Undo last commit without removing the changes
```
git reset --soft HEAD~1
```
Push a branch to remote
```
git push <full-remote-branch-name> -u <local-branch-name>     # git push origin/test -u test
```
List all remotes
```
git remote -v
```
List all branches
```
git branch -a
```
Deletea branch
```
git branch -d <local-branch-name>  # local delete
git push <remote> --delete <branch-name>  # remote delete. example: git push origin --delete remoteBranchName
```
Check out a remote branch (creates a local branch if not already present)  
https://stackoverflow.com/questions/1783405/how-do-i-check-out-a-remote-git-branch
```
git fetch
git switch <remote-branch-name without remote-name>    # git switch test
# alternately we could also use: git switch -c test origin/test
# alternately: git checkout -b test origin/test
```
Get commits on a branch  
https://stackoverflow.com/questions/1710894/using-git-show-all-commits-that-are-in-one-branch-but-not-the-others
```
git log <branch-name>
```
Get unpushed commits  
https://stackoverflow.com/questions/2016901/viewing-unpushed-git-commits
```
git log <full-remote-branch-name>..HEAD    # git log origin/master..HEAD
```
Check current branch name  
https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git
```
git branch --show-current
```
Cherry-pick a comment to current branch
```
git cherry-pick <commit-hash>
```
Undo merge for a single file  
https://stackoverflow.com/a/14409744  
```
git checkout -m <file_path>
```
Undo a git merge  
https://stackoverflow.com/a/14586751  
```
git reset --merge ORIG_HEAD
```
Check commits on a branch not present on another branch  
https://stackoverflow.com/a/4207176/10967630
```
git log --no-merges --oneline main ^dev   # shows commits present on main but not yet present on dev branch
```
Delete tags
```
git tag -d <tag_name>    # delete local tag
git push --delete origin <tag_name>  # delete remote tag, remote name is origin
```

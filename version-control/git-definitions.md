# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is the ability to save a history of your work, and to make changes to any work on alternate branches, which can be merged into the master branch later if desired. It allows all members of a project to view this history as past saves are not overwritten.

* What is a branch and why would you use one?

A branch is an alternate version of a repository which allows all files to be edited without affecting the master branch. This is useful because it means there is no risk of editing work, because if the new work is not found satisfactory it doesnt not need to be merged into the master branch, so the master branch would be unaffected. It also allows multiple people to work on the same project at the same time without worrying about their changes conflicting with someone else's.

* What is a commit? What makes a good commit message?

A commit is taking a 'snapshot' of the repository. This means that in the future when files are changed again the previous commits are still availble to be read. A good commit message is very clear about what has been updated so it can be easy to understand what has been changed and easy to find any specific previous versions of the repository you are looking for.

* What is a merge conflict?

A merge conflict occurs when git is unable to merge two branches together. The most likely cause of this would be if two people were working on the same file and made conflicting changes. Git is not able to merge the branches but it does mark where the conflict is in the file, which can then be edited to confirm which version is to be used. Another form of merge conflict occurs if a merging branch has deleted one of the files from the repo. To solve, the file can be added and committed to the new version of the repo, and then either kept in the repo or can then be deleted.

********************
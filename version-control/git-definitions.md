# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

// Version control is a system implemented by developers in order to review changes to a project over time. When working on a large project, or when working with multiple people, it can be useful to freely move through the work-flow time-line in order to troubleshoot or contrast and compare functionality/UX/style/etc. For example: a bug or error arises which wasn't there from the beginning. Being able to backtrack and find exactly when a commit caused the issue to make itself known could save an enormous amount of time when it came to finding and fixing it.// 

* What is a branch and why would you use one?

// A branch is a copy of your code, to which you can make changes while insuring the integrity of the rest of - but most importantly the base of - your project. Also, it allows multiple programmers to work on different parts of the same project simultaneously. The master branch is the base from which everything else flows. One would create and use branches to both enlarge the canvas (Allowing multiple people to 'paint' at once), and as a form of insurance. To continue the analogy - if what you painted yesterday on the top-right quarter of the canvas, you can remove the paint itself and make it as if it never was.//

* What is a commit? What makes a good commit message?

// A commit is when you save the information you've changed to the repository. It allows you to create and work from logical break points within your code and safely incorporate new information at your leisure. For example: You are building a snowman from the bottom up. Maybe at the initial commit you save the legs. Then you build the torso and commit it. Then you build the head and commit it. In your repository you can go back and find a version of your snowman which is just legs, a version which has legs and torso, and the last version with legs, torso and head. A good commit message will be concise enough that anyone (not just you) can understand what it was that was added.//

* What is a merge conflict?

//A merge conflict happens when Git tries to merge a file which has already been modified, and there is no obvious logical solution as to which modification should stand. Git will then send you back merge conflict outlining what the conflict is by marking it, and showing both versions of the conflicting code for the programmer to manually address. From here the programmer can choose which version to integrate- or create a completely new version.//

INSTRUCTIONS

Create a new repository on GitHub for your Sinatra application.

When you create the Sinatra app for your assessment, add the [spec.md] file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.

Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.

While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.

Make sure to create a good README.md with a short description, install instructions, a contributor's guide, and a link to the [license] for your code.

Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project.

Prepare a short video demo with narration describing how a user would interact with your working application.

Write a blog post about the project and process.

When done, submit your GitHub repo's URL, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.

CHECKLIST

Specs:
[x]Use Sinatra to build the app
[x]Use ActiveRecord for storing information in a database Used ActiveRecord (i.e. build in methods like create , save) to store informationin a database
[x]Include more than one model class (e.g. User, Post, Category) Two models included : User and Stock
[x]Include at least one has_many relationship on your User model (e.g. User has_many Posts) User has many stocks and stock belongs to user
[x]Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Stock belong to User
[x]Include user accounts with unique login attribute (username or email) Used ActiveRecord validations to ensure unique email login
[x]Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying Stock controller contains the CRUD routes
[x]Ensure that users can't modify content created by other users
[x]Include user input validations
[x]BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
[x]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
[x]You have a large number of small Git commits
[x]Your commit messages are meaningful
[x]You made the changes in a commit that relate to the commit message
[x]You don't include changes in a commit that aren't related to the commit message
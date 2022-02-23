```{include} _templates/nav.html
```

# Dealing with errors 

This chapter will walk you through how to spot and fix common errors.  

```{contents} Sections
  :depth: 1
  :local:
```

## How to spot a failed fails

Let's go back to our action tab and run the action one more time.
A failed action looks like this:

![github commit fail](./_static/commit1.png)

Github will email you when your action fails. It can happen quite often!

![github email fail](./_static/commit2.png)

To find out what went wrong with your action, click into your job. 

![github action fail](./_static/commit3.png)

This action failed because there was nothing to commit when your scrape notebook `scrape.ipynb` ran for the second time. 
If the site you scrape updates sporadically, you may not care if there was a change in your file at every scrape. To fix this, you can replace the commit line with the following:

```bash
git diff --exit-code || git commit -am "adding new data"
``` 

This line will check to see if there are [any changes](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---exit-code), and only add and commit if there are changes. 

## Check your work

Run the action one more time and see if it fails. 

![github action sucess](./_static/commit4.png)

Now pull the repo back down to your local machine, and change a line in your `warn.csv`. 

Push up and run the action one more time. Check to make sure changes have been committed to your repo.

![github action check](./_static/commit5.png)


Remember, you may want your action to fail depending on your scrape. You can also design a custom message to be sent out to a slack channel. 



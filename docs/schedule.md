<nav>
  <div class="row">
    <div class="sevencol">
      <div class="shingle">
        <a href="https://palewi.re/">
          <div rel="rnews:copyrightedBy rnews:hasSource rnews:providedBy">
            <div about="http://palewi.re/" typeof="rnews:Organization">
              <div property="rnews:name">palewire</div>
            </div>
          </div>
        </a>
      </div>
    </div>
    <div class="fivecol last links">
      <ul>
        <li>
          <a href="http://palewi.re/posts/" title="Posts">
            Posts
          </a>
        </li>
        <li>
          <a href="http://palewi.re/work/" title="Work">
            Work
          </a>
        </li>
        <li>
          <a href="http://palewi.re/talks/" title="Talks">
            Talks
          </a>
        </li>
        <li>
          <a href="http://palewi.re/who-is-ben-welsh/" title="Who is Ben Welsh?">
            About
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="row topbar">
    <div class="twelvecol last"></div>
</div>

# Create an Action

This chapter will walk you through how to create a GitHub Action that executes a scraper on a schedule.

## Getting started with Actions on GitHub

Navigate back to the GitHub repo and click on the "Actions" tab. This page will display a log of the Action we configure.

![github actions page](./_static/actions-page.png)

Click on "set up a workflow yourself," which will take you a workflow template created by GitHub, which we will use to get started. 

Without changing anything, push the green "Start commit" button. Write a commit message "create workflow" and commit this workflow to the GitHub repo. We can stick with the default name for the file, `main.yml`.

![commit the action](./_static/actions-commit.png)

After you commit, you will be navigated back to the "Code" tab. Note that a directory `workflows` was created inside a hidden `.github` directory in the repo after the commit. All your Actions will live inside the `.github/workflows` directory.

![a new github/workflows directory is created](./_static/actions-directory.png)

## Understand the Action

Navigate back to the "Actions" tab and notice that it logged the first run of the template workflow you just created. 

![note GitHub logged our first workflow](./_static/actions-log.png)

Click on "create workflow" next to the green check and then click on "build" to explore and understand our Action.

![check out workflow](./_static/actions-build.png)

The check mark next to each step indicates that the step was successfully executed. This workflow executed a single job called "build." 

The first two steps — "Set up job" and "Run actions/checkout@v2" — create an environment to run the Action. 

The third step, Run a one-line script, prints a simple string "Hello, world!" and the fourt step, "Run a multi-line script" prints two lines: "Add other actions to build," and "test, and deploy your project."

Lastly, the fifth and sixth steps complete the Action.

## Pull the changes to your computer

The next step is to pull the changes we made on GitHub to the local branch on your computer. Go back to terminal and enter the following command:

```
git pull origin main
```

Open the directory in a code editor and navigate to the workflow file we created called `main.yml` in the `.github/workflows` directory.

Select **everything** in the `main.yml` workflow file and **delete it**. We will write steps to iteratively build the workflow.

## Building a GitHub Actions workflow

GitHub Actions uses YAML syntax to define the workflow. These workflows are stores in the repository, in a hidden directory (denoted by the `.` in front of it) called `.github/workflows`.

We will start by giving our workflow a `name` — something like "Automated scrape."

```
name: Automated scrape
```

Next, we will add settings in the workflow so that the Action runs on a schedule — instead of running on `push`, like in our first test. We will use the `on` keyword.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:
```
This will tell our workflow to execute on a schedule, at 9 a.m. UTC every day.

```{note}
We will schedule the Action using [Cron](https://en.wikipedia.org/wiki/Cron), a time-based job scheduler that the computer uses to execute commands. There are websites — such as [this one](https://crontab.guru/) — that help translate time into cron schedule expressions. GitHub runs Actions in coordinated universal time (UTC).
```

Now let's tell the workflow what tasks — using the `jobs` keyword — to execute. Let's call this job `scrape`.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
```

We will use the `runs-on` keyword to tell GitHub what runner the job will use.

```{note}
A [runner](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners) is a virtual machine hosted by GitHub with the GitHub Actions application. GitHub offers runners with Linux, Windows, and macOS operating systems.
```

In our case, the runner will be the latest version of Ubuntu, an open-source operating system on Linux.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
```

Using the `steps` keyword we will tell GitHub the sequence of tasks that we want the job to execute.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
```

Next, we will tell the virtual machine that is hosting this Action to install Python 3, along with the libraries our scraper will use. 

The `name` keyword denotes the title we give the step.

The `uses` keyword specifies which version of the `actions/checkout` action to run. In our case, we will use `v2`.

The `run` keyword tells the job to execute a command on the runner.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
    - name: Set up Python 3
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install requirements
      run: python -m pip install jupyter requests pandas beautifulsoup4
```

```{note}
GitHub has a detailed explanation of every keyword on [this](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions#understanding-the-workflow-file) page.
```

Before writing code to run the scraper, we will once again use the `uses` keyword to specify that the following step will also run `v2` of the actions/checkout action.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
    - name: Set up Python 3
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install requirements
      run: python -m pip install jupyter requests pandas beautifulsoup4
    - uses: actions/checkout@v2
```

Now that we have Python 3 and all the requirements installed, let's run the code, just like we would from the terminal.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
    - name: Set up Python 3
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install requirements
      run: python -m pip install jupyter requests pandas beautifulsoup4
    - uses: actions/checkout@v2
    - name: Run scraper
      run: jupyter execute scrape.ipynb
```

Let's add a step to commit our changes after running the scraper, and push those changes.

```
name: Automated scrape

on:
  schedule:
    - cron: "0 8 * * *" # 9 a.m. every day UTC
  workflow_dispatch:

jobs:
  scrape:
    runs-on: ubuntu-latest
    steps:
    - name: Set up Python 3
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install requirements
      run: python -m pip install requests pandas beautifulsoup4
    - uses: actions/checkout@v2
    - name: Run scraper
      run: jupyter run scrape.ipynb
    - name: Add and commit
      run: |-
        git add --all
        git config user.name "Automated"
        git config user.email "actions@users.noreply.github.com"
        git commit -m "Latest data" 
    - name: Push
      run: git push
```

## Commit your changes

Next, commit these changes to GitHub. 

```
git add --all
git commit -m "updated workflow"
git push origin main
```

## Run the Action manually on GitHub

Let's go to GitHub and test the Action manually. Navigate back to your repository and click on the "Actions" tab. Click on "Automated scrape," which is the name we gave our workflow.

![go back to actions tab in github](./_static/actions-go-back-to-page.png)

Push the "Run workflow" button, and then the "Run workflow" button once again to execute the action manually.

Watch Actions run the notebook in GitHub and log the data into the repository.
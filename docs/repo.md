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

# Create a repository

This chapter will walk you through how to make a repository hosted by GitHub that holds code you can edit on your local computer.

## Getting started on GitHub

The first step is to visit [github.com](https://www.github.com).

![github.com](_static/repo-github.png)

If you have an account, you should [log in](https://github.com/login). If you don’t have an account, you'll need to [make one](https://github.com/signup). Once that's done GitHub will take you to [your personal homepage](https://github.com/).

![signed in](_static/repo-signin.png)

Click the green button in upper-left corner to create a [new code repository](https://github.com/new).

![new repo button](_static/repo-new-button.png)

On the next page, fill in a name for your repository. Something like `my-first-github-scraper` will work, but you can name it anything you like.

Make sure the repo is public — which ensures your scraper will run for free — and then hit the big green button at the bottom of the page.

![make new repo](_static/repo-new-repo.png)

## Clone the repository

Whether you know about it or not, there should be a way to open a window and directly issue commands to your operating system. Different operating systems give this tool slightly different names, but they all have some form of it.

On Windows this is called the “command prompt.” On MacOS it is called the “terminal.” Other people will call this the “command line.”

On Windows 10, we recommend you install the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and select the Ubuntu distribution from the Windows Store. This will give you access to a generic open-source terminal without all the complications and quirks introduced by Windows. On MacOS, the standard terminal app will work fine.

Depending on your operating system and personal preferences, open up a terminal program. It will start you off in your computer’s home directory, just like your file explorer. Enter the following command and press enter to see all of the folders there now.

```bash
ls
```

Now let’s check where we are in our computer's file system. For this we'll use a command called [pwd](https://en.wikipedia.org/wiki/Pwd), which stands for present working directory. The output is the full path of your location in the file system, something like `/Users/palewire/`.

```bash
pwd
```


Use the [mkdir](https://en.wikipedia.org/wiki/Mkdir) command to create a new directory for your code. In the same style as the Desktop, Documents and Downloads folders included by most operating system, we will name this folder Code.

```bash
mkdir Code
```

To verify that worked, you can open in your file explorer and navigate to your home folder. Now jump into the Code directory, which is the same as double clicking on a folder to enter it in your filesystem navigator.

```bash
cd Code
```

This is where we'll clone a copy of your repository, which we'll edit locally and then push back up to GitHub.

There are numerous methods for cloning code, covered in [GitHub’s documentation](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). This tutorial will demonstration how to use the [`gh`](https://cli.github.com/) command-line utility. If you don't have it installed, visit [cli.github.com/](https://cli.github.com/) and follow the instructions there.

You can verify you have it by executing the following command, which should print out the version you have installed.

```bash
gh --version
```

The output should look something like this:

```bash
gh version 2.5.1 (2022-02-15)
https://github.com/cli/cli/releases/tag/v2.5.1
```

```{note}
If you get an error instead, open a fresh terminal and try again. Still not there? Revisit [cli.github.com](https://cli.github.com) to make sure you've followed all the necessary steps.
```

* Clone it to your computer

```bash
gh clone palewire/bens-first-github-scraper
```

* `cd` into the code directory

```bash
cd bens-first-github-scraper
```

* Install the dependencies (pipenv install jupyterlab, bs4)

```bash
pipenv install jupyterlab requests bs4
```

* Commit the Pipfile and push to github

```bash
git status
```

```bash
git add .
```

```bash
git commit -m "First commit"
```

```bash
git push origin main
```

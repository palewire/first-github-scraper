```{include} _templates/nav.html
```

# Create a repository

This chapter will walk you through how to make a repository hosted by GitHub that holds code you can edit on your local computer.

```{contents} Sections
  :depth: 1
  :local:
```

## Get started on GitHub

The first step is to visit [github.com](https://www.github.com).

![github.com](_static/repo-github.png)

If you have an account, you should [log in](https://github.com/login). If you don’t have an account, you'll need to [make one](https://github.com/signup). Once that's done GitHub will take you to [your personal homepage](https://github.com/).

![signed in](_static/repo-signin.png)

Click the green button in upper-left corner to create a [new code repository](https://github.com/new).

![new repo button](_static/repo-new-button.png)

On the next page, fill in a name for your repository. Something like `my-first-github-scraper` will work, but you can name it anything.

Make sure the repo is public, which ensures your scraper will run for free. Then hit the green button at the bottom of the page.

![make new repo](_static/repo-new-repo.png)

## Enter the command line

Whether you know it or not, there is a way to open a special window and directly issue commands to your operating system. Different systems give this tool slightly different names, but they all have some form of it.

On Windows this is called the “command prompt.” On MacOS it is called the “terminal.” Others may call it the “command line.” They’re the same thing, just in different slightly shapes.

This is the tool we’ll use to make a copy of your repository on your computer. Depending on your operating system and personal preferences, open a terminal program so we can get started.

```{note}
If you're a Windows user, we recommend you avoid the standard command line provided by the operating system. Instead, you'd be well served by the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10), which will create a development environment better suited for open-source software work.

We recommend you install the Ubuntu distribution from the Windows Store. This will give you access to a generic terminal without the quirks of Windows.
```

Once you have your terminal open, it will start you off in your computer’s home directory, much like your file explorer.

Let’s verify that using a command called [`pwd`](https://en.wikipedia.org/wiki/Pwd), which stands for present working directory. The output is the full path of your terminal’s current location in the file system. You should get back something like `/Users/palewire/`.

```bash
pwd
```

Next let’s enter the [`ls`](https://en.wikipedia.org/wiki/Ls) command to see all of its subdirectories. The terminal should print out the same list of folders you can see in your home directory via the file explorer.

```bash
ls
```

## Create a code directory

Our first task is to create a folder to store our code.

Use the [`mkdir`](https://en.wikipedia.org/wiki/Mkdir) command to create a new directory in the same style as the Desktop, Documents and Downloads folders included by most operating systems.

We will name this folder `Code`. To verify the command works, open the file explorer and navigate to your home folder. After it’s run, you should see the new directory alongside the rest.

```bash
mkdir Code
```

Now jump into the new directory with the [`cd`](https://en.wikipedia.org/wiki/Cd_(command)) command, which operates the same as double clicking on a folder in your file explorer.

```bash
cd Code
```

This is the location where we’ll download a copy of your repository.

## Clone the repository

There are numerous methods for cloning code, covered in [GitHub’s documentation](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). This tutorial will demonstrate how to use the [`gh`](https://cli.github.com/) command-line utility. If you don't have it installed, visit [cli.github.com](https://cli.github.com/) and follow the instructions there.

You can verify you’re ready by executing the following command, which should print out the version of `gh` you have installed.

```bash
gh --version
```

The output should look something like this:

```bash
gh version 2.5.1 (2022-02-15)
https://github.com/cli/cli/releases/tag/v2.5.1
```

```{note}
If you get an error instead, open a fresh terminal and try again. If it’s still not working, revisit [cli.github.com](https://cli.github.com) to make sure you've followed all the necessary steps.
```

Use `gh` to login to GitHub, which will verify that your computer has permission to access and edit the repositories owned by your account.

```bash
gh auth login
```

After you authenticate, it’s time to clone the new repository we created. Edit the code below by inserting your user name and repository. Then run it.

```bash
gh repo clone <your-username>/<your-repo>
```

In my case, the command looks like this:

```bash
gh repo clone palewire/my-first-github-scraper
```

After clone completes, run the `ls` command again. You should see a new folder created by `gh`.

```bash
ls
```

Use `cd` to move into the directory, where we can begin work.

```bash
cd my-first-github-scraper
```

Next we’ll install a Python web scraper and start downloading data.

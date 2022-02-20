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

The first step is to visit [github.com](https://www.github.com).

![github.com](_static/repo-github.png)

If you have an account, you should [log in](https://github.com/login). If you don’t have an account, you'll need to [make one](https://github.com/signup). Once that's done GitHub will take you to [your personal homepage](https://github.com/).

![signed in](_static/repo-signin.png)

* Sign in to GitHub
* Create a blank new repository
* Open your terminal
* Create/move to a Code directory

```bash
mkdir Code
```

```bash
cd Code
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

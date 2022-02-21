```{include} _templates/nav.html
```

# Save the data

* Add a new step to the Action that commits the data file after the scrape. It should continue a bug.
* Open the data file and remove one line of data
* Commit that change and push to GitHub
* Run the scraper manually again from the Action tab
* Watch the job crash
* Point out that you get freebie notification in your email
* Open the job on github and read the error message. Help people diagnose the bug.
* Patch the bug locally.
* Commit and push again.
* Run the scraper manually again.
* Inspect to the data file to see the commit caused by our scraper
```{include} _templates/nav.html
```

# Blast the results

This chapter will walk you through creating a custom slack message for your action. 

```{contents} Sections
  :depth: 1
  :local:
```

## Join the channel and send a message

Join `#first-github-scraper` at nicar2022.slack.com

Slack's [Incoming Webhooks](https://api.slack.com/messaging/webhooks) allow you to send messages from your apps. Read [this](https://slack.com/help/articles/115005265063-Incoming-webhooks-for-Slack) for instructions on how to create one for your slack channel.  

The webhook for the first github scraper channel has been created and saved as an environment variable on your computer. Let's make sure we have them. 

```bash
echo $SLACK_WEBHOOK
```

# ADD SECRETS PART HERE 

Let's try to send a simple message using the channel's webhook.

```bash
curl -d '{"text":"Hello world. I am Iris :wave:"}'  $SLACK_WEBBHOOK
```

## The Github Actions Marketplace

Common actions used in workflow can be found in github actions [marketplace](https://github.com/marketplace?type=actions).

Let's use [this](https://github.com/marketplace/actions/slack-incoming-webhook) pre-packaged action command to add slack messaging to our workflow. 


## Creating custom slack messages

Add the below code to create a slack message you would like to see when your scrape succeeds. Remember to replace `${{ secrets.SLACK_WEBHOOK_URL }}` with the actual value of `$SLACK_WEBHOOK`. 

First step sets the commit message as a variable to be re-used. 

```
        - name: Set COMMIT_MESSAGE
            run: echo "COMMIT_MESSAGE=${{ github.event.head_commit.message }}" | tr '\n' ' ' >> $GITHUB_ENV
        - name: Slack Notification on SUCCESS
        if: success()
        uses: tokorom/action-slack-incoming-webhook@main
        env:
            INCOMING_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
        with:
            text: A successful scrape!
            attachments: |
            [
                {
                "color": "good",
                "author_name": "${{ github.actor }}",
                "author_icon": "${{ github.event.sender.avatar_url }}",
                "fields": [
                    {
                    "title": "Commit Message",
                    "value": "${{ env.COMMIT_MESSAGE }}"
                    },
                    {
                    "title": "GitHub Actions URL",
                    "value": "https://github.com/${{github.repository}}/actions/runs/${{github.run_id}}"
                    },
                    {
                    "title": "Commit URL",
                    "value": "https://github.com/${{github.repository}}/commits"
                    }
                ]
                }
            ]
      
```

Just below, add another step for a message created when your scrape fails. 

```
        - name: Slack Notification on FAILURE
        if: failure()
        uses: tokorom/action-slack-incoming-webhook@main
        env:
            INCOMING_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
        with:
            text: Something went wrong.
            attachments: |
            [
                {
                "color": "bad",
                "author_name": "${{ github.actor }}",
                "author_icon": "${{ github.event.sender.avatar_url }}",
                "fields": [
                    {
                    "title": "GitHub Actions URL",
                    "value": "https://github.com/${{github.repository}}/actions/runs/${{github.run_id}}"
                    }
                ]
                }
            ]
      
```

Edit your action file to trigger a fail. For example, a simple change in `pipenv run jupyter execute scrape.ipynb` to `pipenv run jupyter execute s.ipynb` is going to trigger a fail. Let's see what happens to your slack message. 

![fail slack message](./_static/slack1.png)
## Using github environment variables

In the previous chapter, we added a line of code `git diff --exit-code || git commit -am "adding new data"` that would force this workflow to succeed even when there was nothing to commit. This means we have two different definitions of "success". To distinguish the two different outcomes, we will store the outcome of `git status` in a variable to be evaluated later. 

Just before your commit step, add the following. 

```
    - name: Check file
      id: check_file
      run: |
        if [ -n "$(git status --porcelain)" ]; then
          echo "::set-output name=file_change::true"
        else
          echo "::set-output name=file_change::false"
        fi

```

This step will create a variable `steps.check_file.outputs.file_change` that changes depending on your `git status`. 

For your first slack message where new files are committed, change the condition from `sucess()` to 

```
if: success() & steps.check_file.outputs.file_change=='true'
```

Now let's add one last slack message for a successful run without a new file commit. 


```
    - name: Slack Notification on no new commits
      if: success() & steps.check_file.outputs.file_change=='false'
      uses: tokorom/action-slack-incoming-webhook@main
      env:
        INCOMING_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
      with:
        text: Nothing was committed
```

## Secrets??


# Jekyll basics

Install jekyll

Serve a local auto-updating instance:

```
# cd into this repo's root dir
jekyll serve
```

Then edit away.

Schedule is in _includes/schedule.md

Markdown should be self-explanatory, otherwise see https://kramdown.gettalong.org/quickref.html

Note that some JS will be served from the live site.  You can change the `url` parameter (`site.url`) in `_config.yml` to serve this locally but **don't commit this back to the repo**.

# git

If you work on a branch for structural changes, we can test/review locally before merging to master (and using up CI free tier), otherwise just add regular updates straight in master.

# CI

Using buddy.works - contact Bob for accesss.  Push/merge to master and the site will update.

# Theme

MAD4Jekyll - http://jekyllthemes.org/themes/MAD4Jekyll/  and https://github.com/madforjekyll/madforjekyll.github.io

I (Bob) **massively** chopped it down, including some items in the nav bar.  Refer to original to get those back if we need them.  We probably will need some navigation!

I didn't "install" it per se. Maybe I did this wrong... Jekyll themes don't seem to be trivial. I copied the whole github repo and changed what I needed and tried to delete the rest.  So swapping to another theme isn't going to be painless.


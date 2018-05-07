# About

This is the deployed repository for the workshop website.

## Structure

The directory structure is as follows.

```
workshopwww
├── 2017
├── 2018
├── CNAME
├── README.md
├── buildSubsite.sh
├── deploy.sh
├── index.html
├── workshop2017
└── workshop2018
```

Note that there is a `.gitignore` file in workshopwww with the following
entries:

```
workshop2017/
workshop2018/
```

`buildSubsite.sh` should be copied as `buildSite.sh` into the `scripts/` folder
that sits in the home directory of any `workshop20XY/` site. `deploy.sh` calls
`buildSite.sh` function for each `workshop20XY` folder to build the site in
`public/20XY`. This folder then gets moved to `workshopwww/` as a folder named
`20XY`. Each `workshop20XY` site repository could have its own GitHub
repository - `workshop2017` and `workshop2018` each have an eponymous one on the
`bcdataca` organization.

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


## HTML stuff

Currently, `index.html` is used to re-direct to the 2017 site. Eventually this
will be changed to the 2018 site and is easy to do.

`CNAME` is a file that must contain only the domain: `workshop.bcdata.ca`. It
has a matching entry on the namecheap.com domain along with a couple lines there
that allow namecheap to work with Github Pages.

The `workshop20XY` sites are built using `hugo` and the `academic` theme. Note
that the `academic` theme is not copied to `origin`, and so the right local
version must be maintained. Specifically, academic theme version/checkout
`18ab238` is used by both sites. Note that these sites are not compatible with
the current version of hugo-academic.

Small note to self: I have made minor changes to that particular checkout;
however, at the time of this writing (literally a year later), I have some small
margin of confidence that these same changes are made in the
`workshop20XY/layouts` folders, too, hence there is nothing to worry about
probably.

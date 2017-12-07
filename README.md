# Brewfection

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

## Deploying the app

``` bash
# pull latest master locally
git pull

# After any changes
# build it
npm run build

# add/commit the changes
git add .
git commit -m "What was changed"

# push dist directory to heroku branch
git push origin `git subtree split --prefix dist master`:heroku --force
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).

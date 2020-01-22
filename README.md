# hugo-docker-template

is a template for convenient work with [Hugo](https://gohugo.io/) on the local environment.

## How to Use

Let's assume that you have GitHub account **my_account** and you are planning to create project with name **my_project** and web site **my_web_site**. There are some opportunities.

### Pre Requirements

You need to modify *.env* file. Please edit following info.

```bash
HUGO_VERSION=0.62.2
UID=1000
GID=1000
```

Here replace HUGO_VERSION with a preferred Hugo version. And if you are Linux user please replace UID and GID values with your user id and group id. You can find you user/group id in terminal

```bash
$ id -u
1000
$ id -g
1000
```

If you are Windows user please do not change UID/GID values.

### New Hugo Project

#### With Hugo Academic theme
Here is my favorite way to work with Hugo and [Hugo Academic](https://sourcethemes.com/academic/) theme:

1. Check GitHub's "Use this template" button and create your own private **my_account/my_project** project. It's highly recommend as It allows you to be independent of this repository.

2. Clone your new project

   ```bash
   $ git@github.com:my_account/my_project.git
   $ cd my_project
   ```
3. Let's create mirror of [academic-kickstarter](https://github.com/sourcethemes/academic-kickstart#fork-destination-box) and then clone it to **my_site** directory 
   ```bash
   $ git clone --bare git@github.com:sourcethemes/academic-kickstart.git
   $ cd academic-kickstart.git
   $ git push --mirror git@github.com:my_account/my_web_site.git
   $ cd ..
   $ rm -rf academic-kickstart.git
   $ git clone git@github.com:my_account/my_web_site.git my_site
   ```
5. set preferred academic version
   ```bash
   $ git submodule update --init --recursive
   $ cd themes/academic
   $ git checkout v4.7.0
   ```
6. and run docker-compose from the project's root
   
   ```bash
   $ docker-compose up -d
   ```
9. if everything is ok just try http://localhost:1313/ and you will see your new site with academic theme.
#### Plain Hugo Project
1. Check GitHub's "Use this template" button and create your own private **my_account/my_project** project. It's highly recommend as It allows you to be independent of this repository.

2. Clone your new project

   ```bash
   $ git@github.com:my_account/my_project.git
   $ cd my_project
   ```

4. create empty directory my_site
   
   ```bash
   $ mkdir my_site
   ```

5. run docker with a command

   ```bash
   $ docker-compose run --rm web bash
   ```
   You have to wait a little while new image is creating.

5. now you can follow Hugo. For example let's make some steps from quickstart tutorial - create site, add theme and create new post.

   ```bash
   $ hugo new site ./
   $ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
   $ echo 'theme = "ananke"' >> config.toml
   $ hugo new posts/my-first-post.md
   $ exit
   ```

8. and run docker-compose
   
   ```bash
   $ docker-compose up -d
   ```
9. if everything is ok just try in your browser http://localhost:1313/posts/my-first-post/ and you will see your new site.

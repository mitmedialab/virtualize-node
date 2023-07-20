# virtualize-node
Utility package to assist in installing and using node local to a specific project, kind of like a python 'virtual environment', but for node.

# Getting Started

## Add virtualize-node to your project
This package is intended to be added to an existing project that will/does utilize [node](https://nodejs.org/en/) (likely as one of the first things you do when setting up the project).

### Adding as a git submodule to your project's repo (recommended)

It is likely best to add virtualize-node as [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules). 

> **NOTE:** Using git submodules is a little controversial, so please checkout the [Why install this package as a git submodule](#why-install-this-package-as-a-git-submodule) to make sure the potential 'gotchas' don't worry you. If they do, simply download the contents of this repo and add it to your project's folder structure -- see [below](#adding-this-as-a-directory-in-your-projects-folder-structure-no-git) for help. 

Using **SSH**
```bash
git submodule add git@github.com:mitmedialab/virtualize-node.git 
```

Using **HTTPS**
```bash
git submodule add https://github.com/mitmedialab/virtualize-node.git
```

Commit and push the addition of virtualize-node to your project
```bash
git add .gitmodules virtualize-node
git commit -m "Added virtualize-node package as a git submodule to my project"
git push
```

### Adding this as a directory in your project's folder structure (no git)

Click [here](https://github.com/mitmedialab/virtualize-node/archive/refs/heads/main.zip) to download a zip of this project. 

Drag it into your project and unzip it. 

## Using your virtualize-node

Once you have a copy of virtualize-node in your project, run the following command to utilize it:

```bash 
source virtualize-node/activate.bash
```

### Create a './activate' at your project's root (recommended)

If you get down with the motivation behind this package, you might adopt other 'local' installs to help ensure a project can be completely self-contained (e.g. virtual python environments; heck, maybe even a docker image -- the latter might also obsolete this package, though...).

If so, having a single `activate` file that coordinates all of your project's setup activities could be very helpful.

For example, if you are using (1) python virutal environments and (2) this package to have a local node install, you might have a file that looks like the following at the root of your project:

```bash
# inside of <your project directory>/activate

# activate python virtual environment 
source ./python/bin/activate

# activate local node version
source ./virtualize-node/activate
```

You can then advise your fellow developers to always `source ./activate` as soon as they `cd` into your project.  

# Why install node locally?

... work in progress ...

### But won't this 'waste' space?

... work in progress ...

# Why install this package as a git submodule?

... work in progress ...
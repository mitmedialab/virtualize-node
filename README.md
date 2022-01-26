# local-node-install
Utility package to assist in installing and using node local to a specific folder, kind of like a 'virtual environment' for node.

# How to get started
This package is intended to be added to an existing project that will/does utilize [node](https://nodejs.org/en/) (likely as one of the first things you do when setting up the project).

It is recommended to add this project as [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Using git submodules is a little controversial, so please checkout the [Why install this package as a git submodule](#why-install-this-package-as-a-git-submodule) section to make sure the potential 'gotchas' don't worry you. If they do, simply download the contents of this repo and add it to your project folder structure. 

### Adding as a git submodule to your project's repo

### Adding this as a directory in your project's folder structure (no git)

### Using your local-node-install

```bash
source activate.bash
```

### Changing the version of node

Update the value of the `VERSION` variable inside of of the [version.bash file](version.bash).

Then (re)run:
```bash
source activate.bash
```
...which will handle (1) uninstalling the previous vode version, and (2) installing the new desired version.

### RECOMMENDED: Create a 'activate.bash' at your project's root

# Why install node locally?

### But won't this 'waste' space?

# Why install this package as a git submodule?

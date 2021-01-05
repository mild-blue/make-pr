# Make-pr

if you want to start working on an issue run this script in the project based on the brach you want to make the 
PR into. The script creates new brach, creates a PR for given issue and checkouts this new branch for you.


## Prerequisites
You need to install and setup gh cli to make this work. Should be easy: https://github.com/cli/cli

## Adding to PATH
In order to execute the script without calling it with the full path, one can add this repo to `PATH`:
* run `pwd` commmand
* open `~/.bashrc` or `~/.zshrc` depending on your shell
* add the following line to the file (replace `<output of pwd>` with the actuall output)
```bash
export PATH="$PATH:<output of pwd>"
```
* refresh shell (either close it or run `source ~/.bashrc`)
* call the script from the project (TXM etc.) repo:
```bash
mb-pr -i <issue number>
```
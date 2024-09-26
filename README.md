# bws_shell_utils
A collection of shell utilities for Bitwarden Secret Manager

## What is it?
Bitwarden offers an interesting secret management solution, whose free plan is perfectly suited for personal use. In the free plan, you can create up to 3 machine accounts and an unlimited number of secrets.
This library of utilities was created to facilitate everyday use and encourage the use of a secret manager instead of saving your credentials on disk.


## Requirements

* [Bitwarden Secrets Manager CLI](https://github.com/bitwarden/sdk/releases)
* [Jq](https://jqlang.github.io/jq/) CLI processor

Also make sure you have a valid token for your computer and the BWS_ACCESS_TOKEN variable set for your shell before calling the functions.

## Installation
Currently only manual installation is available, which is very simple anyway.
* clone the repository into the ~/.bws_shell_utils directory:   
`git clone git@github.com:elogiclab/bws_shell_utils.git -o ~/.bws_shell_utils`
* add the following line in your ~/.bashrc|~/.zshrc file:   
`source ~/.bws_shell_utils/bws_utils.sh`

You can of course source the file immediately to have the functions available on the current shell.

## Commands
### bws_get
#### Usage:
```
bws_get -k <secret_key> [-e <variable_name>] [-o <file_name>]
```
#### Description:
Reads the secret corresponding to the key <secret_key>. The value returned is stored into the variable <variable_name> if given, in the file <file_name> if given, or printed to stdout otherwise. When it is stored in a variable it is also exported.

### bws_source
#### Usage:
```
bws_source -k <secret_key>
```
#### Description:
Apply (source) the secret corresponding to the <secret_key> in the current shell. It is intended to receive a list of VARIABLE=VALUE assignments.

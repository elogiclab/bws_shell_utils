# bws_shell_utils
A collection of shell utilities for Bitwarden Secret Manager

## What is it?
Bitwarden offers an interesting secret management solution, whose free plan is perfectly suited for personal use. In the free plan, you can create up to 3 machine accounts and an unlimited number of secrets.
This library of utilities was created to facilitate everyday use and encourage the use of a secret manager instead of saving your credentials on disk.


## Requirements

* [Bitwarden Secrets Manager CLI](https://github.com/bitwarden/sdk/releases)
* [Jq](https://jqlang.github.io/jq/) CLI processor

Also make sure you have a valid token for your computer and the BWS_ACCESS_TOKEN variable set for your shell.

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
bws_get <secret_key>
```
#### Description:
Reads the secret corresponding to the key <secret_key> and prints it to standard output.

### bws_source
#### Usage:
```
bws_source <secret_key>
```
#### Description:
Apply (source) the secret corresponding to the <secret_key> in the current shell. For example, suppose we have a secret identified with the key `my_restic_credentials` like this:
```
AWS_ACCESS_KEY_ID=xxxxx
AWS_SECRET_ACCESS_KEY=dddd
RESTIC_REPOSITORY=s3:my.s3.bucket.url
RESTIC_PASSWORD=myPassword
```
You can call the command `bws_source my_restic_credentials` before working with restic to manipulate your backups.


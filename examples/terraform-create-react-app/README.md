# React App inside Terraform Docker

This example is a react app, created with `npx create-react-app react`
and later added the folders `infrastructure` and `scripts`.

## Benefits using this infrastructure

* Replaces `docker-compose.yml` file.
* Possibility to create multiple envs, deployed to cloud providers
* Easy uninstall with `scripts/uninstall.sh`

## Requirements

* Node
* Terraform
* Docker

## Getting Started

Setup the project locally

```
./scripts/setup.sh
```

Open in the browser

http://localhost:10124

# Uninstall

Use this to uninstall this infrastructure completely from your system!

```
./scripts/uninstall.sh
```

### Trash after uninstall

No trash because `uninstall.sh` takes care of it

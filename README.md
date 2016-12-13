# redborder development containers

This repo contains Dockerfiles associates to some redborder's applications.
Images created using Dockerfiles on this repo will generate a development ready
environment. It's mainly used by developers and CI tools and **is not**
meant to use on production.

## Pull requests

You have to satisfy the following requirements if you make a pull request:

- You **MUST** use the "template-dockerfile" on the root of the repo as
template.
- You **MUST** not modify the template. Add new lines **after** the base
template.
- You **SHOULD** keep in sync with the base branch using rebase.

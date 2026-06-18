# Contributing

Thanks for contributing to `modules-tf-leafcloud`.

This repository is a collection of Terraform modules. The repository root is not a deployable Terraform stack.

## Module Structure

Each module lives in its own directory under `modules/`:

- `modules/app-credential`
- `modules/ec2-credential`
- `modules/containers`

A module should contain, where applicable:

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `providers.tf`

## Prerequisites

- Terraform `~> 1.13`
- `pre-commit`
- `tflint`
- `terraform-docs` (used by pre-commit hook)

## Setup

```bash
pre-commit install
```

## Validation Workflow

Run all hooks before opening a PR:

```bash
pre-commit run --all-files
```

Terraform checks are scoped to module directories and run:

- formatting (`terraform_fmt`)
- validation (`terraform_validate`)
- docs generation (`terraform_docs`)
- linting (`terraform_tflint`)

## Documentation Standards

- Keep each module README accurate and minimal.
- Ensure variable and output descriptions are clear and consistent.
- Avoid stale references to modules that do not exist.

## Commit Message Convention

This repository enforces conventional commit prefixes via `committed`.

Examples:

- `FEAT: add region input to containers module`
- `FIX: correct app-credential README source path`
- `DOCS: update contributing guide`

See `committed.toml` for full rules.

## Pull Requests

When opening a PR:

- explain what changed and why
- include module(s) affected
- include validation output or state that pre-commit passed
- keep changes focused and small where possible

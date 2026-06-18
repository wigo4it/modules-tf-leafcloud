# Terraform Modules for Leafcloud

This repository contains reusable Terraform modules for Leafcloud.

## Available Modules

- `modules/app-credential`: Creates an OpenStack application credential and stores it in Azure Key Vault.
- `modules/ec2-credential`: Creates an OpenStack EC2 credential and stores it in Azure Key Vault.
- `modules/containers`: Creates one or more OpenStack Object Storage containers.

## Repository Layout

```text
modules/
 app-credential/
 ec2-credential/
 containers/
```

Each module is independently validated and documented.

## Development and Validation

Install hooks:

```bash
pre-commit install
```

Run all checks:

```bash
pre-commit run --all-files
```

Terraform hooks are scoped to `modules/*` and include:

- `terraform_fmt`
- `terraform_validate`
- `terraform_docs`
- `terraform_tflint`

## Commits and Releases

Changes merged into `main` automatically create tags and releases based on semantic versioning.

Version bumps are derived from conventional commit messages:

- `FEAT:` -> minor
- `FIX:` -> patch
- `BREAKING CHANGE` -> major
- `DOCS:`, `refactor:`, `test:`, `style:`, `REVERT:` -> patch

See `committed.toml` for the enforced commit message rules.

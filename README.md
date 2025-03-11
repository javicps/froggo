# Froggo

Froggo is a CLI tool to provision infrastructure resources. It can

## Install

1. Install and configure <a href="https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli">Terraform</a>

2. Install the Froggo executable

   ```shell
   pip install --editable .
   ```

## Database commands (db)

### db up

Clones a production Aurora DB database in development

```shell
froggo db up
```

You can optionally pass the database name:

```shell
froggo db up mydb
```

### db down

Destroys a development Aurora DB database

```shell
froggo db down
```

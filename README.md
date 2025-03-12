# Froggo

Froggo is a CLI tool for development infrastructure resources. Its purpose is to provision AWS resources via terraform commands

## 📋 Features

- Cloning a production Aurora MySQL database as a development version
- Destroying development clones in AWS
- Creating users in AWS
- Deleting AWS users

## 📦 Installation

1. Clone the repository

```
git@github.com:javicps/froggo.git
```

2. Install and configure <a href="https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli">Terraform</a>

3. Install the Froggo executable

   ```shell
   # In the froggo root folder
   pip install --editable .
   ```

## 🛠️ Database commands (db)

### db up

Clones a production Aurora DB database in development. The command returns the development DB endpoint to connect to

```shell
froggo db up

...

Outputs:

development_db_endpoint = "fast-clone-db-cluster.cluster-c98s64mmo74x.eu-west-1.rds.amazonaws.com"
```

You can optionally pass the database name:

```shell
froggo db up --name myinstance

froggo db up -n myinstance
```

### db down

Destroys a development Aurora DB database

```shell
froggo db down
```

You can optionally pass the database name:

```shell
froggo db up --name myinstance

froggo db up -n myinstance
```

## Contributing

Read the [contributing file](CONTRIBUTING.md)

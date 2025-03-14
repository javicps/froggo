# Froggo

Froggo is a CLI tool for development infrastructure resources. Its purpose is to provision AWS resources via terraform commands

## 📋 Features

- Cloning a production Aurora MySQL database as a development version
- Destroying development databases in AWS
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

Froggo can create a development Aurora DB clone of the current production database.
IMPORTANT: These databases are for development purposes only. They should be short-lived, so remember to destroy them once you have used them.

### db up

Clones a production Aurora DB database in development. The command returns the development DB endpoint to connect to.

```shell
froggo db up

...

Outputs:

Database created. Use this information to connect:
endpoint: dev-newfrog2-20250314012408.cluster-c98s64mmo74x.eu-west-1.rds.amazonaws.com
port: 3306
user: admin
password: password
```

Parameters:

| Short format | Long format | Description                                                                                                 | Default value |
| ------------ | ----------- | ----------------------------------------------------------------------------------------------------------- | ------------- |
| -n           | --name      | Provides a string that will be included in the Database that will be created (e.g: dev-NAME-20250314084451) | cluster       |
| -r           | --region    | The AWS region where the database will be created                                                           | eu-west-1     |
| -o           | --origin    | Provides an identifier of the original Aurora production db to be cloned                                    | frogdb        |
| -p           | --password  | Provides the password for the new development database                                                      | pass1234!     |

### db down

Destroys a development Aurora DB database

```shell
froggo db down
```

Parameters:

| Short format | Long format | Description                                                             | Default value |
| ------------ | ----------- | ----------------------------------------------------------------------- | ------------- |
| -n           | --name      | The string of the database to destroy (e.g: dev-newfrog2-20250314012408 | cluster       |
| -r           | --region    | The database AWS region                                                 | eu-west-1     |

## 🧑‍💼 User commands

### user create

Creates a new AWS user

```shell
froggo user create
```

### user delete

Deletes an AWS user

```shell
froggo user delete --name elon
```

## Contributing

Read the [contributing file](CONTRIBUTING.md)

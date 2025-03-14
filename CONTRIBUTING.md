# Contributing

Froggo is open to contributions.

## Extending

If you want to create a new command for Froggo, follow the next steps:

1.  Create a new folder under <code>commands</code>
2.  Add a .py file with the group and commands:

    ```python
         @click.group()
         def newGroup():
         """A new group for Froggo"""

         @db.command()
         def newCommand():

    ```

3.  Inside the command you can use methods from aws.py, like init_and_apply or init_and_destroy to execute terraform resources

4.  Add the group as a command in froggo.py

    ```python
    cli.add_command(newGroup)
    ```

## TODO and new features

Upcoming features and nice-to-haves:

- "froggo db up" should allow creating multiple instances. We can store in a local file all current identifiers for the aurora dbs, then in the terraform file use:

```
  for_each             = var.clone_list
  cluster_identifier   = "dev-${each.key}"
```

- Explore using <a href="https://aws.amazon.com/es/sdk-for-python/">boto3</a> as this could be a much faster way of handling AWS resources than Terraform.

- Add a "froggo db list" command to list all current aurora db instances created by the current user.

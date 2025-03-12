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

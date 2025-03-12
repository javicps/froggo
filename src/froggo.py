import click
from commands.aurora.aurora import aurora
from commands.db.db import db
from commands.user.user import user


@click.group()
def cli():
    """CLI tool to provision a database using Terraform"""
    pass


cli.add_command(db)
cli.add_command(user)
cli.add_command(aurora)

if __name__ == "__main__":
    cli()

import click
from db.db import db


@click.group()
def cli():
    """CLI tool to provision a database using Terraform"""
    pass


cli.add_command(db)

if __name__ == "__main__":
    cli()

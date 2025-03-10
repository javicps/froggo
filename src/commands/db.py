import click
from aws.aws import run_terraform_command


@click.group()
def db():
    """CLI tool for managing Aurora DBs with Terraform."""

@db.command()
def up():
    """Provision Aurora Databases for development"""
    run_terraform_command("terraform init")
    click.echo(f'Provisioning a new DB!')
    pass

@db.command()
def down():
    """Provision Aurora Databases for development"""
    click.echo(f'Destroying the DB!')
    pass

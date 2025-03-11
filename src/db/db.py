import click
from aws.aws import run_terraform_command


@click.group()
def db():
    """CLI tool for managing Aurora DBs with Terraform."""


@db.command()
def up():
    """Provision Aurora Databases for development"""
    click.echo(f'Provisioning a new DB...')

    if not run_terraform_command("db", "init"):
        return
    if not run_terraform_command("db", "plan"):
        return

    click.echo(f'DB provisioned...')

    pass


@db.command()
def down():
    """Provision Aurora Databases for development"""
    click.echo(f'Destroying the DB!')
    pass

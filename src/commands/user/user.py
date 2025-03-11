import click
from aws.aws import run_terraform_command


@click.group()
def user():
    """User management in AWS"""


@user.command()
def create():
    """Provision Aurora Databases for development"""
    click.echo(f'Creating new user...')
    if not run_terraform_command("user", "init"):
        return
    pass

import click
from aws.aws import run_terraform_command


@click.group()
def user():
    """User management in AWS"""


@user.command()
def create():
    """Provision AWS user for development"""
    click.echo(f'Creating new user...')
    if not run_terraform_command("user", "init"):
        pass

    if not run_terraform_command("user", "apply -auto-approve"):
        return
    print(f"User created successfully!")

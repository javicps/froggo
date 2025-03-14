import click
from aws.aws import init_and_apply, init_and_destroy


@click.group()
def user():
    """User management in AWS"""


@user.command()
@click.option('-n', '--name', required=True)
def create(name):
    """Provision AWS user for development"""
    click.echo(f'Creating new user...')

    if not init_and_apply('user', {'username': name}):
        return

    print(f"User created successfully!")


@user.command()
@click.option('-n', '--name', required=True)
def delete(name):
    """Deletes AWS user for development"""
    click.echo(f'Deleting user...')

    if not init_and_destroy('user', {'username': name}):
        return

    print(f"User deleted successfully!")

import click
from aws.aws import init_and_apply, init_and_destroy


@click.group()
def aurora():
    """Production database management in AWS"""


@aurora.command()
def create():
    """Provision AWS user for development"""
    click.echo(f'Creating new production DB...')

    if not init_and_apply('aurora'):
        return

    print(f"Production DB created successfully!")


@aurora.command()
def destroy():
    """Destroys Aurora AWS production"""
    click.echo(f'Destroying production DB...')

    if not init_and_destroy('aurora'):
        return

    print(f"Production DB destroyed successfully!")

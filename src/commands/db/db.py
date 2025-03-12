import click
from aws.aws import init_and_apply, init_and_destroy


@click.group()
def db():
    """CLI tool for managing Aurora DBs with Terraform."""


@db.command()
@click.option('-n', '--name', default='dev', required=False)
def up(name):
    """Provision Aurora Database for development"""
    click.echo(f'Provisioning a new DB...')

    if not init_and_apply('db'):
        return

    print(f'Database {name} created successfully!')


@db.command()
@click.option('-n', '--name', default='dev', required=False)
def down(name):
    """Destroys Aurora Database for development"""
    click.echo(f'Destroying the DB...')

    if not init_and_destroy('db'):
        return

    print(f'Database {name} destroyed successfully!')

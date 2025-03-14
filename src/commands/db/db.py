import click
from aws.aws import init_and_apply, init_and_destroy


@click.group()
def db():
    """CLI tool for managing Aurora DBs with Terraform."""


@db.command()
@click.option('-n', '--name', default='dev', required=False)
@click.option('-r', '--region', default='eu-west-1', required=False)
@click.option('-o', '--origin', default='frogdb', required=False)
@click.option('-p', '--password', default='pass1234!', required=False)
def up(name, region, origin, password):
    """Provision Aurora Database for development"""
    click.echo(f'Provisioning a new DB...')

    if not init_and_apply(
        'db',
        {'target_db_identifier': name, 'aws_region': region, 'origin_db_identifier': origin, 'db_password': password},
    ):
        return

    print(f'Database {name} created successfully!')


@db.command()
@click.option('-n', '--name', default='dev', required=False)
@click.option('-r', '--region', default='eu-west-1', required=False)
def down(name, region):
    """Destroys Aurora Database for development"""
    click.echo(f'Destroying the DB...')

    if not init_and_destroy('db', {'target_db_identifier': name, 'aws_region': region}):
        return

    print(f'Database {name} destroyed successfully!')

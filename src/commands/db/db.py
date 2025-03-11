import click
from aws.aws import run_terraform_command


@click.group()
def db():
    """CLI tool for managing Aurora DBs with Terraform."""


@db.command()
@click.argument("target_db_identifier", default="dev", required=False)
def up(target_db_identifier):
    """Provision Aurora Database for development"""
    click.echo(f'Provisioning a new DB...')

    run_terraform_command("db", "init")
    if not run_terraform_command("db", "plan"):
        return

    print(f"Database {target_db_identifier} created successfully!")

    pass


@db.command()
@click.argument('target_db_identifier', default='dev', required=False)
def down(target_db_identifier):
    """Destroys Aurora Database for development"""
    click.echo(f'Destroying the DB...')
    if not run_terraform_command("db", "init"):
        return
    if not run_terraform_command("db", "destroy -auto-approve"):
        return
    print(f"Database {target_db_identifier} destroyed successfully!")

    pass
